import UIKit
import SwiftUI
import BraintreeCore
import PayPalMessages

@objc public class BTPayPalMessagingView: UIView {

    public weak var delegate: BTPayPalMessagingDelegate?

    var apiClient: BTAPIClient

    @objc public init(apiClient: BTAPIClient) {
        self.apiClient = apiClient

        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // TODO: decide on name for this method
    @objc public func createView(_ request: BTPayPalMessagingRequest? = nil) {
        apiClient.fetchOrReturnRemoteConfiguration { configuration, error in
            if let error {
                self.delegate?.onError(self, error: error)
                return
            }
            guard let configuration else {
                // call delegate?.onError with custom error
                return
            }

            guard let clientID = configuration.json?["paypal"]["clientId"].asString() else {
                // call delegate?.onError with custom error
                return
            }

            let messageData = PayPalMessageData(
                clientID: clientID,
                environment: configuration.environment == "production" ? .live : .sandbox, 
                amount: request?.amount,
                placement: request?.placement.placementRawValue,
                offerType: request?.offerType.offerTypeRawValue
            )

            messageData.buyerCountry = request?.buyerCountry

            let messageConfig = PayPalMessageConfig(
                data: messageData,
                style: PayPalMessageStyle(
                    logoType: request?.logoType.logoTypeRawValue ?? .inline,
                    color: request?.color.messageColorRawValue ?? .black,
                    textAlignment: request?.textAlignment.textAlignmentRawValue ?? .right
                )
            )

            let messageView = PayPalMessageView(config: messageConfig, stateDelegate: self, eventDelegate: self)
            messageView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(messageView)

            NSLayoutConstraint.activate([
                messageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                messageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                messageView.topAnchor.constraint(equalTo: self.topAnchor),
                messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])

            return
        }
    }
}

// MARK: - UIViewRepresentable protocol conformance

public extension BTPayPalMessagingView {

    struct Representable: UIViewRepresentable {

        private let apiClient: BTAPIClient
        private var action: () -> Void = { }

        public init(apiClient: BTAPIClient, _ action: @escaping () -> Void = { }) {
            self.apiClient = apiClient
            self.action = action
        }

        public func makeUIView(context: Context) -> BTPayPalMessagingView {
            BTPayPalMessagingView(apiClient: apiClient)
        }

        public func updateUIView(_ view: BTPayPalMessagingView, context: Context) {
            view.apiClient = apiClient
        }
    }
}

// MARK: - PayPalMessageViewEventDelegate and PayPalMessageViewStateDelegate protocol conformance

extension BTPayPalMessagingView: PayPalMessageViewEventDelegate, PayPalMessageViewStateDelegate {

    public func onClick(_ paypalMessageView: PayPalMessages.PayPalMessageView) {
        delegate?.didSelect(self)
    }

    public func onApply(_ paypalMessageView: PayPalMessages.PayPalMessageView) {
        delegate?.willApply(self)
    }

    public func onLoading(_ paypalMessageView: PayPalMessages.PayPalMessageView) {
        delegate?.willAppear(self)
    }

    public func onSuccess(_ paypalMessageView: PayPalMessages.PayPalMessageView) {
        delegate?.didAppear(self)
    }

    public func onError(_ paypalMessageView: PayPalMessages.PayPalMessageView, error: PayPalMessages.PayPalMessageError) {
        delegate?.onError(self, error: error)
    }
}

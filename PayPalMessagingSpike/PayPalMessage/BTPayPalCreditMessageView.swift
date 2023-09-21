import UIKit
import BraintreeCore
import PayPalMessages

private enum Constants {

    // TODO: ideally we can use our own client ID here, but it's not working currently
    static let temporaryClientID = "ASPBQAggBcUvZJ0kFFBizjYapdjokGMcAzBFoC0xIAYY-4iuJH3NxAgkdUEyQ6oCPQiKNRZaWUogS0d6"
}

@objc public class BTPayPalCreditMessageView: UIView {

    public weak var delegate: BTPayPalCreditMessageDelegate?

    let apiClient: BTAPIClient

    /**
     Initializes the PayPalCreditMessage View
     - Parameters:
        - apiClient: This class acts as the entry point for accessing the Braintree APIs via common HTTP methods performed on API endpoints. Primarily used to generate the clientID
     -  Returns: Instance of the BTPayPalCreditMessageView
    */
    @objc public init(apiClient: BTAPIClient) {
        self.apiClient = apiClient

        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // TODO: decide on name for this method
    @objc public func createView(with request: BTPayPalCreditMessageRequest? = nil) {
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
                clientID: Constants.temporaryClientID , // ideally we can use our own client ID here, but it's not working currently
                amount: request?.amount,
                placement: request?.placement.placementRawValue,
                offerType: request?.offerType.offerTypeRawValue,
                environment: configuration.environment == "production" ? .live : .sandbox
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

// MARK: - PayPalMessageViewEventDelegate and PayPalMessageViewStateDelegate protocol conformance

extension BTPayPalCreditMessageView: PayPalMessageViewEventDelegate, PayPalMessageViewStateDelegate {

    public func onClick(_ paypalMessageView: PayPalMessages.PayPalMessageView) {
        delegate?.onClick(self)
    }

    public func onApply(_ paypalMessageView: PayPalMessages.PayPalMessageView) {
        delegate?.onApply(self)
    }

    public func onLoading(_ paypalMessageView: PayPalMessages.PayPalMessageView) {
        delegate?.onLoading(self)
    }

    public func onSuccess(_ paypalMessageView: PayPalMessages.PayPalMessageView) {
        delegate?.onSuccess(self)
    }

    public func onError(_ paypalMessageView: PayPalMessages.PayPalMessageView, error: PayPalMessages.PayPalMessageError) {
        delegate?.onError(self, error: error)
    }
}

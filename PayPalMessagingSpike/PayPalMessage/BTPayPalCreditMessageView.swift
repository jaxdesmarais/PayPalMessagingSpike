import UIKit
import BraintreeCore
import PayPalMessages

@objc public class BTPayPalCreditMessageView: UIControl {

    let apiClient: BTAPIClient

    @objc public init(apiClient: BTAPIClient) {
        self.apiClient = apiClient

        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // TODO: decide on name
    @objc public func createView(
        with request: BTPayPalCreditMessageRequest? = nil,
        completion: @escaping (Error?) -> Void
    ) {
        apiClient.fetchOrReturnRemoteConfiguration { configuration, error in
            guard let configuration else {
                completion(error)
                return
            }

            guard let clientID = configuration.json?["paypal"]["clientId"].asString() else {
                // Completion with custom error
                return
            }

            let messageConfig = PayPalMessageConfig(
                data: PayPalMessageData(
                    clientID: "ASPBQAggBcUvZJ0kFFBizjYapdjokGMcAzBFoC0xIAYY-4iuJH3NxAgkdUEyQ6oCPQiKNRZaWUogS0d6", // ideally we can use our own client ID here, but it's not working currently
                    amount: request?.amount,
                    offerType: request?.offerType.offerTypeRawValue,
                    environment: configuration.environment == "production" ? .live : .sandbox
                ),
                style: PayPalMessageStyle(
                    logoType: .primary,
                    color: .black,
                    textAlignment: .center
                )
            )

            let messageView = PayPalMessageView(config: messageConfig)
            messageView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(messageView)

            NSLayoutConstraint.activate([
                messageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                messageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                messageView.topAnchor.constraint(equalTo: self.topAnchor),
                messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])

            completion(nil)
            return
        }
    }
}

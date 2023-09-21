import UIKit
import BraintreeCore
import PayPalMessages

@objc public class BTPayPalCreditMessageView: UIView {
    private enum Constants {
        
        //TODO: // ideally we can use our own client ID here, but it's not working currently
        static let temporaryClientID = "ASPBQAggBcUvZJ0kFFBizjYapdjokGMcAzBFoC0xIAYY-4iuJH3NxAgkdUEyQ6oCPQiKNRZaWUogS0d6"
    }
    
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
    // Do we want to return an error to merchants if we cannot create a view or rely on the messaging delegates?
    @objc public func createView(
        with request: BTPayPalCreditMessageRequest? = nil,
        completion: @escaping (BTPayPalCreditMessageView?, Error?) -> Void
    ) {
        apiClient.fetchOrReturnRemoteConfiguration { configuration, error in
            guard let configuration else {
                completion(nil, error)
                return
            }

            guard let clientID = configuration.json?["paypal"]["clientId"].asString() else {
                // Completion with custom error
                return
            }

            let messageConfig = PayPalMessageConfig(
                data: PayPalMessageData(
                    clientID: Constants.temporaryClientID , // ideally we can use our own client ID here, but it's not working currently
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

            completion(self, nil)
            return
        }
    }
}

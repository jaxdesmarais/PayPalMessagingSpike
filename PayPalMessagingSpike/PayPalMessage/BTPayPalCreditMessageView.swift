import UIKit
import BraintreeCore
import PayPalMessages

@objcMembers public class BTPayPalCreditMessageView: UIControl {

    public var paypalCreditMessageRequest: BTPayPalCreditMessageRequest? = nil

    private let apiClient: BTAPIClient

    public init(apiClient: BTAPIClient, paypalCreditMessageRequest: BTPayPalCreditMessageRequest? = nil) {
        self.paypalCreditMessageRequest = paypalCreditMessageRequest
        self.apiClient = apiClient

        super.init(frame: .zero)
        createView(with: paypalCreditMessageRequest)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView(with request: BTPayPalCreditMessageRequest? = nil) {
        let messageConfig = PayPalMessageConfig(
            data: PayPalMessageData(
                clientID: "ASPBQAggBcUvZJ0kFFBizjYapdjokGMcAzBFoC0xIAYY-4iuJH3NxAgkdUEyQ6oCPQiKNRZaWUogS0d6",
                amount: request?.amount,
                offerType: request?.offerType.offerTypeRawValue,
                environment: .sandbox
            ),
            style: PayPalMessageStyle(
                logoType: .primary,
                color: .black,
                textAlignment: .center
            )
        )

        let messageView = PayPalMessageView(config: messageConfig)
        messageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(messageView)

        NSLayoutConstraint.activate([
            messageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            messageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            messageView.topAnchor.constraint(equalTo: topAnchor),
            messageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

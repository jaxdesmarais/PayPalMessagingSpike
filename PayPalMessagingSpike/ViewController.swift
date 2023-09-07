import UIKit
import PayPalMessages

class ViewController: UIViewController, PayPalMessageViewEventDelegate, PayPalMessageViewStateDelegate {

    var payPalMessageView: PayPalMessageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        let messageConfig = PayPalMessageConfig(
            data: PayPalMessageData(
                clientID: "ASPBQAggBcUvZJ0kFFBizjYapdjokGMcAzBFoC0xIAYY-4iuJH3NxAgkdUEyQ6oCPQiKNRZaWUogS0d6",
                amount: 2.0,
                environment: .sandbox
            ),
            style: PayPalMessageStyle(
                logoType: .primary,
                color: .black,
                textAlignment: .center
            )
        )

        payPalMessageView = PayPalMessageView(config: messageConfig, stateDelegate: self, eventDelegate: self)
        // maybe needs a delegate

        payPalMessageView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(payPalMessageView!)

        NSLayoutConstraint.activate([
            payPalMessageView!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            payPalMessageView!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            payPalMessageView!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            payPalMessageView!.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    // MARK: - Delegates

    func onClick(_ paypalMessageView: PayPalMessages.PayPalMessageView) {
        // no-op
    }

    func onApply(_ paypalMessageView: PayPalMessages.PayPalMessageView) {
        // no-op
    }

    func onLoading(_ paypalMessageView: PayPalMessages.PayPalMessageView) {
        // no-op
    }

    func onSuccess(_ paypalMessageView: PayPalMessages.PayPalMessageView) {
        // no-op
    }

    func onError(_ paypalMessageView: PayPalMessages.PayPalMessageView, error: PayPalMessages.PayPalMessageError) {
        // no-op
    }
}

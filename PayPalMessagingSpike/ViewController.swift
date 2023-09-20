import UIKit
import BraintreeCore
import PayPalMessages

class ViewController: UIViewController, PayPalMessageViewEventDelegate, PayPalMessageViewStateDelegate {

    var payPalMessageView: BTPayPalCreditMessageView?

    // outstanding questions
    // - do we want to use the client/request pattern? it doesn't really make a ton of sense with just UI?
    // - what do we need to wrap or not wrap for v1? everything? only some classes?
    // - class name: PayPalCreditMessage____

    // thoughts
    // - merchants should pass in APIClient and we should obfuscate clientID from them completely
    // - everything in PayPalMessageData and PayPalMessageStyle should be wrapped in a request vs separate objects

    override func viewDidLoad() {
        super.viewDidLoad()

//        let messageConfig = PayPalMessageConfig(
//            data: PayPalMessageData(
//                clientID: "ASPBQAggBcUvZJ0kFFBizjYapdjokGMcAzBFoC0xIAYY-4iuJH3NxAgkdUEyQ6oCPQiKNRZaWUogS0d6",
//                amount: 2.0,
//                offerType: .payLaterLongTerm,
//                environment: .sandbox
//            ),
//            style: PayPalMessageStyle(
//                logoType: .primary,
//                color: .black,
//                textAlignment: .center
//            )
//        )

        let apiClient = BTAPIClient(authorization: "sandbox_9dbg82cq_dcpspy2brwdjr3qn")!
        let request = BTPayPalCreditMessageRequest()
        request.offerType = .payLaterLongTerm
        request.amount = 2.0

        payPalMessageView = BTPayPalCreditMessageView(apiClient: apiClient, paypalCreditMessageRequest: request)

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

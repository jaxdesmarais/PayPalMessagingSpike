import UIKit
import BraintreeCore
import PayPalMessages

class ViewController: UIViewController, PayPalMessageViewEventDelegate, PayPalMessageViewStateDelegate {

    var payPalMessageView: BTPayPalCreditMessageView?

    override func viewDidLoad() {
        super.viewDidLoad()

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

import UIKit
import BraintreeCore
import PayPalMessages

class ViewController: UIViewController {

    var payPalMessageView: BTPayPalCreditMessageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        let apiClient = BTAPIClient(authorization: "sandbox_9dbg82cq_dcpspy2brwdjr3qn")!
        let request = BTPayPalCreditMessageRequest()
        request.offerType = .payLaterLongTerm
        request.amount = 2.0

        payPalMessageView = BTPayPalCreditMessageView(apiClient: apiClient)
        payPalMessageView?.createView(with: request) { error in
            if let error {
                // do something if there is an error
                print(error.localizedDescription)
            }
        }

        payPalMessageView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(payPalMessageView!)

        NSLayoutConstraint.activate([
            payPalMessageView!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            payPalMessageView!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            payPalMessageView!.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            payPalMessageView!.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

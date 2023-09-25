import UIKit
import BraintreeCore
import PayPalMessages // merchants will instead import our wrapper module here

class ViewController: UIViewController {

    private enum Constants {
        // Authorization required for APIClient initialization
        static let authorization = "sandbox_9dbg82cq_dcpspy2brwdjr3qn"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let apiClient = BTAPIClient(authorization: Constants.authorization)!
        let request = BTPayPalCreditMessageRequest()
        request.offerType = .payLaterLongTerm
        request.amount = 2.0
        request.logoType = .primary
        request.textAlignment = .center

        let payPalMessageView = BTPayPalCreditMessageView(apiClient: apiClient)
        payPalMessageView.delegate = self
        payPalMessageView.createView(request)

        payPalMessageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(payPalMessageView)

        NSLayoutConstraint.activate([
            payPalMessageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            payPalMessageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            payPalMessageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            payPalMessageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

extension ViewController: BTPayPalCreditMessageDelegate {

    func didSelect(_ payPalCreditMessageView: BTPayPalCreditMessageView) {
        print("DELEGATE: onClick fired")
    }
    
    func willApply(_ payPalCreditMessageView: BTPayPalCreditMessageView) {
        print("DELEGATE: onApply fired")
    }
    
    func willAppear(_ payPalCreditMessageView: BTPayPalCreditMessageView) {
        print("DELEGATE: onLoading fired")
    }
    
    func didAppear(_ payPalCreditMessageView: BTPayPalCreditMessageView) {
        print("DELEGATE: onSuccess fired")
    }
    
    func onError(_ payPalCreditMessageView: BTPayPalCreditMessageView, error: Error) {
        print("DELEGATE: onError fired with \(error.localizedDescription)")
    }
}

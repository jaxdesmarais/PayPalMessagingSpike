import UIKit
import BraintreeCore
import PayPalMessages // merchants will instead import our wrapper module here

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let apiClient = BTAPIClient(authorization: "sandbox_9dbg82cq_dcpspy2brwdjr3qn")!
        let request = BTPayPalMessagingRequest()
        request.offerType = .payLaterLongTerm
        request.amount = 2.0
        request.logoType = .primary
        request.textAlignment = .center
        request.buyerCountry = "US"

        let payPalMessageView = BTPayPalMessagingView(apiClient: apiClient)
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

extension ViewController: BTPayPalMessagingDelegate {

    func didSelect(_ payPalCreditMessageView: BTPayPalMessagingView) {
        print("DELEGATE: onClick fired")
    }
    
    func willApply(_ payPalCreditMessageView: BTPayPalMessagingView) {
        print("DELEGATE: onApply fired")
    }
    
    func willAppear(_ payPalCreditMessageView: BTPayPalMessagingView) {
        print("DELEGATE: onLoading fired")
    }
    
    func didAppear(_ payPalCreditMessageView: BTPayPalMessagingView) {
        print("DELEGATE: onSuccess fired")
    }
    
    func onError(_ payPalCreditMessageView: BTPayPalMessagingView, error: Error) {
        print("DELEGATE: onError fired with \(error.localizedDescription)")
    }
}

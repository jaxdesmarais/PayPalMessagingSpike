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

        payPalMessageView.createView(with: request) { [weak self] messageView, error in
            guard let self = self, let messageView = messageView, error == nil else {
                // do something if there is an error
                print(error!.localizedDescription)
                return
            }
            
            messageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(messageView)
            
            NSLayoutConstraint.activate([
                messageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                messageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                messageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                messageView.heightAnchor.constraint(equalToConstant: 80)
            ])
        }
    }
}

extension ViewController: BTPayPalCreditMessageDelegate {

    func onClick(_ payPalCreditMessageView: BTPayPalCreditMessageView) {
        print("DELEGATE: onClick fired")
    }
    
    func onApply(_ payPalCreditMessageView: BTPayPalCreditMessageView) {
        print("DELEGATE: onApply fired")
    }
    
    func onLoading(_ payPalCreditMessageView: BTPayPalCreditMessageView) {
        print("DELEGATE: onLoading fired")
    }
    
    func onSuccess(_ payPalCreditMessageView: BTPayPalCreditMessageView) {
        print("DELEGATE: onSuccess fired")
    }
    
    func onError(_ payPalCreditMessageView: BTPayPalCreditMessageView, error: Error) {
        print("DELEGATE: onError fired with \(error.localizedDescription)")
    }
}

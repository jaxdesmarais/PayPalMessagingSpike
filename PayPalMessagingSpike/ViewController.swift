import UIKit
import BraintreeCore
import PayPalMessages

class ViewController: UIViewController {
    private enum Constants {
        // Authorizatioin required for APIClient initialization
        static let authorization = "sandbox_9dbg82cq_dcpspy2brwdjr3qn"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let apiClient = BTAPIClient(authorization: Constants.authorization)!
        let request = BTPayPalCreditMessageRequest()
        request.offerType = .payLaterLongTerm
        request.amount = 2.0

        let payPalMessageView = BTPayPalCreditMessageView(apiClient: apiClient)
        
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

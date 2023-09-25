import Foundation
import PayPalMessages

@objc public protocol BTPayPalCreditMessageDelegate: AnyObject {

    /// Function invoked when the message is tapped
    func didSelect(_ payPalCreditMessageView: BTPayPalCreditMessageView)

    /// Function invoked when a user has begun the PayPal Credit application
    func willApply(_ payPalCreditMessageView: BTPayPalCreditMessageView)

    /// Function invoked when the message first starts to fetch data
    func willAppear(_ payPalCreditMessageView: BTPayPalCreditMessageView)

    /// Function invoked when the message has rendered
    func didAppear(_ payPalCreditMessageView: BTPayPalCreditMessageView)

    /// Function invoked when the message encounters an error
    func onError(_ payPalCreditMessageView: BTPayPalCreditMessageView, error: Error)
}

import Foundation
import PayPalMessages

@objc public protocol BTPayPalCreditMessageDelegate: AnyObject {

    /// Function invoked when the message is tapped
    func onClick(_ payPalCreditMessageView: BTPayPalCreditMessageView)

    /// Function invoked when a user has begun the PayPal Credit application
    func onApply(_ payPalCreditMessageView: BTPayPalCreditMessageView)

    /// Function invoked when the message first starts to fetch data
    func onLoading(_ payPalCreditMessageView: BTPayPalCreditMessageView)

    /// Function invoked when the message has rendered
    func onSuccess(_ payPalCreditMessageView: BTPayPalCreditMessageView)

    /// Function invoked when the message encounters an error
    func onError(_ payPalCreditMessageView: BTPayPalCreditMessageView, error: Error)
}

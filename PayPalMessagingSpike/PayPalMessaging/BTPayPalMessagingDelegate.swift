import Foundation
import PayPalMessages

@objc public protocol BTPayPalMessagingDelegate: AnyObject {

    /// Function invoked when the message is tapped
    func didSelect(_ payPalMessagingView: BTPayPalMessagingView)

    /// Function invoked when a user has begun the PayPal Credit application
    func willApply(_ payPalMessagingView: BTPayPalMessagingView)

    /// Function invoked when the message first starts to fetch data
    func willAppear(_ payPalMessagingView: BTPayPalMessagingView)

    /// Function invoked when the message has rendered
    func didAppear(_ payPalMessagingView: BTPayPalMessagingView)

    /// Function invoked when the message encounters an error
    func onError(_ payPalMessagingView: BTPayPalMessagingView, error: Error)
}

import Foundation
import BraintreeCore
import PayPalMessages

@objcMembers public class BTPayPalCreditMessageView: NSObject {

    public let paypalCreditMessageRequest: BTPayPalCreditMessageRequest?

    public init(paypalCreditMessageRequest: BTPayPalCreditMessageRequest?) {
        self.paypalCreditMessageRequest = paypalCreditMessageRequest
    }

    
}

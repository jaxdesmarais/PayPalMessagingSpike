import Foundation
import PayPalMessages

/// Preferred message offer to display
@objc public enum BTPayPalMessageOfferType: Int {

    /// Nonce
    case none

    /// Pay Later short term installment
    case payLaterShortTerm
    
    /// Pay Later long term installments
    case payLaterLongTerm
    
    /// Pay Later deferred payment
    case payLaterPayIn1
    
    /// PayPal Credit No Interest
    case payPalCreditNoInterest

    var offerTypeRawValue: PayPalMessageOfferType? {
        switch self {
        case .payLaterShortTerm:
            return .payLaterShortTerm
        case .payLaterLongTerm:
            return .payLaterLongTerm
        case .payLaterPayIn1:
            return .payLaterPayIn1
        case .payPalCreditNoInterest:
            return .payPalCreditNoInterest
        default:
            return nil
        }
    }
}

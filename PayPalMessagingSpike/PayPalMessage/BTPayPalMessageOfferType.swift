import Foundation
import PayPalMessages

/// Preferred message offer to display
@objc public enum BTPayPalMessageOfferType: Int {

    /// Pay Later short term installment
    case payLaterShortTerm
    /// Pay Later long term installments
    case payLaterLongTerm
    /// Pay Later deferred payment
    case payLaterPayIn1
    /// PayPal Credit No Interest
    case payPalCreditNoInterest

    var offerTypeRawValue: BTPayPalMessageOfferType {
        switch self {
        case .payLaterShortTerm:
            return .payLaterShortTerm
        case .payLaterLongTerm:
            return .payLaterLongTerm
        case .payLaterPayIn1:
            return .payLaterPayIn1
        case .payPalCreditNoInterest:
            return .payPalCreditNoInterest
        }
    }
}

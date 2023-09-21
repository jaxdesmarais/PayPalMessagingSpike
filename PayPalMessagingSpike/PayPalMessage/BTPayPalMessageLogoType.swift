import Foundation
import PayPalMessages

/// Text alignment option for a PayPal Message
@objc public enum BTPayPalMessageLogoType: Int {

    /// PayPal logo positioned inline within the message
    case inline
    /// Primary logo including both the PayPal monogram and logo
    case primary
    /// Alternative logo including just the PayPal monogram
    case alternative
    /// "PayPal" as bold text inline with the message
    case none

    var offerTypeRawValue: PayPalMessageLogoType? {
        switch self {
        case .inline:
            return .inline
        case .primary:
            return .primary
        case .alternative:
            return .alternative
        case .none:
            return PayPalMessageLogoType.none
        }
    }
}

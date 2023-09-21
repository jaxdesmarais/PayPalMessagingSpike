import Foundation
import PayPalMessages

/// Text alignment option for a PayPal Message
@objc public enum BTPayPalMessageTextAlignment: Int {

    /// Nonce
    case none
    /// Text aligned to the left
    case left
    /// Text aligned to the center
    case center
    /// Text aligned to the right
    case right

    var offerTypeRawValue: PayPalMessageTextAlignment? {
        switch self {
        case .left:
            return .left
        case .center:
            return .center
        case .right:
            return .right
        default:
            return nil
        }
    }
}

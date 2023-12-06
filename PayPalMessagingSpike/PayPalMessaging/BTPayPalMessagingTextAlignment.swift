import Foundation
import PayPalMessages

/// Text alignment option for a PayPal Message
@objc public enum BTPayPalMessagingTextAlignment: Int {

    /// Text aligned to the left
    case left

    /// Text aligned to the center
    case center

    /// Text aligned to the right
    case right

    var textAlignmentRawValue: PayPalMessageTextAlignment {
        switch self {
        case .left:
            return .left
        case .center:
            return .center
        case .right:
            return .right
        }
    }
}

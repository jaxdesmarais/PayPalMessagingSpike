import Foundation
import PayPalMessages

/// Text alignment option for a PayPal Message
@objc public enum BTPayPalMessageColor: Int {

    /// None
    case none
    /// Black text with a color logo
    case black
    /// White text with a white logo
    case white
    /// Black text with a black logo
    case monochrome
    /// Black text with a desaturated logo
    case grayscale

    var offerTypeRawValue: PayPalMessageColor? {
        switch self {
        case .black:
            return .black
        case .white:
            return .white
        case .monochrome:
            return .monochrome
        case .grayscale:
            return .grayscale
        default:
            return nil
        }
    }
}

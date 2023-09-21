import Foundation

@objcMembers public class BTPayPalCreditMessageRequest: NSObject {

    /// Price expressed in cents amount based on the current context (i.e. individual product price vs total cart price)
    public var amount: Double?

    /// Message screen location (e.g. product, cart, home)
    public var placement: BTPayPalMessagePlacement = .none

    /// Preferred message offer to display
    public var offerType: BTPayPalMessageOfferType = .none

    /// Consumer's country (Integrations must be approved by PayPal to use this option)
    public var buyerCountry: String?

    /// Logo type option for a PayPal Message
    /// Defaults to `.inline`
    public var logoType: BTPayPalMessageLogoType = .inline

    /// Text alignment option for a PayPal Message
    /// Defaults to `.right`
    public var textAlignment: BTPayPalMessageTextAlignment = .right

//    // PPCP ONLY IF NEEDED
//    /// PayPal encrypted merchant ID. For partner integrations only.
//    public var merchantID: String?
//
//    /// Partner BN Code / Attribution ID assigned to the account. For partner integrations only.
//    public var partnerAttributionID: String?

    init(
        amount: Double? = nil,
        placement: BTPayPalMessagePlacement = .none,
        offerType: BTPayPalMessageOfferType = .none,
        buyerCountry: String? = nil,
        logoType: BTPayPalMessageLogoType = .inline,
        textAlignment: BTPayPalMessageTextAlignment = .right
    ) {
        self.amount = amount
        self.placement = placement
        self.offerType = offerType
        self.buyerCountry = buyerCountry
        self.logoType = logoType
        self.textAlignment = textAlignment
    }
}

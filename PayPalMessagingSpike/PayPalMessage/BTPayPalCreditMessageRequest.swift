import Foundation

@objcMembers public class BTPayPalCreditMessageRequest: NSObject {

    /// Price expressed in cents amount based on the current context (i.e. individual product price vs total cart price)
    public var amount: Double?

    /// Message screen location (e.g. product, cart, home)
    public var placement: BTPayPalCreditMessagePlacement = .none

    /// Preferred message offer to display
    public var offerType: BTPayPalCreditMessageOfferType = .none

    /// Consumer's country (Integrations must be approved by PayPal to use this option)
    public var buyerCountry: String?

    /// Logo type option for a PayPal Message
    /// Defaults to `.inline`
    public var logoType: BTPayPalCreditMessageLogoType = .inline

    /// Text alignment option for a PayPal Message
    /// Defaults to `.right`
    public var textAlignment: BTPayPalCreditMessageTextAlignment = .right

    /// Text and logo color option for a PayPal Message
    // Defaults to `.black`
    public var color: BTPayPalCreditMessageColor = .black

//    // PPCP ONLY IF NEEDED
//    /// PayPal encrypted merchant ID. For partner integrations only.
//    public var merchantID: String?
//
//    /// Partner BN Code / Attribution ID assigned to the account. For partner integrations only.
//    public var partnerAttributionID: String?

    init(
        amount: Double? = nil,
        placement: BTPayPalCreditMessagePlacement = .none,
        offerType: BTPayPalCreditMessageOfferType = .none,
        buyerCountry: String? = nil,
        logoType: BTPayPalCreditMessageLogoType = .inline,
        textAlignment: BTPayPalCreditMessageTextAlignment = .right,
        color: BTPayPalCreditMessageColor = .black
    ) {
        self.amount = amount
        self.placement = placement
        self.offerType = offerType
        self.buyerCountry = buyerCountry
        self.logoType = logoType
        self.textAlignment = textAlignment
        self.color = color
    }
}

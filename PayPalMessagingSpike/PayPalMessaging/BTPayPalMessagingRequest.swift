import Foundation

@objcMembers public class BTPayPalMessagingRequest: NSObject {

    /// Price expressed in cents amount based on the current context (i.e. individual product price vs total cart price)
    public var amount: Double?

    /// Message screen location (e.g. product, cart, home)
    public var placement: BTPayPalMessagingPlacement = .none

    /// Preferred message offer to display
    public var offerType: BTPayPalMessagingOfferType = .none

    /// Consumer's country (Integrations must be approved by PayPal to use this option)
    public var buyerCountry: String?

    /// Logo type option for a PayPal Message
    /// Defaults to `.inline`
    public var logoType: BTPayPalMessagingLogoType = .inline

    /// Text alignment option for a PayPal Message
    /// Defaults to `.right`
    public var textAlignment: BTPayPalMessagingTextAlignment = .right

    /// Text and logo color option for a PayPal Message
    // Defaults to `.black`
    public var color: BTPayPalMessagingColor = .black

//    // PPCP ONLY IF NEEDED
//    /// PayPal encrypted merchant ID. For partner integrations only.
//    public var merchantID: String?
//
//    /// Partner BN Code / Attribution ID assigned to the account. For partner integrations only.
//    public var partnerAttributionID: String?

    init(
        amount: Double? = nil,
        placement: BTPayPalMessagingPlacement = .none,
        offerType: BTPayPalMessagingOfferType = .none,
        buyerCountry: String? = nil,
        logoType: BTPayPalMessagingLogoType = .inline,
        textAlignment: BTPayPalMessagingTextAlignment = .right,
        color: BTPayPalMessagingColor = .black
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

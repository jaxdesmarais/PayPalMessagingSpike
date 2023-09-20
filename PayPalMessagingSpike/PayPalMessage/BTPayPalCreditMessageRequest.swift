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
        buyerCountry: String? = nil
    ) {
        self.amount = amount
        self.placement = placement
        self.offerType = offerType
        self.buyerCountry = buyerCountry
    }
}

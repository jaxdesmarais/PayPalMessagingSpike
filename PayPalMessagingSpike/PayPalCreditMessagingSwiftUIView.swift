import SwiftUI
import BraintreeCore
import PayPalMessages // merchants will instead import our wrapper module here

struct PayPalCreditMessagingSwiftUIView: View {

    let request = BTPayPalCreditMessageRequest(
        amount: 2.0,
        offerType: .payLaterLongTerm,
        buyerCountry: "US",
        logoType: .primary,
        textAlignment: .center
    )

    var body: some View {
        let apiClient = BTAPIClient(authorization: "sandbox_9dbg82cq_dcpspy2brwdjr3qn")!
        // TODO: fix swiftUI implementation
//        let payPalMessageView = BTPayPalCreditMessageView.Representable(apiClient: apiClient).createView(request)
//        payPalMessageView.delegate = self
    }
}

#Preview {
    PayPalCreditMessagingSwiftUIView()
}

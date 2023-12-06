import SwiftUI
import BraintreeCore
import PayPalMessages // merchants will instead import our wrapper module here

struct PayPalCreditMessagingSwiftUIView: View {

    let apiClient = BTAPIClient(authorization: "sandbox_9dbg82cq_dcpspy2brwdjr3qn")!
    let request = BTPayPalMessagingRequest(
        amount: 2.0,
        offerType: .payLaterLongTerm,
        buyerCountry: "US",
        logoType: .primary,
        textAlignment: .center
    )

    var body: some View {
        BTPayPalMessagingView.Representable(apiClient: apiClient, request: request, delegate: messagingDelegate)
    }

    private var messagingDelegate: PayPalMessagingSwiftUIDelegate {
        PayPalMessagingSwiftUIDelegate()
    }
}

#Preview {
    PayPalCreditMessagingSwiftUIView()
}

class PayPalMessagingSwiftUIDelegate: BTPayPalMessagingDelegate {

    func didSelect(_ payPalCreditMessageView: BTPayPalMessagingView) {
        print("DELEGATE: onClick fired")
    }

    func willApply(_ payPalCreditMessageView: BTPayPalMessagingView) {
        print("DELEGATE: onApply fired")
    }

    func willAppear(_ payPalCreditMessageView: BTPayPalMessagingView) {
        print("DELEGATE: onLoading fired")
    }

    func didAppear(_ payPalCreditMessageView: BTPayPalMessagingView) {
        print("DELEGATE: onSuccess fired")
    }

    func onError(_ payPalCreditMessageView: BTPayPalMessagingView, error: Error) {
        print("DELEGATE: onError fired with \(error.localizedDescription)")
    }
}

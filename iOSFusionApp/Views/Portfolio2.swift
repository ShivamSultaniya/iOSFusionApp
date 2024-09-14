import SwiftUI

struct Portfolio2: View {
    var body: some View {
        VStack(alignment:.leading) {
            // Top section for portfolio balance
            VStack(alignment:.leading, spacing: 10) {
                Text("Portfolio")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    .padding(.horizontal)

                Text("$5,276.39")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                Text("+192% all time")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.horizontal)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)

            // Assets section
            VStack{
                VStack(alignment: .leading, spacing: 10) {
                    Text("Assets")
                        .font(.headline)
                        .padding()

                    // Asset List
                    ForEach(assetData) { asset in
                        HStack {
                            Image(systemName: asset.icon)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(asset.color)

                            VStack(alignment: .leading) {
                                Text(asset.name)
                                    .font(.headline)
                                Text(asset.quantity)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            VStack(alignment: .trailing) {
                                Text(asset.price)
                                    .font(.headline)
                                HStack(spacing: 5) {
                                    Text(asset.changeAmount)
                                        .font(.subheadline)
                                        .foregroundColor(asset.isPositive ? .green : .red)
                                    Text(asset.changePercentage)
                                        .font(.subheadline)
                                        .foregroundColor(asset.isPositive ? .green : .red)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        Divider()
                    }
                }
                Spacer()
            }
            .padding()
            .background()
            .cornerRadius(30)
            .ignoresSafeArea()
        }
        .background(LinearGradient(colors: [Color.blue.opacity(0.5),Color.blue.opacity(0.8),Color.blue,Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

// Model for assets and recommendations
struct Asset: Identifiable {
    let id = UUID()
    let icon: String
    let name: String
    let quantity: String
    let price: String
    let changeAmount: String
    let changePercentage: String
    let isPositive: Bool
    let color: Color
}

struct Recommendation: Identifiable {
    let id = UUID()
    let icon: String
    let name: String
    let price: String
}

let assetData = [
    Asset(icon: "bitcoinsign.circle.fill", name: "Bitcoin", quantity: "0.5 BTC", price: "$16,405.51", changeAmount: "-$761", changePercentage: "-4.43%", isPositive: false, color: .yellow),
    Asset(icon: "e.circle.fill", name: "Ethereum", quantity: "0.75 ETH", price: "$1,866.82", changeAmount: "+$102.2", changePercentage: "+5.79%", isPositive: true, color: .gray),
    Asset(icon: "link.circle.fill", name: "Chainlink", quantity: "9.45 LINK", price: "$164.24", changeAmount: "+$12.3", changePercentage: "+8.09%", isPositive: true, color: .blue),
    Asset(icon: "l.circle.fill", name: "Litecoin", quantity: "2.76 LTC", price: "$385.82", changeAmount: "+$21.79", changePercentage: "+5.98%", isPositive: true, color: .green)
]

let recommendData = [
    Recommendation(icon: "a.circle.fill", name: "Cardano", price: "$1.23"),
    Recommendation(icon: "b.circle.fill", name: "Binance Coin", price: "$309.41"),
    Recommendation(icon: "t.circle.fill", name: "Tron", price: "$0.060"),
]

#Preview {
    Portfolio2()
}

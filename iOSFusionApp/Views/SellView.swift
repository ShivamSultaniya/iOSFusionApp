import SwiftUI

struct SellView: View {
    var image: String
    var cryptoSymbol: String
    var cryptoPrice: Double
    var change: Double
    
    @State private var sellQuantity: Double = 0
    @State private var showingConfirmation = false
    
    @Environment(\.presentationMode) var presentationMode
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    // Computed property to calculate the sell amount based on sellQuantity and cryptoPrice
    private var sellAmount: Double {
        sellQuantity * cryptoPrice
    }
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                cryptoHeader
                
                Divider()
                
                quantitySection
                
                priceSection
                
                Spacer()
                
                balanceSection
                
                sellButton
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
        }
        .navigationBarTitle("Sell \(cryptoSymbol)", displayMode: .inline)
    }
    
    private var cryptoHeader: some View {
        HStack {
            AsyncImage(url: URL(string: "https://cryptocompare.com/\(image)")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .cornerRadius(30)
            
            VStack(alignment: .leading) {
                Text(cryptoSymbol)
                    .font(.title2)
                    .fontWeight(.bold)
                
                HStack {
                    Text("$\(String(format: "%.2f", cryptoPrice))")
                        .font(.headline)
                    
                    Text(change > 0 ? "+\(String(format: "%.2f", change))%" : "\(String(format: "%.2f", change))%")
                        .font(.subheadline)
                        .foregroundColor(change > 0 ? .green : .red)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(change > 0 ? Color.green.opacity(0.2) : Color.red.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            
            Spacer()
        }
    }
    
    private var quantitySection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Quantity to Sell")
                .font(.headline)
            
            HStack {
                Button(action: { if sellQuantity > 0 { sellQuantity = max(0, sellQuantity - 0.1) } }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.blue)
                }
                
                TextField("0", value: $sellQuantity, formatter: formatter)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
                    .frame(width: 100)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Button(action: { sellQuantity += 0.1 }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                }
            }
        }
    }
    
    private var priceSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("You'll Receive")
                .font(.headline)
            
            Text("$\(String(format: "%.2f", sellAmount))")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
        }
    }
    
    private var balanceSection: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Your \(cryptoSymbol) Balance")
                .font(.headline)
            
            Text("\(formatter.string(from: NSNumber(value: 1.23456789)) ?? "") \(cryptoSymbol)")  // Replace with actual balance
                .font(.title3)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(10)
    }
    
    private var sellButton: some View {
        Button(action: {
            showingConfirmation = true
        }) {
            Text("Sell \(cryptoSymbol)")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(10)
        }
        .alert(isPresented: $showingConfirmation) {
            Alert(
                title: Text("Confirm Sale"),
                message: Text("Are you sure you want to sell \(formatter.string(from: NSNumber(value: sellQuantity)) ?? "") \(cryptoSymbol) for $\(String(format: "%.2f", sellAmount))?"),
                primaryButton: .default(Text("Confirm")) {
                    // Perform the sell action here
                    presentationMode.wrappedValue.dismiss()
                },
                secondaryButton: .cancel()
            )
        }
    }
}

struct SellView_Previews: PreviewProvider {
    static var previews: some View {
        SellView(image: "media/37746251/btc.png", cryptoSymbol: "BTC", cryptoPrice: 55000.0, change: 1.27)
    }
}



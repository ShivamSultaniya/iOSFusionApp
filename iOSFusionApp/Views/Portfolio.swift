import SwiftUI

struct Portfolio: View {
    var body: some View {
        ZStack {
            
            ScrollView {
                VStack(spacing: 20) {
                  
                    VStack(spacing: 15) {
                       
                        Circle()
                            .fill(Color.black)
                            .frame(width: 80, height: 80)
                        
                        Text("UserName")
                            .font(.title3)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text("Invested")
                                Spacer()
                                Text("$45345.63")
                            }
                            HStack {
                                Text("Current")
                                Spacer()
                                Text("$45785.95")
                            }
                            HStack {
                                Text("Net Profit/Loss")
                                Spacer()
                                Text("+2345.67")
                                    .foregroundColor(.green)
                            }
                            Text("+1.45%")
                                .foregroundColor(.green)
                                .font(.caption)
                        }
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("My Cards")
                            .font(.title3)
                        
                        Image("Card1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 250)
                            .cornerRadius(15)
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Past Month Analysis")
                            .font(.title3)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray.opacity(0.1))
                            
                            GraphView(cryptoSymbol: "BTC", detailedView: true)
                                .padding()
                        }
                        .frame(height: 200)
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your Latest Transactions")
                            .font(.title3)
                        
                        HStack {
                            Text("Last Month:")
                            Text("+352")
                                .foregroundColor(.green)
                        }
                        .font(.subheadline)
                        
                        ForEach(0..<3) { index in
                            HStack {
                                Circle()
                                    .fill(index % 2 == 0 ? Color.yellow : Color.purple)
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Text("T")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    )
                                
                                VStack(alignment: .leading) {
                                    Text("BTC")
                                    Text("10 Sep, 2024")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Text("$243.75")
                                    .foregroundColor(index == 1 ? .red : .green)
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure ScrollView fills the space
        }
    }
}

struct Portfolio_Previews: PreviewProvider {
    static var previews: some View {
        Portfolio()
    }
}




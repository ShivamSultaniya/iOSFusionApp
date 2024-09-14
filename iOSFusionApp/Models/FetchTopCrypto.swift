//
//  FetchTopCrypto.swift
//  iOSFusionApp
//
//  Created by Shivam Sultaniya on 11/09/24.
//

import Foundation

// MARK: - API Response Models
struct ApiResponse: Codable {
    let Data: [CoinData]
}

struct CoinData: Codable {
    let CoinInfo: CoinInfo
    let RAW: RawData
}

struct CoinInfo: Codable {
    let Name: String
    let FullName: String
    let ImageUrl: String
}

struct RawData: Codable {
    let USD: CurrencyData
}

struct CurrencyData: Codable {
    let PRICE: Double
    let VOLUME24HOUR: Double
    let MKTCAP: Double
    let LOW24HOUR: Double
    let HIGH24HOUR: Double
    let CHANGEPCTDAY: Double
}

class FetchTopCrypto {
    func fetchTopCrypto(completion: @escaping ([CryptoCurrencyData]) -> () ){
        let urlString = "https://min-api.cryptocompare.com/data/top/mktcapfull?limit=20&tsym=USD"
        guard let url = URL(string: urlString) else{
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else{
                print("No data received")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let apiResponse = try decoder.decode(ApiResponse.self, from: data)
                let apiData = apiResponse.Data.map{
                    CryptoCurrencyData(symbolName: $0.CoinInfo.Name, fullName: $0.CoinInfo.FullName, imageUrl: $0.CoinInfo.ImageUrl, price: $0.RAW.USD.PRICE, vol24Hour: $0.RAW.USD.VOLUME24HOUR, mktCap: $0.RAW.USD.MKTCAP, low: $0.RAW.USD.LOW24HOUR, high: $0.RAW.USD.HIGH24HOUR, changepct: $0.RAW.USD.CHANGEPCTDAY)
                }
                completion(apiData)
            }
            catch let decodingError{
                print("Error decoding data \(decodingError)")
            }
        }
        task.resume()
    }
}



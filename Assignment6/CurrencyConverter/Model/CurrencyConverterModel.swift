import Foundation

struct CurrencyConverterModel {
    let rates: [String: Double] = [
        "EUR": 0.92,
        "GBP": 0.79,
        "JPY": 150.50,
        "CAD": 1.36
    ]
    func convert(usdAmount: Int, to currency: String) -> Double? {
        guard let rate = rates[currency] else { return nil }
        return Double(usdAmount) * rate
    }
}

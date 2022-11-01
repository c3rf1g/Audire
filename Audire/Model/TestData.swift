import UIKit

struct TestData {
    static var wallets = [
        "Wallet1", "Wallet2",
        "Wallet3", "Wallet4"
    ]
    
    static let balanceTokenImages = [
        UIImage(systemName: "bitcoinsign.circle")?.withRenderingMode(.alwaysTemplate),
        UIImage(systemName: "bitcoinsign.circle")?.withRenderingMode(.alwaysTemplate),
        UIImage(systemName: "bitcoinsign.circle")?.withRenderingMode(.alwaysTemplate),
        UIImage(systemName: "bitcoinsign.circle")?.withRenderingMode(.alwaysTemplate),
        UIImage(systemName: "bitcoinsign.circle")?.withRenderingMode(.alwaysTemplate),
        UIImage(systemName: "bitcoinsign.circle")?.withRenderingMode(.alwaysTemplate),
        UIImage(systemName: "bitcoinsign.circle")?.withRenderingMode(.alwaysTemplate),
        UIImage(systemName: "bitcoinsign.circle")?.withRenderingMode(.alwaysTemplate),
        UIImage(systemName: "bitcoinsign.circle")?.withRenderingMode(.alwaysTemplate),
        UIImage(systemName: "bitcoinsign.circle")?.withRenderingMode(.alwaysTemplate)
    ]
    static let balanceTokenImageViewColors = [
        Resources.Colors.releaseSliderColor,
        Resources.Colors.priceSliderColor,
        Resources.Colors.powerSliderColor,
        Resources.Colors.volumeSliderColor,
        Resources.Colors.batterySliderColor,
        Resources.Colors.releaseSliderColor,
        Resources.Colors.priceSliderColor,
        Resources.Colors.powerSliderColor,
        Resources.Colors.volumeSliderColor,
        Resources.Colors.batterySliderColor
    ]
    static let balancesTokenNames = [
        "CLIO", "MATIC", "TON", "USDT", "SOL", "CLIO", "MATIC", "TON", "USDT", "SOL"
    ]
    static let tokenBalances = [
        "1680.21", "0.15487889", "4568.5168", "1.84324324234", "14.2135", "1680.21", "0.15487889", "4568.5168", "1.84324324234", "14.2135"
    ]
    
    static let secretPhrase = [
        "Mommy", "Daddy", "Turtle", "Car",
        "Smoke", "Computer", "Apple", "Water",
        "Sunny", "Table", "Word", "Bottle"
    ]
}

import UIKit

enum Resources {
    enum Colors {
        static var inactive = UIColor(hexString: "#FF06FE")
        static var tabBarBackground = UIColor(hexString: "#130E22")
        //static var backgroundColor = UIColor(hexString: "#1C1344")
        static var backgroundColor = UIColor(hexString: "#28183D")
        static var borderHeadphones = UIColor(hexString: "#FA00FF")
        static var topBorder = UIColor(hexString: "#EB00FF")
        static var inactiveButtonColor = UIColor(hexString: "#27004A")
        static var activeButtonColor = UIColor(hexString: "#30233D")
        static var activeButtonTextColor = UIColor(hexString: "#8B759C")
        static var sortingButtonActionSheetTextColor = UIColor(hexString: "#8B2394")
        static var ratingSliderColor = UIColor(hexString: "#9AE1FF")
        static var ratingSliderShadowColor = UIColor(hexString: "#00B2FF")
        static var priceSliderColor = UIColor(hexString: "#B1B9FF")
        static var priceSliderShadowColor = UIColor(hexString: "#5E6EFF")
        static var releaseSliderColor = UIColor(hexString: "#DDB1FF")
        static var releaseSliderShadowColor = UIColor(hexString: "#AA3EFF")
        static var powerSliderColor = UIColor(hexString: "#F8A6FF")
        static var powerSliderShadowColor = UIColor(hexString: "#EB00FF")
        static var batterySliderColor = UIColor(hexString: "#FFA1E5")
        static var batterySliderShadowColor = UIColor(hexString: "#FF00B8")
        static var volumeSliderColor = UIColor(hexString: "#FFAAD3")
        static var volumeSliderShadowColor = UIColor(hexString: "#FF007A")
    }
    
    enum Multipliers {
        static var multiplierX = Double(UIScreen.main.bounds.size.width / 428)
        static var multiplierY = Double(UIScreen.main.bounds.size.height / 926)
    }
    
    enum ScreenSizes {
        static var width = UIScreen.main.bounds.size.width
        static var height = UIScreen.main.bounds.size.height
    }
}



import SwiftUI
public struct ColorSwitchModel: Equatable {
    let onColor, offColor, thumbColor: Color
}

extension ColorSwitchModel {
    public static var standard: Self {
        .init(
            onColor: Color.mint,
            offColor: Color.red,
            thumbColor: Color.white
        )
    }
    
    public static var newColors1: Self {
        .init(
            onColor: Color(red: 255/255, green: 113/255, blue: 206/255),
            offColor: Color(red: 185/255, green: 103/255, blue: 255/255),
            thumbColor: Color(red: 5/255, green: 255/255, blue: 161/255)
        )
    }
    
    public static var newColors2: Self {
        .init(
            onColor: Color(red: 214/255, green: 41/255, blue: 118/255),
            offColor: Color(red: 79/255, green: 91/255, blue: 213/255),
            thumbColor: Color(red: 254/255, green: 218/255, blue: 117/255)
        )
    }
}

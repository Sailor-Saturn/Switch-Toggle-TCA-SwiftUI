import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            Toggle(isOn: .constant(true)) {
                Text("On")
            }
            .toggleStyle(ColoredSwitchToggleStyle(colorModel: .standard))
        }
    }
}

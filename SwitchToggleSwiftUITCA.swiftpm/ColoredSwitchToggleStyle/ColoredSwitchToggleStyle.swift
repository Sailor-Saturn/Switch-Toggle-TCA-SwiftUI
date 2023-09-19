import ComposableArchitecture
import SwiftUI

public struct ColoredSwitchToggleStyle: ToggleStyle {
    let colorModel: ColorSwitchModel
    
    public init(colorModel: ColorSwitchModel) {
        self.colorModel = colorModel
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label  // The text (or view) portion of the Toggle
            Spacer()
            RoundedRectangle(cornerRadius: .cornerRadius, style: .circular)
                .fill(configuration.isOn ? colorModel.onColor : colorModel.offColor)
                .frame(width: .toggleWidth, height: .toggleHeight)
                .overlay(
                    Circle()
                        .fill(colorModel.thumbColor)
                        .shadow(radius: 1, x: 0, y: 1)
                        .padding(1)
                        .frame(width: .thumbDiameter, height: .thumbDiameter)
                        .offset(x: configuration.isOn ? .thumbDiameter / 2 : -.thumbDiameter / 2)
                )
                .animation(Animation.easeInOut(duration: 0.2))
                .onTapGesture { configuration.isOn.toggle() }
        }
        .font(.title)
    }
}

// MARK: Constants
private extension CGFloat {
    static let toggleWidth: Self = 50
    static let toggleHeight: Self = 29
    static let cornerRadius: Self = 16
    static let thumbDiameter: Self = 24
}
// MARK: - Preview
#if DEBUG
struct ColoredSwitchToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        Color(red: 255, green: 225, blue: 225)
            .ignoresSafeArea()
        List {
            Section(header: Text("Switch Toggle States")) {
                Toggle(isOn: .constant(true)) {
                    Text("On")
                }
                .toggleStyle(ColoredSwitchToggleStyle(colorModel: .standard))
                Toggle(isOn: .constant(false)) {
                    Text("Off")
                }
                .toggleStyle(ColoredSwitchToggleStyle(colorModel: .standard))
            }
        }
        
    }
}
#endif

struct SwitchToggleView: View {
    private let colorModel: ColorSwitchModel
    private let store: StoreOf<SwitchToggleReducer>
    
    public init(
        colorModel: ColorSwitchModel = .standard,
        store: StoreOf<SwitchToggleReducer>
    ) {
        self.colorModel = colorModel
        self.store = store
    }
    var body: some View {
        WithViewStore(store, observe: {$0}) { viewStore in
            ZStack {
                Toggle(isOn: viewStore.binding(get: \.isToggleOn, send: .view(.toggleSwitchTapped))) {
                    Text(viewStore.text)
                }
                .toggleStyle(ColoredSwitchToggleStyle(colorModel: colorModel))
            }
        }
    }
}

// MARK: - Preview
#if DEBUG
struct SwitchToggleView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            SwitchToggleView(
                colorModel: .newColors1,
                store:.init(
                    initialState: .init(),
                    reducer: {
                        SwitchToggleReducer()
                    }
                )
            )
            Spacer()
            SwitchToggleView(
                colorModel: .newColors2,
                store:.init(
                    initialState: .init(),
                    reducer: {
                        SwitchToggleReducer()
                    }
                )
            )
            Spacer()
            SwitchToggleView(
                store:.init(
                    initialState: .init(),
                    reducer: {
                        SwitchToggleReducer()
                    }
                )
            )
        }
        
    }
}
#endif

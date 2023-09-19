import SwiftUI
import ComposableArchitecture

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

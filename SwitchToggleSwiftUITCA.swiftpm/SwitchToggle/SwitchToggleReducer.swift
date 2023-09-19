import ComposableArchitecture

struct SwitchToggleReducer: Reducer {
     struct State: Equatable {
         var isToggleOn: Bool = true
         var text: String {
             switch isToggleOn {
             case true:
                 return "Toggle is on 🥰🌸🦄"
             case false:
                 return "Toggle is off 🌧️🙅🏻‍♂️❌"
             }
         }
     }

     enum Action: Equatable {
         public enum ViewAction: Equatable {
             case toggleSwitchTapped
         }

         case view(ViewAction)
     }

    var body: some ReducerOf<Self> {
         Reduce { state, action in
             switch action {
             case .view(.toggleSwitchTapped):
                 state.isToggleOn.toggle()
                 return .none
             }
         }
     }

 }

import SwiftUI

@main
struct Shopping: App {
    @State var model = ShoppingViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}

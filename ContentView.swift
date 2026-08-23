import SwiftUI

struct ContentView: View {
    @Environment(ShoppingViewModel.self) private var model
    
    var body: some View {
        NavigationStack {
            VStack{
                Image(systemName: "carrot")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                List{
                    
                }
            }.navigationTitle("Shopping List")
                .navigationBarTitleDisplayMode(.inline)
                    }
        ShareLink("Share to Notes", item: model.formattedList)
    }
}

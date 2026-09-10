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
                    ListView()
                }
            }.navigationTitle("Shopping List")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    EditButton()
                }
                    }
        ShareLink("Share list to Notes", item: model.formattedList, subject: Text("Shopping List"))
    }
}

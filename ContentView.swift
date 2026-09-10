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
        ShareLink("Share list to Notes as plain text", item: model.formattedList, preview: SharePreview("Shopping List"))
        
        ShareLink("Share list to Notes as HTML", item: TransferableFile(htmlText: model.htmlList), preview: SharePreview("Shopping List"))
    }
}

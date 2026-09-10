import SwiftUI

struct ContentView: View {
    @Environment(ShoppingViewModel.self) private var model
    
    var body: some View {
        @Bindable var model = model
        
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
        .alert(item: $model.isError){ error in 
            Alert(title: Text("Error"), message: Text( model.isError?.localizedDescription ?? "Unknown error"), dismissButton: .cancel())
            
        }
                
        ShareLink("Share list to Notes as plain text", item: model.formattedList, preview: SharePreview("Shopping List"))
        
        ShareLink("Share list to Notes as HTML", item: TransferableFile(htmlText: model.htmlList), preview: SharePreview("Shopping List"))
    }
}

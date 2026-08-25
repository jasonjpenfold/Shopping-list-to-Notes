import SwiftUI

struct AddItemView: View{
    @Environment(ShoppingViewModel.self) private var model
    @State private var newItem: String = ""
    var body: some View{
        HStack{
            TextField("", text: $newItem, prompt: Text("Next item:"))
                .keyboardType(.default)
                .textInputAutocapitalization(.sentences)
                
            Button(action: {
                if newItem.isEmpty{return}
                newItem = model.addItem(name: newItem) ? "" : newItem
                
            }, label: {
                Image(systemName: "plus")
            })
            .padding()
            
            .buttonStyle(.glassProminent)
        }
            }
}

import SwiftUI

struct ListView: View{
    @Environment(ShoppingViewModel.self) private var model
    var body: some View{
        ForEach(model.shoppingList, id: \.self){item in 
            Text(item)
        }
        .onDelete(perform: { indexSet in
            model.deleteItem(indexSet: indexSet)
        })
        .onMove(perform: { indices, newOffset in
            model.moveItem(from: indices, to: newOffset)
        })
        
        AddItemView()
    }
}

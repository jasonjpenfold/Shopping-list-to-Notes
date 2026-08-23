import SwiftUI

@Observable
class ShoppingViewModel{
    var shoppingList: [String] = [
        "Bread",
        "Milk",
        "Cheese",
        "Butter",
        "Coco pops"
    ]
    
    var formattedList: String{
        return "Shopping List\n" + shoppingList.joined(separator: "\n")
    }
    init(){
        
    }
    
    
    
}

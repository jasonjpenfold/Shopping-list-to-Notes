import SwiftUI

@Observable
class ShoppingViewModel{
    
    var shoppingList: [String] = UserDefaults.standard.object(forKey: "shoppingList") as? [String] ?? [
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
    
    func addItem(item: String)->Bool{
        shoppingList.append(item)
        updateSave()
        return true
    }
    func updateSave(){
        UserDefaults.standard.set(shoppingList, forKey: "shoppingList")
    }
    func deleteItem(indexSet: IndexSet){
        shoppingList.remove(atOffsets: indexSet)
    }
    func moveItem(from source: IndexSet, to destination: Int){
        shoppingList.move(fromOffsets: source, toOffset: destination)
    }
    
    
    
    
}

import SwiftUI

@Observable
class ShoppingViewModel{
    
    private(set) var shoppingList: [Item]
    
    var formattedList: String{
        let list = shoppingList.map{"• \($0.name)"}
        return "Shopping List\n\n" + list.joined(separator: "\n")
    }
    init(){
        func loadShoppingList()->[Item]{
            guard let data = UserDefaults.standard.data(forKey: "shoppingList") else { return []}
            do{
                let shoppingList: [Item] = try JSONDecoder().decode([Item].self, from: data)
                return shoppingList
            }catch{
                return []
            }
            
        }
        let data = loadShoppingList()
        self.shoppingList = data
        
        
    }
    func createItem(name: String)->Item{
        return Item(id: UUID(), name: name)
    }
    func addItem(name: String)->Bool{
        let item = createItem(name: name)
        shoppingList.append(item)
        print("Got to addItem")
        updateSave()
        return true
    }
    func updateSave(){
        do{
            let data = try JSONEncoder().encode(shoppingList)
            UserDefaults.standard.set(data, forKey: "shoppingList")
        }catch{
            print("Error: unable to save data")
        }
        
    
    }
    func deleteItem(indexSet: IndexSet){
        shoppingList.remove(atOffsets: indexSet)
    }
    func moveItem(from source: IndexSet, to destination: Int){
        shoppingList.move(fromOffsets: source, toOffset: destination)
    }
    
    
    
    
}

import SwiftUI

@Observable
class ShoppingViewModel{
    
    private(set) var shoppingList: [Item]
    
    var formattedList: String{
        let list = shoppingList.map{"• \($0.name)"}
        return "Shopping List\n\n" + list.joined(separator: "\n")
    }
    var htmlList: String{
        let list = shoppingList.map{"""
<input type="checkbox" id="\($0.id)">
<label for="\($0.id)">\($0.name)</label>
"""}
        return "<h1>Shopping List</h1>" + list.joined(separator:"<br>")

    }
    
    var isError: ShoppingError? = nil
    
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
    func validateItemName(name: String)->Bool{
        if name.contains("\"") || name.contains("'") || name.contains("“") || name.contains("<") ||
            name.contains(">") ||
            name.contains("&"){
            self.isError = .illegalName
            return false
            
        }
        return true
    }
    
    func createItem(name: String)->Item{
        return Item(id: UUID(), name: name)
    }
    func addItem(name: String){
        guard self.validateItemName(name: name) else {return}
        let item = createItem(name: name)
        shoppingList.append(item)
        
        updateSave()
        
    }
    func updateSave(){
        do{
            let data = try JSONEncoder().encode(shoppingList)
            UserDefaults.standard.set(data, forKey: "shoppingList")
        }catch{
            print("Error: unable to save data")
            self.isError = .saveError
            
        }
        
    
    }
    func deleteItem(indexSet: IndexSet){
        shoppingList.remove(atOffsets: indexSet)
        updateSave()
    }
    func moveItem(from source: IndexSet, to destination: Int){
        shoppingList.move(fromOffsets: source, toOffset: destination)
        updateSave()
    }
    
    
    
    
    
}

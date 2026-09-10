import SwiftUI

enum ShoppingError: LocalizedError, Identifiable{
    case illegalName
    case saveError
    
    var id: Self
    {self}
    
    
    var errorDescription: String?{
        switch self {
        case .illegalName:
            return "Please use a different name for item."
        case .saveError:
            return "Unable to save list."
        
        }
    }
}

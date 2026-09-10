import SwiftUI
import UniformTypeIdentifiers

// FileRepresentation html -> Notes
struct TransferableFile: Transferable{
    let htmlText: String 
    
    static var transferRepresentation: some TransferRepresentation{
        FileRepresentation(exportedContentType: .html, exporting: {
            file in 
            let fileManager = FileManager.default
            let temporaryDir = fileManager.temporaryDirectory
            let url = temporaryDir.appendingPathComponent("shopping", conformingTo: .html)
            
            try! file.htmlText.write(to: url, atomically: true, encoding: .utf8)
            
            
            return SentTransferredFile(url)
        })
        
    }
    
    
}



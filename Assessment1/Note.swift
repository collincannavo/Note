//
//  Entry.swift
//  Assessment1
//
//  Created by Collin Cannavo on 5/26/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import Foundation

class Note : Equatable {
    
    private let textKey = "text"
    
    var text: String?
    
    init(text: String) {
        
        self.text = text
    }
    
    init?(dictionary: [String : Any]) {
        
        if let text = dictionary[textKey] as? String {
            
            self.text = text
        } else {
            return nil
        }
    }
    
    var dictionaryRepresentation: [String : Any] {
        
        let dictionary: [String : Any] = [textKey: text]
        
        return dictionary
    }
}

func ==(lhs: Note, rhs: Note) -> Bool {
    if lhs.text != rhs.text { return false }
    
    return true
}

//
//  Message.swift
//  Circus_Comments
//
//  Created by MACBOOK on 25/8/17.
//  Copyright © 2017 Kaixin Ren. All rights reserved.
//

import Foundation

enum messageType :Int {
    case messageIn = 0
    case messageOut
}

class Message{
    
    var text : String!
    var type : messageType!
    
    init(text: String!, type:messageType = .messageIn){
        self.text = text
        self.type = type
    }
    
    /**
     func getText() ->String
     {
     return self.text
     }
     
     func getType() -> messageType
     {
     return self.type
     }
     */
}

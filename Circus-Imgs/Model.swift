//
//  Model.swift
//  Circus-Imgs
//
//  Created by Samuel Fary on 22/8/17.
//  Copyright © 2017 s3419529. All rights reserved.
//

import Foundation
import UIKit

class Model
{
    static var get: Model = Model()
    
    private init()
    {
        
    }
    
    
    var images: [String] = ["mushroom", "xanaduhouses", "londonolympics"]
    
    var users: [String] = ["user1", "user2"]
    
    var comments: [String] = ["Comment 1", "Dummy Comment 2", "Hahaha #YOLO"]
    
    var search: [String] = ["#cats", "#yasqueen", "#yesyesnono", "#emotionalclub"]
    
    var chat:[Message]=[Message(text: "How was the party? ", type: .messageIn),Message(text: "That was crazy hahaha!!", type: .messageOut), Message(text: "Sounds Awesome!!", type: .messageIn), Message(text: "You should come with us.", type: .messageOut)]
}

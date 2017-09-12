//
//  MessageCell.swift
//  Circus-Imgs
//
//  Created by MACBOOK on 25/8/17.
//  Copyright © 2017 s3419529. All rights reserved.
//

import UIKit
class MessageCell : UITableViewCell
{
    
    @IBOutlet weak var messageIn: UILabel!
    @IBOutlet weak var chatBubbleIn: UIView!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var messageOut: UILabel!
    @IBOutlet weak var chatBubbleOut: UIView!
}
/**
 extension CustomLabel : UILabel{
 
 override func drawText(in rect: CGRect) {
 let insets = UIEdgeInsets.init(top: 0, left: 5, bottom: 0, right: 5)
 super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
 }
 
 }
 */

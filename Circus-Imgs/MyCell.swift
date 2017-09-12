//
//  MyCell.swift
//  Circus-Imgs
//
//  Created by Samuel Fary on 22/8/17.
//  Copyright © 2017 s3419529. All rights reserved.
//

import Foundation
import UIKit

class MyCell: UITableViewCell
{
    @IBOutlet weak var myImage: UIImageView!;
    @IBOutlet weak var labelRight: UILabel!;
    //@IBOutlet weak var labelLeft: UILabel!;
    
    @IBOutlet weak var likeButton: UIButton!;
    @IBOutlet weak var shareButton: UIButton!;
    @IBOutlet weak var commentButton: UIButton!;
}

//
//  MessageViewController.swift
//  Circus_Comments
//
//  Created by MACBOOK on 23/8/17.
//  Copyright © 2017 Kaixin Ren. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate
{
    @IBOutlet var messageView : UITableView!
    @IBOutlet weak var msgTextfield: UITextField!
    @IBOutlet weak var msgSend: UIButton!
    @IBOutlet weak var msgBoxScroll: UIScrollView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView)-> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int
    {
        return Model.get.chat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myMessageCell", for: indexPath) as! MessageCell
        
        
        if(Model.get.chat[indexPath.row].type ==  .messageIn)
        {
            cell.messageIn.text = Model.get.chat[indexPath.row].text
            cell.messageOut.isHidden = true
            cell.chatBubbleOut.isHidden = true
            cell.profile.image = UIImage(named: "image4")
        }
        else
        {
            cell.messageOut.text = Model.get.chat[indexPath.row].text
            cell.messageIn.isHidden = true
            cell.chatBubbleIn.isHidden = true
        }
        
        return cell
    }
    
    //keyboard control
    func keyboardDidShow(notification: NSNotification) {
        
        if let activeField = self.msgTextfield, let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            
            
            self.msgBoxScroll.contentInset = contentInsets
            self.msgBoxScroll.scrollIndicatorInsets = contentInsets
            var aRect = self.view.frame
            aRect.size.height -= keyboardSize.size.height
            if (!aRect.contains(activeField.frame.origin)) {
                self.msgBoxScroll.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        self.msgBoxScroll.contentInset = contentInsets
        self.msgBoxScroll.scrollIndicatorInsets = contentInsets
    }
}

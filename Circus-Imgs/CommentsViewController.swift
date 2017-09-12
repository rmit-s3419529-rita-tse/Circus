//
//  ViewController.swift
//  Circus-Imgs
//
//  Created by Samuel Fary on 21/8/17.
//  Copyright © 2017 s3419529. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    var defaultConstraintValue: CGFloat = 0;
    
    @IBOutlet var commentView: UITableView!
    @IBOutlet weak var commentsTextfield: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        defaultConstraintValue = bottomConstraint.constant;

        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    func numberOfSections(in tablView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.get.users.count;
    }
    
    
    //func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> UITableViewCell {
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsFD", for: indexPath) as! CommentsCell
        
        cell.commentBox?.text = Model.get.comments[indexPath.row];
        
        cell.profileImg.image = UIImage(named: Model.get.users[indexPath.row])
        
        
        return cell
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.commentsTextfield = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.commentsTextfield = textField
    }
    
    //keyboard control
    func keyboardDidShow(notification: NSNotification) {
       
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        {
            print("keyboard height!! \(keyboardSize.height)");
            bottomConstraint.constant = keyboardSize.height + defaultConstraintValue + 100;
            UIView.animate(withDuration: 0.1)
            {
                self.view.layoutIfNeeded()
            }
            print("keyboard show!! \(bottomConstraint.constant)");
        }

    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        
        bottomConstraint.constant = defaultConstraintValue;
        UIView.animate(withDuration: 0.1)
        {
            self.view.layoutIfNeeded()
        }
        print("keyboard hide!! \(bottomConstraint.constant)");
    }

    }
    





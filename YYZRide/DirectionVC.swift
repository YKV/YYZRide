//
//  DirectionVC.swift
//  YYZRide
//
//  Created by Yevhen Kim on 2016-10-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import Foundation
import UIKit

class DirectionVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var whereTextField: UITextField!
    @IBOutlet weak var getRouteButton: UIButton!
    
    let api = UIApplication.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromTextField.delegate = self
        whereTextField.delegate = self
        
        setupKeyboardNotification()
        toggleGetRouteButton()
        
    }
    
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // pragma: keyboard actions
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    // change next button state
    func toggleGetRouteButton() {
        if (fromTextField.text?.isEmpty)! && (whereTextField.text?.isEmpty)! {
            getRouteButton.isEnabled = false
            getRouteButton.setTitleColor(UIColor.gray, for: .normal)
        }
        else {
            getRouteButton.isEnabled = true
            getRouteButton.setTitleColor(UIColor.green, for: .normal)
        }
    }
    
    // pragma: Text Field Delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        toggleGetRouteButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func getRouteButtonPressed(_ sender: UIButton) {
        
    }
    
}

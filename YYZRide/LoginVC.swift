//
//  LoginVC.swift
//  YYZRide
//
//  Created by Yevhen Kim on 2016-10-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//
import Foundation
import UIKit

class DataEntryTextField: UITextField, UITextFieldDelegate, Jitterable {
    
}

class StartButton: UIButton, Jitterable {
    
}

class FlashingLabel: UILabel, Flashable, Jitterable {
    
}

class LoginVC: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, Jitterable, Flashable {
    
    @IBOutlet weak var usernameTextField: DataEntryTextField!
    @IBOutlet weak var passwordTextField: DataEntryTextField!
    @IBOutlet weak var errorMessageLabel: FlashingLabel!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        setupKeyboardNotification()
        toggleLoginButton()
        
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

    // pragma: Text Field Delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        toggleLoginButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // change next button state
    func toggleLoginButton() {
        if (usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            loginButton.isEnabled = false
            loginButton.setTitleColor(UIColor.gray, for: .normal)
        }
        else {
            loginButton.isEnabled = true
            loginButton.setTitleColor(UIColor.green, for: .normal)
        }
    }


    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let vc: MapVC! = self.storyboard?.instantiateViewController(withIdentifier: "MapID") as! MapVC
        self.present(vc, animated: true, completion: nil)
    }
}


//
//  ResetPasswordVc.swift
//  userLogin
//
//  Created by siddappa tambakad on 07/12/23.
//

import UIKit

class ResetPasswordVc: UIViewController {
    
    
    @IBOutlet var newPasswordLabel: UITextField!
    @IBOutlet var newPasswordErrorLabel: UILabel!
    @IBOutlet var confirmPasswordLabel: UITextField!
    @IBOutlet var confirmPasswordError: UILabel!
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var checkMarkImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegates for the text fields
        newPasswordLabel.delegate = self
        confirmPasswordLabel.delegate = self

        newPasswordLabel.layer.cornerRadius = 25
        confirmPasswordLabel.layer.cornerRadius = 25
        continueButton.layer.cornerRadius = 25
        
        newPasswordLabel.addPaddingToTextField(left: 20)
        confirmPasswordLabel.addPaddingToTextField(left: 20)
        
        checkMarkImage.isHidden = true
        
        keyBoardDissmiss()
        
    }
    
    
    @IBAction func backToVerification(_ sender: UIButton) {
        print("pressed\(sender)")
        navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPressContinueButton(_ sender: UIButton) {
        
        if let newPassword = newPasswordLabel.text {
            if newPassword.isEmpty {
                newPasswordErrorLabel.text = "Enter new password"
            } else if !validatePassword(newPassword) {
                newPasswordErrorLabel.text = "Invalid password! Password must contain at least one letter, one digit, and be at least 8 characters long."
            } else {
                newPasswordErrorLabel.text = ""
            }
        }
        if let confirmPassword = confirmPasswordLabel.text {
            if confirmPassword.isEmpty {
                confirmPasswordError.text = "Confirm password is Required"
            } else if newPasswordLabel.text != confirmPassword {
                confirmPasswordError.text = "Password does not match"
            } else {
                confirmPasswordError.text = ""
                
                
//                let verifiedVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "verified")
//                verifiedVc.modalPresentationStyle = .fullScreen
//                self.present(verifiedVc, animated: true)
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let verifiedVc = storyboard.instantiateViewController(withIdentifier: "verified") as? VerifiedVc {
                    navigationController?.pushViewController(verifiedVc, animated: true)
                }
            }
        }
        
    }
    
    //function for password validation
    func validatePassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^A-Za-z\\d\\s])(?=\\S+$).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    func keyBoardDissmiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(disMissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func disMissKeyboard() {
        view.endEditing(true)
    }
    
    // UITextFieldDelegate method called when the text in the text fields changes
        func textFieldDidChangeSelection(_ textField: UITextField) {
            if textField == newPasswordLabel || textField == confirmPasswordLabel {
                // Get the current text in both password fields
                guard let newPassword = newPasswordLabel.text, let confirmPassword = confirmPasswordLabel.text else {
                    return
                }
                print("newPassword:\(newPassword)")
                print("confirmPassword\(confirmPassword)")

                // Check if both passwords are not empty and match
                if newPassword == confirmPassword {
                    
                    print("image is showing")
                    // Show the checkmark image
                    checkMarkImage.isHidden = false
                } else {
                    // Hide the checkmark image
                    checkMarkImage.isHidden = true
                }
            }
        }
    
}

extension UITextField {
    func addPaddingToTextField(left: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

extension ResetPasswordVc: UITextFieldDelegate {
    //when return key is pressed from the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


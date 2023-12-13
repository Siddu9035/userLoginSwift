//
//  SignUpVc.swift
//  userLogin
//
//  Created by siddappa tambakad on 11/12/23.
//

import UIKit

class SignUpVc: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var emailErrorText: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var nameErrorText: UILabel!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordError: UILabel!
    @IBOutlet var checkPassText: UITextField!
    @IBOutlet var checkPassError: UILabel!
    @IBOutlet var signUpButtonPressed: UIButton!
    @IBOutlet var googleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        nameTextField.delegate = self
        passwordTextField.delegate = self
        checkPassText.delegate = self

        emailTextField.layer.cornerRadius = 25
        nameTextField.layer.cornerRadius = 25
        passwordTextField.layer.cornerRadius = 25
        checkPassText.layer.cornerRadius = 25
        
        emailTextField.layer.borderWidth = 0.25
        nameTextField.layer.borderWidth = 0.25
        passwordTextField.layer.borderWidth = 0.25
        checkPassText.layer.borderWidth = 0.25
        
        emailTextField.addPadding(left: 16)
        nameTextField.addPadding(left: 16)
        passwordTextField.addPadding(left: 16)
        checkPassText.addPadding(left: 16)
        
        signUpButtonPressed.layer.cornerRadius = 25
  
//        googleView.layer.borderWidth = 0.25
//        googleView.layer.cornerRadius = 30
        
        dissMissKeyBoard()
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onPressSignupButton(_ sender: UIButton) {
        
        if let name = nameTextField.text {
            if name.isEmpty {
                nameErrorText.text = "Name required"
            } else if !isValidName(name) {
                nameErrorText.text = "Enter valid Name"
            } else {
                nameErrorText.text = ""
            }
        }
        
        if let email = emailTextField.text {
            if email.isEmpty {
                emailErrorText.text = "Email reqiured"
            } else if !isValidEmail(email) {
                emailErrorText.text = "Enter valid email"
            } else {
                emailErrorText.text = ""
            }
        }
        if let passWord = passwordTextField.text {
            if passWord.isEmpty {
                passwordError.text = "PassWord is Reqiured"
            } else if !validatePassword(passWord) {
                passwordError.text = "Invalid password! Password must contain at least one letter, one digit, and be at least 8 characters long."
            } else {
                passwordError.text = ""
            }
        }
        if let checkPassword = checkPassText.text {
            if checkPassword.isEmpty {
                checkPassError.text = "Confirm Password is Required"
            } else if checkPassword != passwordTextField.text {
                checkPassError.text = "Confirm password Does Not Match"
            } else {
                checkPassError.text = ""
            }
        }
        if isValidName(nameTextField.text!) && isValidEmail(emailTextField.text!) && validatePassword(passwordTextField.text!) && checkPassText.text == passwordTextField.text {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if let myCollectionVc = storyBoard.instantiateViewController(withIdentifier: "collectionVc") as? collectionVc {
                navigationController?.pushViewController(myCollectionVc, animated: true)
            }
        }
    }
    
    func dissMissKeyBoard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(keyBoardDismiss))
        view.addGestureRecognizer(tap)
    }
    @objc func keyBoardDismiss() {
        view.endEditing(true)
    }
    
    func isValidName(_ name: String) -> Bool {
        let regex = "^[a-zA-Z]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: name)
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func validatePassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^A-Za-z\\d\\s])(?=\\S+$).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
}
extension SignUpVc: UITextFieldDelegate {
    
    //function for onpressing keyboard return function the keyboard will dismiss
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == nameTextField {
            nameErrorText.text = ""
        } else if textField == emailTextField {
            emailErrorText.text = ""
        } else if textField == passwordTextField {
            passwordError.text = ""
        } else if textField == checkPassText {
            checkPassError.text = ""
        }
    }

}

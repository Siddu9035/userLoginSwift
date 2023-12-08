//
//  VerificationPage.swift
//  userLogin
//
//  Created by siddappa tambakad on 06/12/23.
//

import UIKit

class VerificationPage: UIViewController {

    @IBOutlet var mobilNoTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var mobileNoErrorLabel: UILabel!
    @IBOutlet var emailLabelError: UILabel!
    @IBOutlet var sendButton: UIButton!
    
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        
        emailTextField.delegate = self
        mobilNoTextField.delegate = self
        
        //adding cornerradius to the texfields
        mobilNoTextField.layer.cornerRadius = 25
        emailTextField.layer.cornerRadius = 25
        
        //adding cornerradius to the sendbutton
        sendButton.layer.cornerRadius = 25
       
        //adding padding to the textfields
        mobilNoTextField.addPadding(left: 20)
        emailTextField.addPadding(left: 20)
        
        //callback for keyboard dismiss
        keyBoardDismiss()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        if let mobileNo = mobilNoTextField.text {
            if mobileNo.isEmpty {
                mobileNoErrorLabel.text = "Mobile no required"
            } else if !isValidMobileNo(mobileNo)  {
                mobileNoErrorLabel.text = "Enter valid Mobile number"
            } else {
                mobileNoErrorLabel.text = ""
            }
        }
        if let email = emailTextField.text {
            if email.isEmpty {
                emailLabelError.text = "Email id required"
            } else if !isValidEmail(email)  {
                emailLabelError.text = "Enter valid Email"
            } else {
                emailLabelError.text = ""
            }
        }
        if isValidEmail(emailTextField.text ?? "") && isValidMobileNo(mobilNoTextField.text ?? "") {
            //            let resetPasswordVC = ResetPasswordVc()
            //                navigationController?.pushViewController(resetPasswordVC, animated: true)
            //            let ResetPassVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "goToResetpage")
            //                    ResetPassVc.modalPresentationStyle = .fullScreen
            //                    self.present(ResetPassVc, animated: true)
            //        }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let resetPasswordVC = storyboard.instantiateViewController(withIdentifier: "goToResetpage") as? ResetPasswordVc {
                navigationController?.pushViewController(resetPasswordVC, animated: true)
            }
        }
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidMobileNo(_ mobileNo: String) -> Bool {
               let PHONE_REGEX = "^[6-9]\\d{9}$"
               let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
               let result = phoneTest.evaluate(with: mobileNo)
               return result
    }
    
    // function for dismissing the keyboard
    func keyBoardDismiss() {
        let tapOutside = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapOutside)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
extension UITextField {
    func addPadding(left: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

extension VerificationPage: UITextFieldDelegate {
    
    //function for onpressing keyboard return function the keyboard will dismiss
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

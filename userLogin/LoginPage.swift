////
////  LoginPage.swift
////  userLogin
////
////  Created by siddappa tambakad on 05/12/23.
////
//
//import UIKit
//
//class LoginPage: UIViewController {
//
//    @IBOutlet var emailTextInputField: UITextField!
//    @IBOutlet var loginButton: UIButton!
//    @IBOutlet var passwordTextInput: UITextField!
//    @IBOutlet var passwordErrorLabel: UILabel!
//    @IBOutlet var emailErrorLabel: UILabel!
//    @IBOutlet var topView: UIView!
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        emailTextInputField.delegate = self
//        passwordTextInput.delegate = self
//
//        // Set default placeholder color
//        emailTextInputField.attributedPlaceholder = NSAttributedString(string: "Email...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
//        passwordTextInput.attributedPlaceholder = NSAttributedString(string: "Password...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
//
//        // adding bottom border for textfields
//        emailTextInputField.addBottomBorder(color: UIColor.black, thickness: 2)
//        passwordTextInput.addBottomBorder(color: UIColor.black, thickness: 2)
//
//        //cornerradius for login button
//        loginButton.layer.cornerRadius = 8
//
//        //bottom borderradius for subview
//        topView.roundCorners([.bottomRight, .bottomLeft], radius: 30)
//
//        //callback for keyboard dismiss
//        keyBoardDismiss()
//    }
//
//    @IBAction func onPressLoginButton(_ sender: UIButton) {
//
//        if let email = emailTextInputField.text {
//            if email.isEmpty {
//                emailErrorLabel.text = "Email id required"
//            } else if !isValidEmail(email)  {
//                emailErrorLabel.text = "Enter valid Email"
//            } else {
//                emailErrorLabel.text = ""
//            }
//        }
//        if let password = passwordTextInput.text {
//            if password.isEmpty {
//                passwordErrorLabel.text = "Password is required"
//            }else if !validatePassword(password) {
//                passwordErrorLabel.text = "Invalid password! Password must contain at least one letter, one digit, and be at least 8 characters long."
//            } else {
//                passwordErrorLabel.text = ""
//            }
//        }
//    }
//    //function for the validating the email
//    @IBAction func onPressForgotPassword(_ sender: UIButton) {
//
//
//    }
//
//    @IBAction func backButtonPress(_ sender: UIButton) {
//        navigationController?.popToRootViewController(animated: true)
//    }
//
//    func isValidEmail(_ email: String) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//
//        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailPred.evaluate(with: email)
//    }
//    //function for password validation
//    func validatePassword(_ password: String) -> Bool {
//        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^A-Za-z\\d\\s])(?=\\S+$).{8,}$"
//        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
//        return passwordPredicate.evaluate(with: password)
//    }
//    // function for dismissing the keyboard
//    func keyBoardDismiss() {
//        let tapOutside = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        view.addGestureRecognizer(tapOutside)
//    }
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//}
//
////// extensions for adding bottom border width for textfields
////extension UITextField {
////    func addBottomBorder(color: UIColor, thickness: CGFloat) {
////        let bottomLine = CALayer()
////        bottomLine.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
////        bottomLine.backgroundColor = color.cgColor
////        self.borderStyle = .none
////        self.layer.addSublayer(bottomLine)
////    }
////}
////
////// extensions for adding when textfield gets focus there is color change
////extension LoginPage: UITextFieldDelegate {
////    func textFieldDidBeginEditing(_ textField: UITextField) {
////        if textField == emailTextInputField {
////            textField.addBottomBorder(color: UIColor.purple, thickness: 2)
////            textField.attributedPlaceholder = NSAttributedString(string: "Email...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.purple])
////        } else if textField == passwordTextInput {
////            textField.addBottomBorder(color: UIColor.purple, thickness: 2)
////            textField.attributedPlaceholder = NSAttributedString(string: "Password...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.purple])
////        }
////    }
////
////    // function for when text field move out focus
////    func textFieldDidEndEditing(_ textField: UITextField) {
////        textField.addBottomBorder(color: UIColor.black, thickness: 2)
////        if textField == emailTextInputField {
////            textField.attributedPlaceholder = NSAttributedString(string: "Email...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
////        } else if textField == passwordTextInput {
////            textField.attributedPlaceholder = NSAttributedString(string: "Password...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
////        }
////    }
////
////    //function for onpressing keyboard return function the keyboard will dismiss
////    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
////        textField.resignFirstResponder()
////        return true
////    }
////}
////// extension to add bottom radius for subview
////extension UIView {
////    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
////        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
////        let mask = CAShapeLayer()
////        mask.path = path.cgPath
////        self.layer.mask = mask
////      }
////}

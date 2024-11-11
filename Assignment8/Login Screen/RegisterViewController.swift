//
//  RegisterViewController.swift
//  Assignment8
//
//  Created by Yuqi Peng on 11/10/24.
//


import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    // MARK: Variables
    private let registerView = RegisterView()
    
    override func loadView() {
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Register"
        
        // MARK: Adding targets for buttons
        registerView.buttonSignUp.addTarget(self, action: #selector(onSignUpButtonTapped), for: .touchUpInside)
    }
    
    // MARK: Button Actions
    @objc func onSignUpButtonTapped() {
        print("Register button tapped")
        
        guard let name = registerView.textFieldName.text, !name.isEmpty,
              let email = registerView.textFieldEmail.text, !email.isEmpty,
              let password = registerView.textFieldPassword.text, !password.isEmpty,
              let reinputPassword = registerView.textFieldReinputPassword.text, !reinputPassword.isEmpty else {
            showAlert(message: "Please fill in all fields to sign up.")
            return
        }
        
        // Validate email format
        if !isValidEmail(email) {
            showAlert(message: "Please enter a valid email address.")
            return
        }
        
        // Check if passwords match
        if password != reinputPassword {
            showAlert(message: "Passwords do not match. Please re-enter.")
            return
        }
        
        // Firebase register function
        registerUser(name: name, email: email, password: password)
    }
    
    // MARK: Firebase Register Function (Placeholder)
    func registerUser(name: String, email: String, password: String) {
        print("Attempting to register with name: \(name), email: \(email)")
        
        // Firebase register logic here
        
        // Navigate back to login page after successful registration
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Helper Methods
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Sign Up Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

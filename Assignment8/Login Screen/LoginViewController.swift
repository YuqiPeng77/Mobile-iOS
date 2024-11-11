//
//  LoginViewController.swift
//  Assignment8
//
//  Created by Yuqi Peng on 11/10/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: Variables
    let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Login"
        
        navigationItem.hidesBackButton = true
        
        // MARK: Button Actions
        loginView.buttonLogin.addTarget(self, action: #selector(onLoginButtonTapped), for: .touchUpInside)
        loginView.buttonRegister.addTarget(self, action: #selector(onRegisterButtonTapped), for: .touchUpInside)
    }
    
    // MARK: Login Action
    @objc func onLoginButtonTapped() {
        guard let email = loginView.textFieldEmail.text, !email.isEmpty,
              let password = loginView.textFieldPassword.text, !password.isEmpty else {
            showAlert(message: "Please enter both email and password.")
            return
        }
        
        print("Login button tapped")
        // Firebase login function placeholder
        loginUser(email: email, password: password)
    }
    
    // MARK: Register Action
    @objc func onRegisterButtonTapped() {
        print("Register button tapped")
        
        // Navigate to Register Screen
        let registerScreen = RegisterViewController()
        navigationController?.pushViewController(registerScreen, animated: true)
    }
    
    // MARK: Firebase Login Function (Placeholder)
    func loginUser(email: String, password: String) {
        print("Attempting to login with email: \(email)")
        
        // MARK: login logic
        // MARK: go to main page
        navigationController?.popViewController(animated: true)

    }
    
    // MARK: Show Notes Function (Placeholder)
    func showNotes() {
        // Placeholder function for post-login navigation
        print("Navigate to notes screen after login")
        // Example:
        // let notesViewController = NotesViewController()
        // navigationController?.pushViewController(notesViewController, animated: true)
    }
    
    // MARK: Alert Function
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Login Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

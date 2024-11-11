//
//  LoginView.swift
//  Assignment8
//
//  Created by Yuqi Peng on 11/10/24.
//

import UIKit

class LoginView: UIView {
    
    // MARK: UI Elements
    var labelEmail: UILabel!
    var textFieldEmail: UITextField!
    var labelPassword: UILabel!
    var textFieldPassword: UITextField!
    var buttonLogin: UIButton!
    var buttonRegister: UIButton!
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelEmail()
        setupTextFieldEmail()
        setupLabelPassword()
        setupTextFieldPassword()
        setupButtonLogin()
        setupButtonRegister()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup Methods
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.text = "Email"
        labelEmail.font = .systemFont(ofSize: 16, weight: .medium)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setupTextFieldEmail() {
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Enter your email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.autocapitalizationType = .none
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupLabelPassword() {
        labelPassword = UILabel()
        labelPassword.text = "Password"
        labelPassword.font = .systemFont(ofSize: 16, weight: .medium)
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPassword)
    }
    
    func setupTextFieldPassword() {
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Enter your password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    
    func setupButtonLogin() {
        buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.backgroundColor = .systemBlue
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.layer.cornerRadius = 8
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
    }
    
    func setupButtonRegister() {
        buttonRegister = UIButton(type: .system)
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.backgroundColor = .systemGray
        buttonRegister.setTitleColor(.white, for: .normal)
        buttonRegister.layer.cornerRadius = 8
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonRegister)
    }
    
    // MARK: Constraints Setup
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Email Label
            labelEmail.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            labelEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            // Email TextField
            textFieldEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 8),
            textFieldEmail.leadingAnchor.constraint(equalTo: labelEmail.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: labelEmail.trailingAnchor),
            
            // Password Label
            labelPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            labelPassword.leadingAnchor.constraint(equalTo: labelEmail.leadingAnchor),
            labelPassword.trailingAnchor.constraint(equalTo: labelEmail.trailingAnchor),
            
            // Password TextField
            textFieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 8),
            textFieldPassword.leadingAnchor.constraint(equalTo: labelPassword.leadingAnchor),
            textFieldPassword.trailingAnchor.constraint(equalTo: labelPassword.trailingAnchor),
            
            // Login Button
            buttonLogin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 24),
            buttonLogin.leadingAnchor.constraint(equalTo: labelEmail.leadingAnchor),
            buttonLogin.trailingAnchor.constraint(equalTo: labelEmail.trailingAnchor),
            buttonLogin.heightAnchor.constraint(equalToConstant: 44),
            
            // Register Button
            buttonRegister.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 12),
            buttonRegister.leadingAnchor.constraint(equalTo: labelEmail.leadingAnchor),
            buttonRegister.trailingAnchor.constraint(equalTo: labelEmail.trailingAnchor),
            buttonRegister.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

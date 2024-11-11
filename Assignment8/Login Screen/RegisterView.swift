//
//  RegisterView.swift
//  Assignment8
//
//  Created by Yuqi Peng on 11/10/24.
//

import UIKit

class RegisterView: UIView {

    // MARK: UI Elements
    var labelName: UILabel!
    var textFieldName: UITextField!
    var labelEmail: UILabel!
    var textFieldEmail: UITextField!
    var labelPassword: UILabel!
    var textFieldPassword: UITextField!
    var labelReinputPassword: UILabel!
    var textFieldReinputPassword: UITextField!
    var buttonSignUp: UIButton!
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelName()
        setupTextFieldName()
        setupLabelEmail()
        setupTextFieldEmail()
        setupLabelPassword()
        setupTextFieldPassword()
        setupLabelReinputPassword()
        setupTextFieldReinputPassword()
        setupButtonSignUp()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup Methods
    func setupLabelName() {
        labelName = UILabel()
        labelName.text = "Name"
        labelName.font = .systemFont(ofSize: 16, weight: .medium)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupTextFieldName() {
        textFieldName = UITextField()
        textFieldName.placeholder = "Enter your name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.autocapitalizationType = .words
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
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
    
    func setupLabelReinputPassword() {
        labelReinputPassword = UILabel()
        labelReinputPassword.text = "Re-enter Password"
        labelReinputPassword.font = .systemFont(ofSize: 16, weight: .medium)
        labelReinputPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelReinputPassword)
    }
    
    func setupTextFieldReinputPassword() {
        textFieldReinputPassword = UITextField()
        textFieldReinputPassword.placeholder = "Re-enter your password"
        textFieldReinputPassword.borderStyle = .roundedRect
        textFieldReinputPassword.isSecureTextEntry = true
        textFieldReinputPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldReinputPassword)
    }
    
    func setupButtonSignUp() {
        buttonSignUp = UIButton(type: .system)
        buttonSignUp.setTitle("Sign Up", for: .normal)
        buttonSignUp.backgroundColor = .systemBlue
        buttonSignUp.setTitleColor(.white, for: .normal)
        buttonSignUp.layer.cornerRadius = 8
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignUp)
    }
    
    // MARK: Constraints Setup
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Name Label
            labelName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            labelName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            // Name TextField
            textFieldName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            textFieldName.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            textFieldName.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            
            // Email Label
            labelEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            labelEmail.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelEmail.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            
            // Email TextField
            textFieldEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 8),
            textFieldEmail.leadingAnchor.constraint(equalTo: labelEmail.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: labelEmail.trailingAnchor),
            
            // Password Label
            labelPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            labelPassword.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelPassword.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            
            // Password TextField
            textFieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 8),
            textFieldPassword.leadingAnchor.constraint(equalTo: labelPassword.leadingAnchor),
            textFieldPassword.trailingAnchor.constraint(equalTo: labelPassword.trailingAnchor),
            
            // Re-enter Password Label
            labelReinputPassword.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 16),
            labelReinputPassword.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelReinputPassword.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            
            // Re-enter Password TextField
            textFieldReinputPassword.topAnchor.constraint(equalTo: labelReinputPassword.bottomAnchor, constant: 8),
            textFieldReinputPassword.leadingAnchor.constraint(equalTo: labelReinputPassword.leadingAnchor),
            textFieldReinputPassword.trailingAnchor.constraint(equalTo: labelReinputPassword.trailingAnchor),
            
            // Sign Up Button
            buttonSignUp.topAnchor.constraint(equalTo: textFieldReinputPassword.bottomAnchor, constant: 24),
            buttonSignUp.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            buttonSignUp.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            buttonSignUp.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}


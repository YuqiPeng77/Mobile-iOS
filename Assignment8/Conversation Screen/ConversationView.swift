//
//  ConversationView.swift
//  Assignment8
//
//  Created by Yuqi Peng on 11/10/24.
//

import UIKit

class ConversationView: UIView {

    // MARK: UI Elements
    var tableView: UITableView!
    var inputContainerView: UIView!
    var textFieldMessage: UITextField!
    var buttonSend: UIButton!
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupTableView()
        setupInputContainer()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup Methods
    func setupTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none  // 去掉分隔线
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        self.addSubview(tableView)
    }
    
    func setupInputContainer() {
        inputContainerView = UIView()
        inputContainerView.backgroundColor = .systemGray6
        inputContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(inputContainerView)
        
        textFieldMessage = UITextField()
        textFieldMessage.placeholder = "Enter message..."
        textFieldMessage.borderStyle = .roundedRect
        textFieldMessage.translatesAutoresizingMaskIntoConstraints = false
        inputContainerView.addSubview(textFieldMessage)
        
        buttonSend = UIButton(type: .system)
        buttonSend.setTitle("Send", for: .normal)
        buttonSend.translatesAutoresizingMaskIntoConstraints = false
        inputContainerView.addSubview(buttonSend)
    }
    
    // MARK: Constraints Setup
    func initConstraints() {
        NSLayoutConstraint.activate([
            // TableView Constraints
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: inputContainerView.topAnchor),
            
            // Input Container View Constraints
            inputContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            inputContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            inputContainerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            inputContainerView.heightAnchor.constraint(equalToConstant: 50),
            
            // TextField Constraints
            textFieldMessage.leadingAnchor.constraint(equalTo: inputContainerView.leadingAnchor, constant: 8),
            textFieldMessage.centerYAnchor.constraint(equalTo: inputContainerView.centerYAnchor),
            textFieldMessage.trailingAnchor.constraint(equalTo: buttonSend.leadingAnchor, constant: -8),
            textFieldMessage.heightAnchor.constraint(equalToConstant: 36),
            
            // Send Button Constraints
            buttonSend.trailingAnchor.constraint(equalTo: inputContainerView.trailingAnchor, constant: -8),
            buttonSend.centerYAnchor.constraint(equalTo: inputContainerView.centerYAnchor)
        ])
    }
}

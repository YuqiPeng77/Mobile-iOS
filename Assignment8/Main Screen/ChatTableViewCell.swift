//
//  ChatTableViewCell.swift
//  Assignment8
//
//  Created by Yuqi Peng on 11/10/24.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelFriendName: UILabel!
    var labelLastMessage: UILabel!
    var labelMessageDate: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelFriendName()
        setupLabelLastMessage()
        setupLabelMessageDate()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup Wrapper Cell View
    func setupWrapperCellView() {
        wrapperCellView = UIView()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    // MARK: Setup Friend Name Label
    func setupLabelFriendName() {
        labelFriendName = UILabel()
        labelFriendName.font = UIFont.boldSystemFont(ofSize: 18)
        labelFriendName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelFriendName)
    }
    
    // MARK: Setup Last Message Label
    func setupLabelLastMessage() {
        labelLastMessage = UILabel()
        labelLastMessage.font = UIFont.systemFont(ofSize: 14)
        labelLastMessage.textColor = .darkGray
        labelLastMessage.numberOfLines = 1
        labelLastMessage.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelLastMessage)
    }
    
    // MARK: Setup Message Date Label
    func setupLabelMessageDate() {
        labelMessageDate = UILabel()
        labelMessageDate.font = UIFont.systemFont(ofSize: 12)
        labelMessageDate.textColor = .lightGray
        labelMessageDate.textAlignment = .right
        labelMessageDate.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelMessageDate)
    }
    
    // MARK: Setup Constraints
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelFriendName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelFriendName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelFriendName.trailingAnchor.constraint(lessThanOrEqualTo: labelMessageDate.leadingAnchor, constant: -8),
            labelFriendName.heightAnchor.constraint(equalToConstant: 20),
            
            labelLastMessage.topAnchor.constraint(equalTo: labelFriendName.bottomAnchor, constant: 4),
            labelLastMessage.leadingAnchor.constraint(equalTo: labelFriendName.leadingAnchor),
            labelLastMessage.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),
            labelLastMessage.heightAnchor.constraint(equalToConstant: 16),
            
            labelMessageDate.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelMessageDate.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),
            labelMessageDate.widthAnchor.constraint(equalToConstant: 80),
            labelMessageDate.heightAnchor.constraint(equalToConstant: 16),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 72)
        ])
    }
}

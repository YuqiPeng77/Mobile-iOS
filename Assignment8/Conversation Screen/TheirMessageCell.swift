//
//  TheirMessageCell.swift
//  Assignment8
//
//  Created by Yuqi Peng on 11/10/24.
//

import UIKit

class TheirMessageCell: UITableViewCell {
    var messageLabel: UILabel!
    var bubbleBackgroundView: UIView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupBubbleBackgroundView()
        setupMessageLabel()
        initConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBubbleBackgroundView() {
        bubbleBackgroundView = UIView()
        bubbleBackgroundView.backgroundColor = .lightGray
        bubbleBackgroundView.layer.cornerRadius = 12
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubbleBackgroundView)
    }

    func setupMessageLabel() {
        messageLabel = UILabel()
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.addSubview(messageLabel)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            bubbleBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bubbleBackgroundView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -50),
            
            messageLabel.topAnchor.constraint(equalTo: bubbleBackgroundView.topAnchor, constant: 8),
            messageLabel.bottomAnchor.constraint(equalTo: bubbleBackgroundView.bottomAnchor, constant: -8),
            messageLabel.leadingAnchor.constraint(equalTo: bubbleBackgroundView.leadingAnchor, constant: 12),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleBackgroundView.trailingAnchor, constant: -12)
        ])
    }
}

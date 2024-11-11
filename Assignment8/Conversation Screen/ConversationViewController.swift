//
//  ConversationViewController.swift
//  Assignment8
//
//  Created by Yuqi Peng on 11/10/24.
//

import UIKit

class ConversationViewController: UIViewController {

    let conversationView = ConversationView()
    var messages: [Message] = []
    var name: String = ""

    override func loadView() {
        view = conversationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        
        
        // MARK: fake conversation for test
        // MARK: need to get the message from the firebase storage
        messages = [
            Message(text: "Hi there! How's it going?", sender: .other),
            Message(text: "Hey! I'm doing well, just busy with some work. What about you?", sender: .me),
            Message(text: "Same here! Just trying to finish up some projects.", sender: .other),
            Message(text: "Are you working on that app you mentioned last time?", sender: .me),
            Message(text: "Yes! It’s been keeping me up late these days, haha.", sender: .other),
            Message(text: "I know that feeling! Anything I can help with?", sender: .me),
            Message(text: "Actually, yes! I'm struggling with the UI. It’s not coming together well.", sender: .other),
            Message(text: "I'd love to help! Just send me the files or share your screen.", sender: .me),
            Message(text: "That would be awesome. I’ll send them over tonight.", sender: .other),
            Message(text: "Perfect! I’ll take a look after my meetings. How’s everything else going?", sender: .me),
            Message(text: "Pretty good. Just trying to find some balance, you know?", sender: .other),
            Message(text: "Absolutely. Life gets busy, especially with side projects.", sender: .me),
            Message(text: "Totally. By the way, are you free this weekend?", sender: .other),
            Message(text: "Yes! What’s the plan?", sender: .me),
            Message(text: "A few of us are thinking of going hiking. You should join!", sender: .other),
            Message(text: "Sounds great! I could use some fresh air and exercise.", sender: .me),
            Message(text: "Awesome! I’ll add you to the group chat for details.", sender: .other),
            Message(text: "Thanks! It’ll be nice to catch up with everyone.", sender: .me),
            Message(text: "Absolutely! It’s been too long since we all hung out.", sender: .other),
            Message(text: "Looking forward to it! Let’s make it a fun day!", sender: .me)
        ]
        
        conversationView.tableView.delegate = self
        conversationView.tableView.dataSource = self
        conversationView.tableView.register(MyMessageCell.self, forCellReuseIdentifier: Configs.myMessageCell)
        conversationView.tableView.register(TheirMessageCell.self, forCellReuseIdentifier: Configs.theirMessageCell)
        let lastIndex = IndexPath(row: messages.count - 1, section: 0)
        conversationView.tableView.scrollToRow(at: lastIndex, at: .bottom, animated: true)

        // MARK: send button
        conversationView.buttonSend.addTarget(self, action: #selector(onSendButtonTapped), for: .touchUpInside)
    }
    
    
    // MARK: send logic
    @objc func onSendButtonTapped() {
        // if no input
        guard let messageText = conversationView.textFieldMessage.text, !messageText.isEmpty else {
            return
        }
        
        print("Button send tapped")
        

        // MARK: for test
        let newMessage = Message(text: messageText, sender: .me)
        messages.append(newMessage)
        
        
        // MARK: connect to firebase storage
        uploadMessage()
        
        conversationView.tableView.reloadData()
        
        // clear the textField
        conversationView.textFieldMessage.text = ""
        
        // go to the new messages
        let lastIndex = IndexPath(row: messages.count - 1, section: 0)
        conversationView.tableView.scrollToRow(at: lastIndex, at: .bottom, animated: true)
    }
    
    // MARK: connect to firebase storage
    func uploadMessage() {
        // TODO: add this conversation to storage
        
        // TODO: make sure the Data Models will load the new message
        
    }
    
}


extension ConversationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        if message.sender == .me {
            let cell = tableView.dequeueReusableCell(withIdentifier: Configs.myMessageCell, for: indexPath) as! MyMessageCell
            cell.messageLabel.text = message.text
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Configs.theirMessageCell, for: indexPath) as! TheirMessageCell
            cell.messageLabel.text = message.text
            return cell
        }
    }
}

// MARK: UITableViewDelegate
extension ConversationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

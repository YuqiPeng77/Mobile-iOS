//
//  ViewController.swift
//  Assignment8
//
//  Created by Yuqi Peng on 11/10/24.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    let mainScreen = MainView()
    var chatList = [Chat]()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser:FirebaseAuth.User?
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Chats"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(onButtonLogoutTapped))
        
        mainScreen.tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: Configs.tableViewChatCell)
        
        mainScreen.tableView.delegate = self
        mainScreen.tableView.dataSource = self
        
        // MARK: test example, should load from the storage by a for loop?
        chatList = [
            Chat(name: "Alice", message: "Hey, how are you?", time: "10:30 AM", email: "alice@neu.edu"),
            Chat(name: "Bob", message: "Let's meet tomorrow.", time: "Yesterday", email: "bob@neu.edu"),
            Chat(name: "Charlie", message: "I'll call you later.", time: "2:15 PM", email: "charlie@neu.edu")
        ]
        
        mainScreen.tableView.reloadData()
    }
    
    
    @objc func onButtonLogoutTapped() {
        // MARK: exit logic
        print("Logout button tapped")
        
        let alert = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { [weak self] _ in
            // logout logic
            self?.logoutUser()
        }))
        
        present(alert, animated: true, completion: nil)

    }
    
    // MARK: logic to logout the user
    func logoutUser() {
        // MARK: test to login page
        let loginScreen = LoginViewController()
        navigationController?.pushViewController(loginScreen, animated: true)
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    
//        
//        
//        // MARK: handling if the Authentication state is changed (sign in, sign out, register)...
//        // MARK: uncomment the following code
//        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
//            if user == nil{
//                //MARK: not signed in...
//                self.currentUser = nil
//                self.chatList.removeAll()
//                self.mainScreen.tableView.reloadData()
//                // MARK: go to login page
//                
//            }else{
//                //MARK: the user is signed in...
//                self.currentUser = user
//                
//            }
//        }
//    }
    
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        Auth.auth().removeStateDidChangeListener(handleAuth!)
//    }
    
    
    
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewChatCell, for: indexPath) as! ChatTableViewCell
        let chat = chatList[indexPath.row]
        
        cell.labelFriendName.text = chat.name
        cell.labelLastMessage.text = chat.message
        cell.labelMessageDate.text = chat.time
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chat = chatList[indexPath.row]
        print("Selected chat with: \(chat.email)")
        
        // MARK: load conversation
        
        
        // MARK: go to chat page
        let conversationScreen = ConversationViewController()
        conversationScreen.name = chat.name
        navigationController?.pushViewController(conversationScreen, animated: true)
        
        
        
        
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}


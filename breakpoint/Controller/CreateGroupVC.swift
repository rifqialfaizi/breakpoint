//
//  CreateGroupVC.swift
//  breakpoint
//
//  Created by Rifqi Alfaizi on 04/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupVC: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var emailSearchTextField: UITextField!
    
    @IBOutlet weak var groupMemberLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
   
    var emailArray = [String]()
    var chosenUserArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneBtn.isHidden = true
    }
    
    @objc func textFieldDidChange() {
        if emailSearchTextField.text == "" {
            emailArray = []
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!) { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func doneBtnWasPressed(_ sender: Any) {
        if titleTextField.text != "" && descriptionTextField.text != ""  {
            DataService.instance.getIds(forUsernames: chosenUserArray) { (idsArray) in
                var userIds = idsArray
                userIds.append((Auth.auth().currentUser?.uid)!)
                
                DataService.instance.createGroup(withTitle: self.titleTextField.text!, andDescription: self.descriptionTextField.text!, forUserIds: userIds, handler: { (groupCreated) in
                    if groupCreated {
                        self.dismiss(animated: true, completion: nil)
                    }else {
                        print("Group could not be created. please try again.")
                    }
                })
            }
        }
    }
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else {
            return UITableViewCell() }
        let profileImage = UIImage(named: "defaultProfileImage")
        
        if chosenUserArray.contains(emailArray[indexPath.row]) {
               cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: true)
        } else {
               cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: false)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        if !chosenUserArray.contains(cell.emailLbl.text!) {
            chosenUserArray.append(cell.emailLbl.text!)
            groupMemberLbl.text = chosenUserArray.joined(separator: ", ")
            doneBtn.isHidden = false
        } else {
            chosenUserArray = chosenUserArray.filter({ $0 != cell.emailLbl.text! })
            if chosenUserArray.count >= 1 {
                groupMemberLbl.text = chosenUserArray.joined(separator: ", ")
            } else {
                groupMemberLbl.text = "add people to your group"
                doneBtn.isHidden = true
            }
        }
    }
}

extension CreateGroupVC: UITextFieldDelegate {
    
}

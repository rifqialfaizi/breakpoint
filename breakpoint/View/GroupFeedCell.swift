//
//  GroupFeedCell.swift
//  breakpoint
//
//  Created by Rifqi Alfaizi on 10/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
    
}



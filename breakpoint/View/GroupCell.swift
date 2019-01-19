//
//  GroupCell.swift
//  breakpoint
//
//  Created by Rifqi Alfaizi on 08/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupLbl: UILabel!
    @IBOutlet weak var groupDescLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupLbl.text = title
        self.groupDescLbl.text = description
        self.memberCountLbl.text = "\(memberCount) members."
    }

}

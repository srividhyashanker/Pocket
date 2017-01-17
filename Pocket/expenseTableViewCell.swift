//
//  expenseTableViewCell.swift
//  Pocket
//
//  Created by Nidhi Jain on 7/26/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit

class expenseTableViewCell: UITableViewCell {
    let user = User.sharedInstance

    @IBOutlet weak var cellText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        user.chosenCategory = cellText.text!
        // Configure the view for the selected state
    }

}

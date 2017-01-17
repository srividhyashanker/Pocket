//
//  SavingsTableViewCell.swift
//  Pocket
//
//  Created by Jananni Rathnagiri on 7/27/15.
//  Copyright (c) 2015 Nidhi Jain. All rights reserved.
//

import UIKit

class SavingsTableViewCell: UITableViewCell {
    let user = User.sharedInstance
    
    @IBOutlet weak var cellName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        user.chosenIncomeCategory = cellName.text!
        // Configure the view for the selected state
    }

}

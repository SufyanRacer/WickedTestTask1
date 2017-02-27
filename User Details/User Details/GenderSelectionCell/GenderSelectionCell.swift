//
//  GenderSelectionCell.swift
//  User Details
//
//  Created by grepruby on 23/02/17.
//  Copyright © 2017 Sufyan. All rights reserved.
//

import UIKit

class GenderSelectionCell: UITableViewCell {

    
    @IBOutlet weak var genderIconImageView: UIImageView!
    
    @IBOutlet weak var genderMaleButton: UIButton!
    
    @IBOutlet weak var genderFemaleButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

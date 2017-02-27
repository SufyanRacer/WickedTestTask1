//
//  DetailCell.swift
//  User Details
//
//  Created by grepruby on 22/02/17.
//  Copyright © 2017 Sufyan. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var informationTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

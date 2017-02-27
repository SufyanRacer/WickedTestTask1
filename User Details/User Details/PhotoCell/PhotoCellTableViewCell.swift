//
//  PhotoCellTableViewCell.swift
//  User Details
//
//  Created by grepruby on 22/02/17.
//  Copyright © 2017 Sufyan. All rights reserved.
//

import UIKit

class PhotoCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var chooseImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

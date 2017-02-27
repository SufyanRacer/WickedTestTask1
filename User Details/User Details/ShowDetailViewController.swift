//
//  ShowDetailViewController.swift
//  User Details
//
//  Created by grepruby on 24/02/17.
//  Copyright © 2017 Sufyan. All rights reserved.
//

import UIKit

class ShowDetailViewController: UIViewController {

    var user: User? = nil
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userDetailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userImage.image = user?.image.image
        showDetailsWithUserData()
    }
    
    override func viewWillLayoutSubviews() {
        userDetailsLabel.sizeToFit()
    }
    
    func showDetailsWithUserData() {
        
        let lightAttrib:[String:AnyObject] = [NSFontAttributeName : UIFont(name: "Avenir-Medium", size: 20)!]
        let boldAttrib:[String:AnyObject] = [NSFontAttributeName : UIFont(name: "Avenir-Black", size: 21)!]
        let attribString: NSMutableAttributedString = NSMutableAttributedString()
        
        attribString.append(NSAttributedString(string: "Meet ", attributes: lightAttrib))
        attribString.append(NSAttributedString(string: (user?.name)!, attributes: boldAttrib))
        
        if user?.gender == "Male"{
            attribString.append(NSAttributedString(string: " 👦🏻.\n\nHe born 👼🏻 in ", attributes: lightAttrib))
        
        }else{
            attribString.append(NSAttributedString(string: " 👩🏻.\n\nShe born 👼🏻 in ", attributes: lightAttrib))
        }
        attribString.append(NSAttributedString(string: (user?.dobString)!, attributes: boldAttrib))
        attribString.append(NSAttributedString(string: ".\n\nYou can contact ", attributes: lightAttrib))
        if user?.gender == "Male" {
            attribString.append(NSAttributedString(string: "him on email 📧", attributes: lightAttrib))
        } else {
            attribString.append(NSAttributedString(string: "her on email 📧 ", attributes: lightAttrib))
        }
        attribString.append(NSAttributedString(string: (user?.email)!, attributes: boldAttrib))
        attribString.append(NSAttributedString(string: ".\nOr if you have Urgent work please contact on phone: ", attributes: lightAttrib))
        attribString.append(NSAttributedString(string: (user?.phoneNumber)!, attributes: boldAttrib))
        userDetailsLabel.attributedText = attribString
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

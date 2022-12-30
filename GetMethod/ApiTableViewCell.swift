//
//  ApiTableViewCell.swift
//  GetMethod
//
//  Created by IOS on 30/12/22.
//

import UIKit

class ApiTableViewCell: UITableViewCell {

    @IBOutlet weak var idLB: UILabel!
    
    @IBOutlet weak var apiImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

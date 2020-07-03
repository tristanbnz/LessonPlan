//
//  PapersTableViewCell.swift
//  CVTest1
//
//  Created by Tristan Brynildsen on 14/05/20.
//  Copyright © 2020 Tristan Brynildsen. All rights reserved.
//

import UIKit

class PapersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var paperCode: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

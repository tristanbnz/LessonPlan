//
//  PaperOccuranceCellTableViewCell.swift
//  CVTest1
//
//  Created by Tristan Brynildsen on 18/05/20.
//  Copyright © 2020 Tristan Brynildsen. All rights reserved.
//

import UIKit

class PaperOccuranceCellTableViewCell: UITableViewCell {
    @IBOutlet weak var occuranceType: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  OccuranceTableViewCell.swift
//  LessonPlan
//
//  Created by Tristan Brynildsen on 4/07/20.
//  Copyright © 2020 Tristan Brynildsen. All rights reserved.
//

import UIKit

class OccuranceTableViewCell: UITableViewCell {

    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var occuranceTypeLabel: UILabel!
    @IBOutlet weak var paperNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

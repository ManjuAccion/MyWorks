//
//  AssetsInfoCell.swift
//  EquityLister
//
//  Created by Manjunath on 21/12/19.
//  Copyright © 2019 Accionlabs. All rights reserved.
//

import UIKit

class AssetsInfoCell: UITableViewCell {
    @IBOutlet var keyLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

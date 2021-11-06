//
//  DetailTableViewCell.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 06/11/2021.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

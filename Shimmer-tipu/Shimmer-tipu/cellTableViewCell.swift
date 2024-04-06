//
//  cellTableViewCell.swift
//  Shimmer-tipu
//
//  Created by LEADS Corporation Limited on 6/4/24.
//

import UIKit

class cellTableViewCell: UITableViewCell {
    static let identifier = "cell"
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var tapHere: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

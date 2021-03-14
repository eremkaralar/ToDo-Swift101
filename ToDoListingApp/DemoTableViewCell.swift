//
//  DemoTableViewCell.swift
//  ToDoListingApp
//
//  Created by Erem Karalar on 14.03.2021.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    
    @IBOutlet var TaskImage: UIImageView!
    @IBOutlet var TaskName: UILabel!
    @IBOutlet var TaskDue: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

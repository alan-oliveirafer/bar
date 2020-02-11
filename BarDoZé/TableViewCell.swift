//
//  TableViewCell.swift
//  BarDoZe
//
//  Created by Jonathan on 07/02/20.
//  Copyright © 2020 hbsis. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    //MARK: Properties
    //MARK: Propriedades
   
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var imgBar: UIImageView!
    
    @IBOutlet weak var nomeBar: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

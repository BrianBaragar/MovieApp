//
//  MovieCell.swift
//  Movie App
//
//  Created by Brian Baragar on 06/01/21.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var tittleMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  DogTableViewCell.swift
//  DogsApi
//
//  Created by Ayodeji Ayankola on 8/7/20.
//  Copyright © 2020 konga.com. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabl: UILabel!
    
    
  
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
//        
//        nameLabl.lineBreakMode = .byCharWrapping
//        nameLabl.numberOfLines = 0
      
    }

}

//
//  DogViewController.swift
//  DogsApi
//
//  Created by Ayodeji Ayankola on 8/7/20.
//  Copyright © 2020 konga.com. All rights reserved.
//

import UIKit
import SDWebImage

class DogViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var originLabel: UILabel!
    
    @IBOutlet weak var breedLabel: UILabel!
    
    @IBOutlet weak var lifeSpanLabel: UILabel!
    

    @IBOutlet weak var temperamentLabel: UILabel!
    
    var dogs:Dog?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = dogs?.name
        originLabel.text = dogs?.origin
        breedLabel.text = dogs?.breed_group
        lifeSpanLabel.text = dogs?.life_span
        
        temperamentLabel.text = dogs?.temperament
        let urlString = dogs?.url
//        let fecthedUrl = URL(string: urlString!)
      //  imageView.downloaded(from: urlString!)
        imageView.sd_setImage(with:  URL(string: urlString!))
        
     
        
//        let imgView = cell.viewWithTag(1) as! UIImageView
//        imgView.sd_setImage(with: URL(string: urlString))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

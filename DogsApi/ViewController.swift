//
//  ViewController.swift
//  DogsApi
//
//  Created by Ayodeji Ayankola on 8/7/20.
//  Copyright © 2020 konga.com. All rights reserved.
//

import UIKit
import SDWebImage

//extension UIImageView {
//    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() {
//                self.image = image
//            }
//        }.resume()
//    }
//    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
//}



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var dogs = [Dog]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        downloadJson {
                   self.tableView.reloadData()
            
                   
               }
        
        tableView.delegate = self
        tableView.dataSource = self
//          tableView.rowHeight = 100.0
//        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! DogTableViewCell
        
      //cell.textLabel?.text = dogs[indexPath.row].name.capitalized
       cell.nameLabl?.text = dogs[indexPath.row].name.capitalized


        
//        cell.imageView?.contentMode = .scaleAspectFill
        let urlString = dogs[indexPath.row].url!
        
        let imgView = cell.viewWithTag(1) as! UIImageView
        imgView.sd_setImage(with: URL(string: urlString))
        
        
//        cell.imgView.downloaded(from: urlString!)
       
       return cell
                //cell.imageView?.downloaded(from: urlString!)
                
               // cell.imageView?.clipsToBounds = true
              //  cell.imageView?.layer.cornerRadius = (cell.imageView?.frame.width)! / 2
             //   cell.imageView?.contentMode = .scaleAspectFill
        //       cell.imageView?.layer.masksToBounds = true
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150.0
//    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DogViewController {
            destination.dogs = dogs[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }

    

    func downloadJson(completed: @escaping () -> ()) {

        if let url = URL(string: "https://raw.githubusercontent.com/DevTides/DogsApi/master/dogs.json") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                //save the data in the cache

                 do {
                    let dogs = try JSONDecoder().decode([Dog].self, from: data)
                    
                    //print(dogs)
                    DispatchQueue.main.async {
                       self.dogs   = dogs
                       self.tableView.reloadData()
                        completed()
                    }
                 } catch let error {
                   print(error)
                 }
              }
           }.resume()
        
    }
    }


}


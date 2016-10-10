//
//  PersonCell.swift
//  missing-persons
//
//  Created by Hashim Ikram on 09/10/2016.
//  Copyright © 2016 Hashim Ikram. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    @IBOutlet weak var personImg: UIImageView!
    
    var person: Person!
    
    
    
    func configureCell(person: Person) {
        //self.person = person
        if let url = URL(string: "\(baseURL)\(person.personImgURL!)"){
            downloadImg(url: url)
        }
    }
    
    func downloadImg(url: URL) {
        getDataFromUrl(url: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data , error == nil else { return }
                self.personImg.image = UIImage(data: data)
                self.person.personImg = self.personImg.image
                self.person.downloadFaceID()
            }
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping ((_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void)) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
    
}

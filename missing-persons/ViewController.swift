//
//  ViewController.swift
//  missing-persons
//
//  Created by Hashim Ikram on 08/10/2016.
//  Copyright © 2016 Hashim Ikram. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var selectedImg: UIImageView!
    
    let baseURL = "http://localhost:6069/img/"
    let missingPeople = [
        "person1.jpg",
        "person2.jpg",
        "person3.jpg",
        "person4.jpg",
        "person5.jpg",
        "Untitled.png"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.delegate = self
        collectionView.dataSource = self
    }


    @IBAction func checkForMatch(_ sender: AnyObject) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return missingPeople.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath) as! PersonCell
        let url = "\(baseURL)\(missingPeople[indexPath.row])"
        cell.configureCell(imgUrl: url)
        return cell
    }
    
}


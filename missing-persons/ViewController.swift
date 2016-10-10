//
//  ViewController.swift
//  missing-persons
//
//  Created by Hashim Ikram on 08/10/2016.
//  Copyright © 2016 Hashim Ikram. All rights reserved.
//

import UIKit
import ProjectOxfordFace

let baseURL = "http://localhost:6069/img/"

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var selectedImg: UIImageView!
    
    let imgPicker = UIImagePickerController()
    
    
    
    let missingPersons = [
        Person(personImgURL: "person1.jpg"),
        Person(personImgURL: "person2.jpg"),
        Person(personImgURL: "person3.jpg"),
        Person(personImgURL: "person4.jpg"),
        Person(personImgURL: "person5.jpg"),
        Person(personImgURL: "person6.png"),
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.delegate = self
        collectionView.dataSource = self
        imgPicker.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(loadPicker(gesture:)))
        tap.numberOfTapsRequired = 1
        selectedImg.addGestureRecognizer(tap)
    }
    
    @IBAction func checkForMatch(_ sender: AnyObject) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return missingPersons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath) as! PersonCell
        //let url = "\(baseURL)\(missingPeople[indexPath.row])"
        let person = missingPersons[indexPath.row]
        cell.configureCell(person: person)
        return cell
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImg = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectedImg.image = pickedImg
        }
        dismiss(animated: true, completion: nil)
    }
    
    func loadPicker(gesture: UITapGestureRecognizer) {
        imgPicker.allowsEditing = false
        imgPicker.sourceType = .photoLibrary
        present(imgPicker, animated: true, completion: nil)
    }
}










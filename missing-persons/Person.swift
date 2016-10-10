//
//  Person.swift
//  missing-persons
//
//  Created by Hashim Ikram on 09/10/2016.
//  Copyright © 2016 Hashim Ikram. All rights reserved.
//

import Foundation
import ProjectOxfordFace
import UIKit

class Person {
    
    var faceId: String?
    var personImg: UIImage?
    var personImgURL: String?
    
    init(personImgURL: String)
    {
        self.personImgURL = personImgURL
    }
    
    func downloadFaceID() {
        if let img = personImg, let imgData = UIImageJPEGRepresentation(img, 0.8) {
            FaceService.instance.client?.detect(with: imgData, returnFaceId: true, returnFaceLandmarks: false, returnFaceAttributes: nil, completionBlock: { (faces: [MPOFace]?, error: Error?) in
                if error == nil {
                    var faceId: String?
                    for face in faces! {
                        faceId = face.faceId
                        print("FaceId: \(faceId)")
                        break
                    }
                    self.faceId = faceId
                }
            }).resume()
//            FaceService.instance.client?.detect(with: imgData, returnFaceId: true, returnFaceLandmarks:                   false, returnFaceAttributes: nil, completionBlock: { (faces: [MPOFace]!, error: Error!) in
//                  
//                    if err == nil {
//                        var faceId: String?
//                        for face in faces {
//                            faceId = face.faceId
//                            
//                            break
//                        }
//                        
//                        self.faceId = faceId
//                    }
//                })
        }
    }
    
}

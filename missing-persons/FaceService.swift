//
//  FaceService.swift
//  missing-persons
//
//  Created by Hashim Ikram on 09/10/2016.
//  Copyright © 2016 Hashim Ikram. All rights reserved.
//

import Foundation
import ProjectOxfordFace


class FaceService {
    static let instance = FaceService()
    
    let client = MPOFaceServiceClient(subscriptionKey: "9ef309aa82574ea1a833e9e810ba5865")
}

//
//  Feature.swift
//  Enumeration-CollectionView
//
//  Created by JeremyXue on 2019/2/18.
//  Copyright © 2019 JeremyXue. All rights reserved.
//

import Foundation

struct Feature {
    var name: String
    var name_en: String
    var imageName: String
    
    init(name: String, name_en: String) {
        self.name = name
        self.name_en = name_en
        self.imageName = name_en + ".image"
    }
}

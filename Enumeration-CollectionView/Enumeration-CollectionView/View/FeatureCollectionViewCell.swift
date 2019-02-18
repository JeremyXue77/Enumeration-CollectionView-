//
//  FeatureCollectionViewCell.swift
//  Enumeration-CollectionView
//
//  Created by JeremyXue on 2019/2/18.
//  Copyright © 2019 JeremyXue. All rights reserved.
//

import UIKit

class FeatureCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var featureBackView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var featureNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        featureBackView.layer.cornerRadius = featureBackView.bounds.height / 10
        featureBackView.layer.borderColor = UIColor.white.cgColor
        featureBackView.layer.borderWidth = 1
        featureBackView.clipsToBounds = true
    }
    
    func update(feature: Feature) {
        self.iconImageView.image = UIImage(named: feature.imageName)
        self.featureNameLabel.text = Language.currentLanguage == .chinese ? feature.name : feature.name_en
    }

}

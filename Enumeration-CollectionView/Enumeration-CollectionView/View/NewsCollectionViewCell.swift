//
//  NewsCollectionViewCell.swift
//  Enumeration-CollectionView
//
//  Created by JeremyXue on 2019/2/18.
//  Copyright © 2019 JeremyXue. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsBackView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newsBackView.layer.cornerRadius = newsBackView.bounds.height / 10
        newsBackView.layer.borderColor = UIColor.white.cgColor
        newsBackView.layer.borderWidth = 1
        newsBackView.clipsToBounds = true
    }

}

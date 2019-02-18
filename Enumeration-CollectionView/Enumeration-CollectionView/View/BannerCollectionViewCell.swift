//
//  BannerCollectionViewCell.swift
//  Enumeration-CollectionView
//
//  Created by JeremyXue on 2019/2/18.
//  Copyright © 2019 JeremyXue. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerCollectionView.register(UINib(nibName: "LogoUCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HomeSection.logo.identifier)
        bannerCollectionView.isPagingEnabled = true
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate) {
        bannerCollectionView.delegate = dataSourceDelegate
        bannerCollectionView.dataSource = dataSourceDelegate
        bannerCollectionView.reloadData()
    }
}

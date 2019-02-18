//
//  ViewController.swift
//  Enumeration-CollectionView
//
//  Created by JeremyXue on 2019/2/18.
//  Copyright © 2019 JeremyXue. All rights reserved.
//

import UIKit

enum HomeSection: Int, CaseIterable {
    case logo = 0, banner, news, features, languages
    var identifier: String {
        switch self {
        case .logo:  return "LogoCell"
        case .banner:  return "BannerCell"
        case .news:  return "NewsCell"
        case .features:  return "FeatureCell"
        case .languages:  return "LanguageCell"
        }
    }
}

class ViewController: UIViewController {
    
    var features = [String]()

    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.dataSource = self
        registerCollectionCell()
    }
    
    func registerCollectionCell() {
        homeCollectionView.register(UINib(nibName: "LogoUCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HomeSection.logo.identifier)
        homeCollectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HomeSection.banner.identifier)
        homeCollectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HomeSection.news.identifier)
        homeCollectionView.register(UINib(nibName: "FeatureCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HomeSection.features.identifier)
        homeCollectionView.register(UINib(nibName: "LanguageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HomeSection.languages.identifier)
    }

}

// MARK: UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let homeSection = HomeSection(rawValue: section) else { return 0 }
        return homeSection == .features ? features.count : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let homeSection = HomeSection(rawValue: indexPath.section) else { return UICollectionViewCell() }
        switch homeSection {
        case .logo:
            let logoCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection.logo.identifier, for: indexPath) as! LogoUCollectionViewCell
            return logoCell
        case .banner:
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection.banner.identifier, for: indexPath) as! BannerCollectionViewCell
            return bannerCell
        case .news:
            let newsCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection.news.identifier, for: indexPath) as! NewsCollectionViewCell
            return newsCell
        case .features:
            let featureCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection.features.identifier, for: indexPath) as! FeatureCollectionViewCell
            return featureCell
        case .languages:
            let languageCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection.languages.identifier, for: indexPath) as! LanguageCollectionViewCell
            return languageCell
        }
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
}

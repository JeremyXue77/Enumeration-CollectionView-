//
//  EnumerationViewController.swift
//  Enumeration-CollectionView
//
//  Created by JeremyXue on 2019/2/18.
//  Copyright © 2019 JeremyXue. All rights reserved.
//

import UIKit

enum Language {
    case chinese
    case english
}

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

class EnumerationViewController: UIViewController {
    
    var features = [Feature]()
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.dataSource = self
        registerCollectionCell()
        getFeatures()
    }
    
    // Created feature items
    func getFeatures() {
        features = [
            Feature(name: "蘋果", name_en: "Apple"),
            Feature(name: "蘋果電視", name_en: "Apple TV"),
            Feature(name: "蘋果手錶", name_en: "Apple Watch"),
            Feature(name: "MacBook", name_en: "Macbook"),
            Feature(name: "Xcode", name_en: "Xcode"),
            Feature(name: "Swift", name_en: "Swift"),
            Feature(name: "iOS", name_en: "iOS"),
            Feature(name: "更多訊息", name_en: "More")
        ]
        homeCollectionView.reloadSections(IndexSet(integer: HomeSection.features.rawValue))
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
extension EnumerationViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let homeSection = HomeSection(rawValue: section) else { return 0 }
        return homeSection == .features ? features.count : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let homeSection = HomeSection(rawValue: indexPath.section) else { return UICollectionViewCell() }
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeSection.identifier, for: indexPath)
        switch homeSection {
        case .logo:
            cell = cell as! LogoUCollectionViewCell
            return cell
        case .banner:
            cell = cell as! BannerCollectionViewCell
            return cell
        case .news:
            cell = cell as! NewsCollectionViewCell
            return cell
        case .features:
            cell = cell as! FeatureCollectionViewCell
            return cell
        case .languages:
            cell = cell as! LanguageCollectionViewCell
            return cell
        }
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension EnumerationViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let homeSection = HomeSection(rawValue: indexPath.section) else { return CGSize.zero }
        let width = collectionView.bounds.width
        switch homeSection {
        case .logo:     return CGSize(width: width, height: 100)
        case .banner:   return CGSize(width: width, height: 150)
        case .news:     return CGSize(width: width, height: 80)
        case .features: return CGSize(width: (width - 30) / 2, height: (width - 30) / 2)
        case .languages:return CGSize(width: width, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


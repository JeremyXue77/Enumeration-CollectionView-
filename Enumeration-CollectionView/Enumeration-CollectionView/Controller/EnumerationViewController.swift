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
    static var currentLanguage = Language.chinese
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
        self.view.backgroundColor = .black
        homeCollectionView.backgroundColor = .black
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeSection.identifier, for: indexPath)
        switch homeSection {
        case .logo:
            break
        case .banner:
            if let bannerCell = cell as? BannerCollectionViewCell {
                
            }
        case .news:
            if let newsCell = cell as? NewsCollectionViewCell {
                newsCell.titleLabel.text = Language.currentLanguage == .chinese ? "最新消息" : "News"
                newsCell.contentLabel.text = Language.currentLanguage == .chinese ? "使用 Enumeration 重構您的程式碼" : "Use Enumeration to refactor your code."
            }
        case .features:
            if let cell = cell as? FeatureCollectionViewCell {
                let feature = features[indexPath.row]
                cell.update(feature: feature)
            }
        case .languages:
            if let languageCell = cell as? LanguageCollectionViewCell {
                
            }
        }
        return cell
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension EnumerationViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let homeSection = HomeSection(rawValue: indexPath.section) else { return CGSize.zero }
        let width = collectionView.bounds.width
        switch homeSection {
        case .logo:      return CGSize(width: width, height: 100)
        case .banner:    return CGSize(width: width, height: 200)
        case .news:      return CGSize(width: width - 40, height: 90)
        case .features:  return CGSize(width: (width - 50) / 2, height: (width - 50) / 2)
        case .languages: return CGSize(width: width, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let homeSection = HomeSection(rawValue: section) else { return UIEdgeInsets.zero }
        switch homeSection {
        case .news:
            return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        case .features:
            return UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
        default:
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


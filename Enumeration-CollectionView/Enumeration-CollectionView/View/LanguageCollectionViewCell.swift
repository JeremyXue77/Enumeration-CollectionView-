//
//  LanguageCollectionViewCell.swift
//  Enumeration-CollectionView
//
//  Created by JeremyXue on 2019/2/18.
//  Copyright © 2019 JeremyXue. All rights reserved.
//

import UIKit

protocol LanguageCellDelegate: class {
    func setLanguage(index: Int)
}

class LanguageCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: LanguageCellDelegate?

    @IBAction func changeLanguage(_ sender: UISegmentedControl) {
        delegate?.setLanguage(index: sender.selectedSegmentIndex)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

//
//  CollectionViewCell.swift
//  OpenBrewery
//
//  Created by IPS-149 on 06/03/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblCol : UILabel!
    
    override var isSelected: Bool {
            didSet {
                if self.isSelected {
                    self.contentView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                } else {
                    self.contentView.backgroundColor = .clear
                }
            }
        }
}

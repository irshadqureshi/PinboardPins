//
//  LoadMoreCell.swift
//  PinboardPins
//
//  Created by Irshad on 17/07/17.
//  Copyright © 2017 MindValley. All rights reserved.
//

import UIKit

class LoadMoreCell: UICollectionViewCell {
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.loadButton.layer.cornerRadius = self.loadButton.bounds.height / 2
    }
    
}

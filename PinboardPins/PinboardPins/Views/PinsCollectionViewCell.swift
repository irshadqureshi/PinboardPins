//
//  PinsCollectionViewCell.swift
//  PinboardPins
//
//  Created by Irshad on 16/07/17.
//  Copyright © 2017 MindValley. All rights reserved.
//

import UIKit
import IQCacheResources

class PinsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var uploadedImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var contentBackgroundView: UIView!
    @IBOutlet weak var likeIconImageView: UIImageView!
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    @IBOutlet weak var timeInfoLabel: UILabel!
    @IBOutlet weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        applyCornerRadiusToImageView(radius: 4, imageView: uploadedImageView)
        applyCornerRadiusToImageView(radius: 4, imageView: profileImageView)
        configureView(radius: 3, backgroundColor: .black, shadowColor: UIColor.white.withAlphaComponent(0.6).cgColor, shadowOffset: CGSize(width: 0 , height:0), opacity: 0.8, view: contentBackgroundView)
    }
    
    
    func setCellContent(_ fetchedData: PinData) {

        let uploadedImageURL      = NSURL(string:fetchedData.uploadedImageUrlString!)
        let profileImageURL         = NSURL(string:fetchedData.profileImageUrlString!)
        
        uploadedImageView.iq_setImageWithUrl(url: uploadedImageURL!, completion: {(error) in })
        profileImageView.iq_setImageWithUrl(url: profileImageURL!, completion: {(error) in })
        creatorLabel.text = fetchedData.userName
        numberOfLikesLabel.text = String(fetchedData.numberOfLikes ?? 0)
        timeInfoLabel.text = serverTime.date(from:fetchedData.timeInfo ?? "")?.timeAgoDisplay()

    }
    
    
    override func prepareForReuse() {
        uploadedImageView.image = nil
        profileImageView.image = nil
    }
    
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
            imageViewHeightLayoutConstraint.constant = attributes.photoHeight
        }
    }

}

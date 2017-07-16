//
//  ProfileViewController.swift
//  PinboardPins
//
//  Created by Irshad on 17/07/17.
//  Copyright © 2017 MindValley. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var uploadImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likedLabel: UILabel!
    @IBOutlet weak var uploadsLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var lastSeenLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    
    var pindata: PinData!


    override func viewDidLoad() {
        super.viewDidLoad()

        populateUI()
        applyCornerRadiusToImageView(radius: self.userImageView.bounds.height / 2, imageView: userImageView)
        configureView(radius: 3, backgroundColor: .white, shadowColor: UIColor.black.withAlphaComponent(0.3).cgColor, shadowOffset: CGSize(width: 0 , height:0), opacity: 0.8, view: bottomView)
        
    }
    
    
    func populateUI() {
        let uploadedImageURL      = NSURL(string:pindata.uploadedImageUrlString!)
        let profileImageURL         = NSURL(string:pindata.profileImageUrlString!)
        
        uploadImageView.iq_setImageWithUrl(url: uploadedImageURL!, completion: {(error) in })
        userImageView.iq_setImageWithUrl(url: profileImageURL!, completion: {(error) in })
        nameLabel.text = pindata.name
        likedLabel.text = String(describing: pindata.numberOfLikes!)
        lastSeenLabel.text = serverTime.date(from:pindata.timeInfo ?? "")?.timeAgoDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logoutTapped(_ sender: Any) {
        self.performSegue(withIdentifier: SegueConstants.unwindToLogin, sender: self)
    }
    
}

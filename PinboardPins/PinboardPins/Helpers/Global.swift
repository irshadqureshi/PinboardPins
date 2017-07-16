//
//  Global.swift
//  PinboardPins
//
//  Created by Irshad on 16/07/17.
//  Copyright © 2017 MindValley. All rights reserved.
//

import UIKit
import SwiftMessages



public func displaySuccessMessage(message: String) {
    
    let success = MessageView.viewFromNib(layout: .CardView)
    success.configureTheme(.success)
    success.configureDropShadow()
    success.configureContent(title: "Success", body: message)
    success.button?.isHidden = true
    
    var successConfig = SwiftMessages.defaultConfig
    successConfig.presentationStyle = .bottom
    successConfig.duration = .seconds(seconds: 3.0)
    successConfig.presentationContext = .window(windowLevel: UIWindowLevelNormal)
    
    SwiftMessages.show(config: successConfig, view: success)
}

public func displayAlertWarning(message: String) {
    
    let warning = MessageView.viewFromNib(layout: .CardView)
    warning.configureTheme(.warning)
    warning.configureDropShadow()
    warning.configureContent(title: "Alert", body: message)
    warning.button?.isHidden = true
    
    var warningConfig = SwiftMessages.defaultConfig
    warningConfig.presentationStyle = .top
    warningConfig.duration = .seconds(seconds: 3.0)
    warningConfig.presentationContext = .window(windowLevel: UIWindowLevelAlert)
    
    SwiftMessages.show(config: warningConfig, view: warning)
}

public func displayErrorMessage(_ message: String) {
    
    let status = MessageView.viewFromNib(layout: .StatusLine)
    status.backgroundView.backgroundColor = UIColor.black
    status.bodyLabel?.textColor = UIColor.white
    status.configureContent(body: message)
    var statusConfig = SwiftMessages.defaultConfig
    statusConfig.duration = .seconds(seconds: 05.0)
    statusConfig.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
    
    SwiftMessages.show(config: statusConfig, view: status)
}


func configureView(radius: CGFloat, backgroundColor: UIColor, shadowColor: CGColor, shadowOffset: CGSize, opacity: Float, view: UIView) {
    
    view.backgroundColor = backgroundColor
    view.layer.cornerRadius = radius
    view.layer.masksToBounds = false
    view.layer.shadowColor = shadowColor
    view.layer.shadowOffset = shadowOffset
    view.layer.shadowOpacity = opacity
}

func applyCornerRadiusToImageView(radius: CGFloat, imageView: UIImageView) {
    imageView.layer.cornerRadius = radius
    imageView.layer.masksToBounds = true
}

let serverTime : DateFormatter = {
    let dateFormater = DateFormatter()
    dateFormater.locale = Locale(identifier: "en_US_POSIX")
    dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    dateFormater.timeZone = TimeZone(secondsFromGMT: 0)
    return dateFormater
}()


// Can Add More Globals Here

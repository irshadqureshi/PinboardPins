//
//  Constants.swift
//  PinboardPins
//
//  Created by Irshad on 16/07/17.
//  Copyright © 2017 MindValley. All rights reserved.
//

import UIKit
import SwiftyJSON
import IQCacheResources

class Constants: NSObject {
    
    struct WebService{
        
        static let PinboardBaseURL              =  "http://pastebin.com/"
        static let PinsListURL                  =  PinboardBaseURL + "raw/wgkJgazE"
    }
    
    
    struct Caches {
        static let imageCache                   = CacheManager(cacheCountLimit: 500, cacheSizeLimit: 500)
    }


    struct CompletionHandler{
        
        typealias PinDataCallback               = (_ result: [PinData], _ errorFlag:Bool) -> Void
        typealias apiResponse                   = (_ result: JSON) -> Void

    }

    
}

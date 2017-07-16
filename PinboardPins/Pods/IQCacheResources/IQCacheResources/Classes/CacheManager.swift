//
//  Cache.swift
//  Pods
//
//  Created by Irshad on 15/07/17.
//
//

import Foundation
import UIKit

public class CacheManager {
    
    static public let sharedCache = CacheManager() 
    
    let imageCache = NSCache<AnyObject, DiscradableImage>()
    let dataCache = NSCache<AnyObject, DiscardableData>()
    let jsonCache = NSCache<AnyObject, DiscardableJSON>()
    
    
    public init(cacheCountLimit: Int, cacheSizeLimit: Int) {
        
        imageCache.countLimit = cacheCountLimit
        dataCache.countLimit = cacheCountLimit
        jsonCache.countLimit = cacheCountLimit
        
        imageCache.totalCostLimit = cacheSizeLimit
        dataCache.totalCostLimit = cacheSizeLimit
        jsonCache.totalCostLimit = cacheSizeLimit
        
    }
    
    convenience init(){
        
        self.init(cacheCountLimit: 500,cacheSizeLimit: 500)
    }
    
    
    public func archiveImage(image: UIImage?, url: String) {
        
        if image == nil {
            
            imageCache.removeObject(forKey: url as NSString)
            return
        }
        
        let data = DiscradableImage(image: image!)
        imageCache.setObject(data, forKey: url as NSString)
    }
    
    
    public func archiveAnyData(any: AnyObject?, url: String) {
        
        if any == nil {
            
            dataCache.removeObject(forKey: url as NSString)
            return
        }
        
        let data = DiscardableData(data: any! as! Data)
        dataCache.setObject(data, forKey: url as NSString)
    
    }
    
    
    public func unarchiveData(url: String?) -> Data? {
        
        if url == nil || url! == "" {
            return nil
        }
        
        if let cachedData = dataCache.object(forKey: url! as NSString) {
            return cachedData.data
        }
        
        return nil
    }
    
    
    
    public func unarchiveJSON(url: String?) -> [String: AnyObject]? {
        
        if url == nil || url! == "" {
            return nil
        }
        
        if let cachedJSON = jsonCache.object(forKey: url! as NSString) {
            return cachedJSON.json
        }
        
        return nil
    }
    

    public func unarchiveImage(url: String?) -> UIImage? {
        
        if url == nil || url! == "" {
            return nil
        }
        
        if let cachedImage = imageCache.object(forKey: url! as NSString) {
            return cachedImage.image
        }
        
        return nil
    }
    
    
    public func clearCache() {
        
        imageCache.removeAllObjects()
        dataCache.removeAllObjects()
        jsonCache.removeAllObjects()
    }
    
}

//
//  DataManager.swift
//  iBar
//
//  Created by Alexandre Plaitant on 16/04/2015.
//  Copyright (c) 2015 Alexandre Plaitant. All rights reserved.
//

import Foundation

class DataManager {
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"com.raywenderlich", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
    
    class func getCocktail(success: ((CocktailData: NSData!) -> Void)) {
        //1
        loadDataFromURL(NSURL(string: "http://192.168.1.11/api.php")!, completion:{(data, error) -> Void in
            //2
            if let urlData = data {
                //3
                success(CocktailData: urlData)
                println("Data: \(urlData)")
            }
        })
    }

}
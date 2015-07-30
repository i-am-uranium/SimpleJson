//
//  ViewModel.swift
//  SimpleJSON
//
//  Created by Ravi Ranjan on 29/07/15.
//  Copyright © 2015 Ravi Ranjan. All rights reserved.
//

import Foundation

class ViewMOdel {
    var titles = [String]()
    let urlString = "http://itunes.apple.com/us/rss/topmovies/limit=25/json"
    func fetchItems (success:() -> ()){
    let url = NSURL(string: urlString)
       
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithURL(url!) {(data, response, error) in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSArray
                self.titles = json.valueForKeyPath("feed.entry.im:name.label") as! [String]
                
                 success()
            }catch{
                print(error)
            }
        }
        task?.resume()
    }
    
    func numberOfSections() -> Int {
    return 1
        
    }
    func numberOfItems(section:Int) ->Int{
    return titles.count
    }
    
    func titleForItemAtIndexPath(indexPath:NSIndexPath) ->String{
    return titles[indexPath.row]
    }
    
}

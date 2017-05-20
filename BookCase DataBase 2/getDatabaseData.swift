//
//  getDatabaseData.swift
//  BookCase DataBase 2
//
//  Created by Cat Mason-Payne on 19/05/2017.
//  Copyright © 2017 Deakin. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class GetDatabaseData {
    
    public func importDatabase () -> [[String]] {
        
        var DBArr = [[String]]()
        
        // retrieving core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request =  NSFetchRequest<NSFetchRequestResult>(entityName: "Books")
        
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    //put into array
                    var tempArr = [String]()
                    if let title = result.value(forKey: "title") as? String
                    {
                        tempArr.append(title)
                    }
                    if let author = result.value(forKey: "author") as? String
                    {
                        tempArr.append(author)
                    }
                    if let genre = result.value(forKey: "genre") as? String
                    {
                        tempArr.append(genre)
                    }
                    if let image = result.value(forKey: "image") as? String
                    {
                        tempArr.append(image)
                    }
                    if let isbn = result.value(forKey: "isbn") as? String
                    {
                        tempArr.append(isbn)
                    }
                    if let movie = result.value(forKey: "movie") as? String
                    {
                        tempArr.append(movie)
                    }
                    if let publisher = result.value(forKey: "publisher") as? String
                    {
                        tempArr.append(publisher)
                    }
                    if let rating = result.value(forKey: "rating") as? String
                    {
                        tempArr.append(rating)
                    }
                    if let series = result.value(forKey: "series") as? String
                    {
                        tempArr.append(series)
                    }
                    if let summary = result.value(forKey: "summary") as? String
                    {
                        tempArr.append(summary)
                    }
                    DBArr.append(tempArr)
                }
                
            }
        }
        catch
        {
            // process error
        }
        
        return DBArr
    }
}

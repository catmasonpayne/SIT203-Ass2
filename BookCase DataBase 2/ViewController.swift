//
//  ViewController.swift
//  BookCase DataBase 2
//
//  Created by Cat Mason-Payne on 15/05/2017.
//  Copyright © 2017 Deakin. All rights reserved.
//

import UIKit
import CoreData

class CellDefinition: UITableViewCell {
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
}



class ViewController: UITableViewController {

//    let searchController = UISearchController(searchResultsController: nil)
    

    var DBArr = [[String]]()
    var romanceArr = [[String]]()
    var historyArr = [[String]]()
    var fantasyArr = [[String]]()
    var filteredBooks = [[String]]()
    var searchIsActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataimport = GetDatabaseData()
        
        DBArr = dataimport.importDatabase()
        
        
//        // retrieving core data
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        
//        let context = appDelegate.persistentContainer.viewContext
//        
//        let request =  NSFetchRequest<NSFetchRequestResult>(entityName: "Books")
//        
//        request.returnsObjectsAsFaults = false
//        
//        do
//        {
//            let results = try context.fetch(request)
//            if results.count > 0
//            {
//                for result in results as! [NSManagedObject]
//                {
//                    //put into array
//                    var tempArr = [String]()
//                    if let title = result.value(forKey: "title") as? String
//                    {
//                        tempArr.append(title)
//                    }
//                    if let author = result.value(forKey: "author") as? String
//                    {
//                        tempArr.append(author)
//                    }
//                    if let genre = result.value(forKey: "genre") as? String
//                    {
//                        tempArr.append(genre)
//                    }
//                    if let image = result.value(forKey: "image") as? String
//                    {
//                        tempArr.append(image)
//                    }
//                    if let isbn = result.value(forKey: "isbn") as? String
//                    {
//                        tempArr.append(isbn)
//                    }
//                    if let movie = result.value(forKey: "movie") as? String
//                    {
//                        tempArr.append(movie)
//                    }
//                    if let publisher = result.value(forKey: "publisher") as? String
//                    {
//                        tempArr.append(publisher)
//                    }
//                    if let rating = result.value(forKey: "rating") as? String
//                    {
//                        tempArr.append(rating)
//                    }
//                    if let series = result.value(forKey: "series") as? String
//                    {
//                        tempArr.append(series)
//                    }
//                    if let summary = result.value(forKey: "summary") as? String
//                    {
//                        tempArr.append(summary)
//                    }
//                    DBArr.append(tempArr)
//                }
//                
//            }
//        }
//        catch
//        {
//            // process error
//        }
        // category arrays
        print(DBArr.count)
        let counter = DBArr.count - 1
        for index in 0...counter {
            let tempString = DBArr[index][2]
            if tempString.lowercased().range(of: "romance") != nil
            {
                if romanceArr.count < 3 {
                    var tempArr = [String]()
                    for tempIndex in 0...9 {
                        tempArr.append(DBArr[index][tempIndex])
                    }
                    romanceArr.append(tempArr)
                }
            }
            if tempString.lowercased().range(of: "fiction") != nil
            {
                if historyArr.count < 3 {
                    var tempArr = [String]()
                    for tempIndex in 0...9 {
                        tempArr.append(DBArr[index][tempIndex])
                    }
                    historyArr.append(tempArr)
                }
            }
            if tempString.lowercased().range(of: "fantasy") != nil
            {
                if fantasyArr.count < 3 {
                    var tempArr = [String]()
                    for tempIndex in 0...9 {
                        tempArr.append(DBArr[index][tempIndex])
                    }
                    fantasyArr.append(tempArr)
                }
            }
            
        }
        print("romance count: \(romanceArr.count)")
        print("fiction count: \(historyArr.count)")
        print("fantasy count: \(fantasyArr.count)")
    }
    

    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return "Romance"
        case 1:
            return "Historical / Other Fiction"
        case 2:
            return "Fantasy"
        default:
            return "other"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellDefinition
        
        
        switch (indexPath.section) {
        case 0:
            let title = romanceArr[indexPath.row][0]
            let author = romanceArr[indexPath.row][1]
            let imageName = romanceArr[indexPath.row][3]
            cell.titleLabel?.text = title
            cell.authorLabel?.text = author
            cell.imageView?.image = UIImage(named: imageName)
            cell.imageView?.contentMode = .scaleAspectFit
        case 1:
            let title = historyArr[indexPath.row][0]
            let author = historyArr[indexPath.row][1]
            let imageName = historyArr[indexPath.row][3]
            cell.titleLabel?.text = title
            cell.authorLabel?.text = author
            cell.imageView?.image = UIImage(named: imageName)
            cell.imageView?.contentMode = .scaleAspectFit
        case 2:
            let title = fantasyArr[indexPath.row][0]
            let author = fantasyArr[indexPath.row][1]
            let imageName = fantasyArr[indexPath.row][3]
            cell.titleLabel?.text = title
            cell.authorLabel?.text = author
            cell.imageView?.image = UIImage(named: imageName)
            cell.imageView?.contentMode = .scaleAspectFit
        //return sectionHeaderView
        default:
            cell.textLabel?.text = "Other"
        }
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSearchPage" {
//            let searchVC = segue.destination as? SearchTableViewController
//            
        }
    }
    
    @IBAction func searchButton(_ sender: Any) {
        // code to segue to search page!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


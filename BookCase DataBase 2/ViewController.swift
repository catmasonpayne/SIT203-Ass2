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

    
    // create an array of arrays to store database information in
    var DBArr = [[String]]()
    // these are category arrays
    var romanceArr = [[String]]()
    var historyArr = [[String]]()
    var fantasyArr = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create GetDatabasedData object
        let dataimport = GetDatabaseData()
        // use object to create array of arrays, send back to ViewController
        DBArr = dataimport.importDatabase()
        
        // fill category arrays
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
        // console making sure there's only 3 in each
        print("romance count: \(romanceArr.count)")
        print("fiction count: \(historyArr.count)")
        print("fantasy count: \(fantasyArr.count)")
    }
    

    // this is the same as the storyboard
    let reuseIdentifier = "cell"
    
    // how many rows in the section, i capped at 3 so
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
        
    }
    // number of genre categories created
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // a switch statement provides an easy way to determine what the heading should be
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a sample cell, using the cell definition class
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellDefinition
        
        // again using switch as it is an easy way to determine what goes where.
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
    
    // this is more jsut checking for errors
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected")
        print("section \(indexPath.section) selected")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // preparing to segue!
        if segue.identifier == "ShowBook" {
            let displayBookVC = segue.destination as? DisplayBookViewController
            // Determining what data to send to the DisplayBookViewController
            guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
                return
            }
            switch (indexPath.section) {
            case 0:
                displayBookVC?.bookNameFromPrev = romanceArr[indexPath.row][0]
                displayBookVC?.bookAuthorFromPrev = romanceArr[indexPath.row][1]
            case 1:
                displayBookVC?.bookNameFromPrev = historyArr[indexPath.row][0]
                displayBookVC?.bookAuthorFromPrev = historyArr[indexPath.row][1]
                
            case 2:
                displayBookVC?.bookNameFromPrev = fantasyArr[indexPath.row][0]
                displayBookVC?.bookAuthorFromPrev = fantasyArr[indexPath.row][1]
                
            default:
                cell.textLabel?.text = "Other"
            }
        }
    }
    
    @IBAction func searchButton(_ sender: Any) {
        // code to segue to search page!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // tidying up
    // I prefer without the status bar.
    override var prefersStatusBarHidden: Bool {
        return true
    }
    // this stops the application from rotating
    override var shouldAutorotate: Bool {
        return false
    }
    // this makes sure that it starts in portrait mode
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let value =  UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        UIViewController.attemptRotationToDeviceOrientation()
    }
}


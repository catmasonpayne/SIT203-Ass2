//
//  SearchTableViewController.swift
//  BookCase DataBase 2
//
//  Created by Cat Mason-Payne on 19/05/2017.
//  Copyright © 2017 Deakin. All rights reserved.
//

import UIKit
import CoreData

class SearchTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {

    @IBOutlet weak var headerView: UIView!
    
    
    @IBOutlet var tableView: UITableView!
    // an array of database objects
    var DBArr = [[String]]()
    // an array of filtered objects for when the search begins
    var filteredBooks = [[String]]()
    
    // create a search controller
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // create database object
        let dataimport = GetDatabaseData()
        // fill array with information
        DBArr = dataimport.importDatabase()
        // make the filtered array equal the original
        filteredBooks = DBArr
        
        // more creating the search controller and search bar...
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    
    // number of rows in section = however many books are in the search result
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       let counter = filteredBooks.count
        return counter
    }

   
    // populate cells with information
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)

        cell.textLabel?.text = filteredBooks[indexPath.row][0]
        cell.detailTextLabel?.text = filteredBooks[indexPath.row][1]
        cell.imageView?.image = UIImage(named: filteredBooks[indexPath.row][3])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected")
    }
    
    // this function is called every time the search bar changes by one character!
    func updateSearchResults(for searchController: UISearchController) {
        // if the search bar is empty, show everything.
        if searchController.searchBar.text! == "" {
            filteredBooks = DBArr
        } else {
            // otherwise, show only those that contain what is written in the search bar!
            filteredBooks = DBArr.filter { $0[0].lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBook" {
            let displayBookVC = segue.destination as? DisplayBookViewController
            // Determining what data to send to the DisplayBookViewController
            guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
                return
            }
            
            displayBookVC?.bookNameFromPrev = filteredBooks[indexPath.row][0]
            displayBookVC?.bookAuthorFromPrev = filteredBooks[indexPath.row][1]
        }
    }
    
    
    // tidying up
    override var prefersStatusBarHidden: Bool {
        return true;
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
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

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
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet var tableView: UITableView!
    
    var DBArr = [[String]]()
    var filteredBooks = [[String]]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let dataimport = GetDatabaseData()
        
        DBArr = dataimport.importDatabase()
        
        filteredBooks = DBArr
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        // tableView.tableHeaderView = searchController.searchBar
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       let counter = filteredBooks.count
        return counter
    }

   
    
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
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchBar.text! == "" {
            filteredBooks = DBArr
        } else {
            filteredBooks = DBArr.filter { $0[0].lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        self.tableView.reloadData()
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

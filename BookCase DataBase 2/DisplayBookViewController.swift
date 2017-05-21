//
//  DisplayBookViewController.swift
//  BookCase DataBase 2
//
//  Created by Cat Mason-Payne on 20/05/2017.
//  Copyright © 2017 Deakin. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabelCell: UILabel!
    @IBOutlet weak var authorLabelCell: UILabel!
    
}

class DisplayBookViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    // create an array for database information
    var DBArr = [[String]]()
    // another array for those of similar genre
    var similarBooks = [[String]]()
    
    // variables
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var summaryScrollView: UIScrollView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
   
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var seriesLine: UILabel!
    @IBOutlet weak var movieLine: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // these are information passed through the segue
    var bookNameFromPrev = String()
    var bookAuthorFromPrev = String()
    var genreString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataimport = GetDatabaseData()
        
        DBArr = dataimport.importDatabase()
        
        for i in 0...(DBArr.count - 1) {
            if bookNameFromPrev == DBArr[i][0] && bookAuthorFromPrev == DBArr[i][1] {
                // set up data to UI
                bookName.text = bookNameFromPrev
                authorName.text = bookAuthorFromPrev
                bookImage.image = UIImage(named: DBArr[i][3])
                summaryLabel.text = DBArr[i][9]
                genreLabel.text = DBArr[i][2]
                genreString = DBArr[i][2]
                ratingLabel.text = "Rating: \(DBArr[i][7])"
                isbnLabel.text = "ISBN: \(DBArr[i][4])"
                publisherLabel.text = "Publisher: \(DBArr[i][6])"
                if DBArr[i][8].lowercased() == "n/a" {
                    seriesLabel.isHidden = true
                    seriesLine.isHidden = true
                } else {
                    seriesLabel.text = "\(DBArr[i][8]) in series"
                }
                if DBArr[i][5].lowercased() == "n/a" {
                    movieLabel.isHidden = true
                    movieLine.isHidden = true
                } else {
                    movieLabel.text = "Movie Release: \(DBArr[i][5])"
                }
                
            }
            
        }
        createSimilarBookArray()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // set up similar books array in prep for collection view
    func createSimilarBookArray() {
        for i in 0...(DBArr.count - 1) {
            if DBArr[i][2].lowercased().range(of: genreString.lowercased()) != nil || genreString.lowercased().range(of: DBArr[i][2].lowercased()) != nil {
                // if a genre type matches
                var tempArr = [String]()
                for index in 0...9 {
                    tempArr.append(DBArr[i][index])
                }
                similarBooks.append(tempArr)
            }
        }
        
    }
    
    // collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimilarCell", for: indexPath as IndexPath) as! BookCollectionViewCell
        
        cell.bookImageView.image = UIImage(named: similarBooks[indexPath.item][3])
        cell.titleLabelCell.text = similarBooks[indexPath.item][0]
        cell.authorLabelCell.text = similarBooks[indexPath.item][1]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AnotherBookLeft" {
            let viewBookVC = segue.destination as? ViewBookViewController
            
            guard let cell = sender as? UICollectionViewCell, let indexPath = collectionView.indexPath(for: cell) else {
                return
            }
            viewBookVC?.bookNameFromPrev = similarBooks[indexPath.item][0]
            viewBookVC?.bookAuthorFromPrev = similarBooks[indexPath.item][1]
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

//
//  EmotionViewController.swift
//  BeyondBirth
//
//  Created by Jordan George on 11/24/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import UIKit
import Firebase

class EmotionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // variables
    var emotionText = String()
    let cellId = "cellId" // reuse cell id
    let database = Database.database().reference().child("emotionImages") // database for retrieving names of emotion images
    let storage = Storage.storage() // firebase storage variable
    var picArray = [UIImage]() // array for storing emotion images from firebase as UIImages
    var picArrayNames = [String]() // array for storing names of emotion images manually
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // downloadImagesFromFirebase()
        manuallyGetImagesFromAssets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add title to view based on emotion selected in EmotionsMainViewController
        navigationItem.title = emotionText.capitalized
        
        // collection view configuration
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(EmotionPhotoCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    // add data to cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EmotionPhotoCell
        
        let row = indexPath.row
        let name = picArrayNames[row]
        let pic = UIImage(named: name)
        cell.imageView.image = pic
        
        return cell
    }
    
    // set amount of cells shown
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picArrayNames.count
    }
    
    // set size for cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width)
    }
    
    // couldn't figure out how to make asynchronous
    // downloads images from firebase
    func downloadImagesFromFirebase() {
        var folderChild = ""
        
        switch emotionText {
        case "sad":
            folderChild = "sad" // display sad images
        case "happy":
            folderChild = "happy"  // display happy images
        default:
            folderChild = ""
        }
        
        // access database of specific emotion
        database.child(folderChild).observe(.childAdded, with: { (snapshot) in
            // get url of image
            let downloadURL = snapshot.value as! String
            // use url to retrieve image from storage
            let storageRef = self.storage.reference(forURL: downloadURL)
            // turn pic into type Data
            storageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                // turn pic of type Data into UIImage
                let pic = UIImage(data: data!)
                // add to picArray
                self.picArray.append(pic!)
            }
        })
    }
    
    
    // manually gets emotion images from assets
    func manuallyGetImagesFromAssets() {
        switch emotionText {
        case "sad":
            picArrayNames = [
                "IMG_0062",
                "IMG_0077",
                "IMG_0090"
            ]
        case "happy":
            picArrayNames = [
                "IMG_0285",
                "IMG_0349",
                "IMG_0355",
                "IMG_0370"
            ]
        default:
            picArrayNames = [
                "IMG_0062",
                "IMG_0077",
                "IMG_0090",
                "IMG_0285",
                "IMG_0349",
                "IMG_0355",
                "IMG_0370"
            ]
        }
    }
    
}

// cell configuration
class EmotionPhotoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    // creates image view for emotion images
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // sets up the views within the cell
    func setUpViews(){
        // add subview
        addSubview(imageView)
        
        // constraints
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

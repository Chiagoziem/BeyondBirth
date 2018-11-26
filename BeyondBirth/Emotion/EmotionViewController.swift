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
    
    var emotion = String()
    let cellId = "cellId"
    let database = Database.database().reference().child("emotionImages")
    let storage = Storage.storage()
    var picArray = [UIImage]()
    var picArrayNames = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        downloadImagesFromFirebase()
        manuallyGetImagesFromAssets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(EmotionPhotoCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EmotionPhotoCell
        
        let row = indexPath.row
        let name = picArrayNames[row]
        let pic = UIImage(named: name)
        cell.imageView.image = pic
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picArrayNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width)
    }
    
    // couldn't figure out how to make asynchronous
    func downloadImagesFromFirebase() {
        var folderChild = ""
        
        switch emotion {
        case "sad":
            folderChild = "sad" // display sad images
        case "happy":
            folderChild = "happy"  // display happy images
        default:
            folderChild = ""
        }

        database.child(folderChild).observe(.childAdded, with: { (snapshot) in
            let downloadURL = snapshot.value as! String
            let storageRef = self.storage.reference(forURL: downloadURL)
            storageRef.getData(maxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                let pic = UIImage(data: data!)
                self.picArray.append(pic!)
            }
        })
    }
    
    func manuallyGetImagesFromAssets() {
        switch emotion {
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

class EmotionPhotoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func setUpViews(){
        addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

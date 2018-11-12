// Rachael Metzger
// Beyond Birth Senior Design
//  ViewController.swift
//  Breathing Exercises
// -----------------------------------------------------
// The code below uses the UICollectionViewController
// which, right now, allows multiple views to show text
// and scroll through the options of breathing exercises.
// This is the starting layout for this app to turn into
// a view more like facebook or twitter, where we would
// like to include images and video links that correspond
// to the exercise 65
// ------------------------------------------------------
// Code Comment Word Count: 124

import UIKit

class BreathingExercisesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let customCellIndetifier = "someString"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: customCellIndetifier)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIndetifier, for: indexPath) as! CustomCell
        customCell.labelA.text = text[indexPath.item]
        return customCell
    }

    // to add more Breathing Exercises, just add string to list below
    // would like to find a way to set individual sizes for each CustomCell
    // also this setup allows for coder to add in images and videos as well
    // plan to add this feature in the future 112
    let text = ["Belly Breathing\n\nBelly breathing is easy to do and very relaxing. Try this basic exercise anytime you need to relax or relieve stress.\n\n1. Sit or lie flat in a comfortable position.\n\n2. Put one hand on your belly just below your ribs and the other hand on your chest.\n\n3. Take a deep breath in through your nose, and let your belly push your hand out. Your chest should not move.\n\n4. Breathe out through pursed lips as if you were whistling. Feel the hand on your belly go in, and use it to push all the air out.\n\n5. Do this breathing 3 to 10 times. Take your time with each breath.", "4-7-8 breathing\n\nThis exercise also uses belly breathing to help you relax. You can do this exercise either sitting or lying down.\n\n1. To start, put one hand on your belly and the other on your chest as in the belly breathing exercise.\n\n2. Take a deep, slow breath from your belly, and silently count to 4 as you breathe in.\n\n3. Hold your breath, and silently count from 1 to 7.\n\n4. Breathe out completely as you silently count from 1 to 8. Try to get all the air out of your lungs by the time you count to 8.\n\n5. Repeat 3 to 7 times or until you feel calm.", "Roll breathing\n\nRoll breathing helps you to develop full use of your lungs and to focus on the rhythm of your breathing. You can do it in any position. But while you are learning, it is best to lie on your back with your knees bent.\n\n1. Put your left hand on your belly and your right hand on your chest. Notice how your hands move as you breathe in and out.\n\n2. Practice filling your lower lungs by breathing so that your belly (left) hand goes up when you inhale and your chest (right) hand remains still. Always breathe in through your nose and breathe out through your mouth. Do this 8 to 10 times.\n\n3. When you have filled and emptied your lower lungs 8 to 10 times, add the second step to your breathing: inhale first into your lower lungs as before, and then continue inhaling into your upper chest. Breathe slowly and regularly. As you do so, your right hand will rise and your left hand will fall a little as your belly falls.\n\n4. As you exhale slowly through your mouth, make a quiet, whooshing sound as first your left hand and then your right hand fall. As you exhale, feel the tension leaving your body as you become more and more relaxed.\n\n5. Practice breathing in and out in this way for 3 to 5 minutes. Notice that the movement of your belly and chest rises and falls like the motion of rolling waves.","Morning breathing\n\nTry this exercise when you first get up in the morning to relieve muscle stiffness and clear clogged breathing passages. Then use it throughout the day to relieve back tension.\n\n1. From a standing position, bend forward from the waist with your knees slightly bent, letting your arms dangle close to the floor.\n\n2. As you inhale slowly and deeply, return to a standing position by rolling up slowing, lifting your head last.\n\n3. Hold your breath for just a few seconds in this standing position.\n\n4. Exhale slowly as you return to the original position, bending forward from the waist."]

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return text.count
    }

    // set cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 700)
    }

}

class CustomCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    // label
    let labelA: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        //label.text = "My Custom CollectionView"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setupView() {
        backgroundColor = UIColor.lightGray
        addSubview(labelA)
        // Horizontal Constraint
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": labelA]))
        // Vertical Constraint
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": labelA]))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

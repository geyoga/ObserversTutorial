//
//  ViewController.swift
//  ObserversTutorial
//
//  Created by Georgius Yoga Dewantama on 24/07/19.
//  Copyright © 2019 Georgius Yoga Dewantama. All rights reserved.
//

import UIKit

let blueNotificationKey = "blue"
let redNotificationKey = "red"

class ViewController: UIViewController {
    
    @IBOutlet weak var imageHome: UIImageView!
    let blue = Notification.Name(rawValue: blueNotificationKey)
    let red = Notification.Name(rawValue: redNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createObservers()
    }

    func createObservers () {
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.changeImage(notification:)), name: blue , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.changeImage(notification:)), name: red, object: nil)
        
    }
    
    @objc func changeImage (notification : NSNotification){
        
        let isBlue = notification.name == blue
        let image = isBlue ? UIImage(named: "Lesson2") : UIImage(named: "Lesson3")
        imageHome.image = image
        
    }

}


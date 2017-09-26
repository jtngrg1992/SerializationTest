//
//  ViewController.swift
//  SerializationTest
//
//  Created by Jatin Garg on 26/09/17.
//  Copyright © 2017 Jatin Garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let owner1 = Owner(name: "jatin")
        let owner2 = Owner(name: nil)
        let car = Car(manufacturer: "Tesla", model: .honda, mileage: 1234.56, owners: [owner1,owner2])
        car.printLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


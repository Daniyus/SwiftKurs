//
//  ViewController.swift
//  HelloSwift
//
//  Created by student on 03.12.15.
//  Copyright © 2015 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var lblHello: UILabel!
    
    
    @IBAction func helloAction(sender: UIButton) {
        
        print("Hallo")
        
        lblHello.text = "Hallo"
    }
    
    
    @IBAction func swiftAction(sender: UIButton) {
        print("Swift")
        
        lblHello.text = "Swift"
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


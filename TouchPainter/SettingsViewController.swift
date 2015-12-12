//
//  SettingsViewController.swift
//  TouchPainter
//
//  Created by student on 11.12.15.
//  Copyright © 2015 Danial. All rights reserved.
//

import UIKit

struct Settings {
    var brush:CGFloat
    var opacity:CGFloat
}

protocol SettingsViewControllerDelegate: class {
    //version 1
    //func SettingsViewControllerFinished(brush:CGFloat, opacity:CGFloat)
    //alternate:
    //besser weil man hier im stuct alles ändern kann
    func settingsViewControllerFinished(settings: Settings)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var sliderBrush: UISlider!
    @IBOutlet weak var sliderOpacity: UISlider!
    @IBOutlet weak var lblBrush: UILabel!
    @IBOutlet weak var lblOpacity: UILabel!
    
    weak var delegate: SettingsViewControllerDelegate?
    
    var brush: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblBrush.text = String(format: "%.2f", brush)
        lblOpacity.text = String(format: "%.2f", opacity)
        sliderBrush.value = Float(brush)
        sliderOpacity.value = Float(opacity)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeAction(sender: UIBarButtonItem) {
        let s = Settings(brush: brush, opacity: opacity)
        delegate?.settingsViewControllerFinished(s)
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func sliderBrushChanged(sender: UISlider) {
        brush = CGFloat(sender.value)
        lblBrush.text = String(format: "%.2f", brush)
    }
    
    @IBAction func sliderOpacityChanged(sender: UISlider) {
        opacity = CGFloat(sender.value)
        lblOpacity.text = String(format: "%.2f", opacity)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

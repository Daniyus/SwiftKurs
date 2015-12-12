//
//  ViewController.swift
//  TouchPainter
//
//  Created by student on 10.12.15.
//  Copyright © 2015 Danial. All rights reserved.
//

import UIKit

class PaintingViewController: UIViewController {
    var start:CGPoint?
    var currentColor:UIColor = UIColor.redColor()
    var opacity:CGFloat = 1.0
    var brush:CGFloat = 10.0
    @IBOutlet weak var imageViewSquare: UIImageView!
    
    @IBAction func buttonClear(sender: UIButton) {
        imageViewSquare.image = nil
    }
    
    @IBAction func buttonRed(sender: UIButton) {
        currentColor = UIColor.redColor()
    }
    
    @IBAction func buttonGreen(sender: UIButton) {
        currentColor = UIColor.greenColor()
    }
    
    @IBAction func buttonBlue(sender: UIButton) {
        currentColor = UIColor.blueColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //drawFromPoint
    func drawFromPoint(canvas:UIImageView, start: CGPoint, toPoint end: CGPoint , withColor:UIColor, lineWidth:CGFloat, alpha:CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(canvas.frame.size)
        let context = UIGraphicsGetCurrentContext()
        canvas.image?.drawInRect(CGRect(x: 0, y: 0,
            width: canvas.frame.size.width, height: canvas.frame.size.height))
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetAlpha(context, alpha);
        CGContextSetStrokeColorWithColor(context, withColor.CGColor)
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, start.x, start.y)
        CGContextAddLineToPoint(context, end.x, end.y)
        CGContextStrokePath(context)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first! as UITouch
        start = touch.locationInView(view)
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first! as UITouch
        let end = touch.locationInView(view)
        if let start = start {
            imageViewSquare.image = drawFromPoint(imageViewSquare, start: start, toPoint: end, withColor: currentColor, lineWidth: brush, alpha: opacity)
        }
        start = end
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let settings = segue.destinationViewController as! SettingsViewController
        settings.delegate = self
        settings.opacity = opacity
        settings.brush = brush
    }
}

//PaintingViewController_SettingsViewControllerDelegate
extension PaintingViewController: SettingsViewControllerDelegate {
    func settingsViewControllerFinished(settings: Settings) {
        opacity = settings.opacity
        brush = settings.brush
    }
}
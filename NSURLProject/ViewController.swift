//
//  ViewController.swift
//  NSURLProject
//
//  Created by student on 11.12.15.
//  Copyright © 2015 Danial. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let weatherSwiftUrl = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=Wuerzburg&appid=2de143494c0b295cca9337e1e96b00e0")
        //NSURL Stuff
        let request = NSURLRequest(URL: weatherSwiftUrl!)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        session.dataTaskWithRequest(request, completionHandler:{(data, response, error) in
            guard let data = data else {
                return
            }
            var jsonResult:NSDictionary!
            
            do{
                jsonResult = try(NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)as?NSDictionary)!
            } catch {
                print(error)
            }
            guard let jsonResultUnwrapped = jsonResult else {
                return
            }
            print(jsonResultUnwrapped)
            //func parseJSON(JsonResult)
            
            
        }).resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


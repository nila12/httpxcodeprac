
//
//  ViewController.swift
//  RawBrowser
//
//  Created by iGuest on 5/2/17.
//  Copyright © 2017 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var responseField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func browseIt(_ sender: UIButton) {
        let url = URL(string: addressField.text!)
        
        NSLog("We will surf to \(url?.host) to \(url?.path) on port \(url?.port ?? 80)") //default port 80
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        //let request = try! URLRequest(url: url!)
        
        
        NSLog("Data task starting")
        let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, err: Error?) in
            NSLog("We got response: \(response!), error: \(err)")
            
            self.responseField.text = data.debugDescription
        }
        
        task.resume() //need this apparently
        
    }
}


//
//  ResultViewController.swift
//  Bookmark
//
//  Created by Lilico Isomata on 2016/09/24.
//  Copyright © 2016年 Lilico Isomata. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UIWebViewDelegate {
    
    var url :String!
    
    @IBOutlet weak var webview: UIWebView!
    
    var initialUrl: NSURL!

    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // initialUrl = NSURL(string:url)
        if let webview = self.webview{
            NSLog(url)
            let urldata = NSURL(string: url!)
            NSLog(String(urldata))
            let urlReq = NSURLRequest(URL: urldata!)
            
            webview.loadRequest(urlReq)
        }
//        self.webview.delegate = self
//        
//        let request = NSURLRequest(URL: initialUrl!)
//        self.webview.loadRequest(request)

        // Do any additional setup after loading the view.
        
       NSLog("%@が入力",url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

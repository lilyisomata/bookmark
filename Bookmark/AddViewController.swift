//
//  AddViewController.swift
//  Bookmark
//
//  Created by Lilico Isomata on 2016/09/24.
//  Copyright © 2016年 Lilico Isomata. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField?
    @IBOutlet var urlTextField: UITextField?
    
    var saveData : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleTextField?.text = saveData.objectForKey("title") as! String?
        urlTextField?.text = saveData.objectForKey("url") as! String?
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func save() {
        
//        saveData.setObject(titleTextField!.text, forKey: "title")
//        saveData.setObject(urlTextField!.text, forKey: "url")
//        saveData.synchronize()
//        
        
        //alertを出す
        
        let alert = UIAlertController(title: "保存",
                                      message: "titleとurlの保存が完了しました。",
                                      preferredStyle: UIAlertControllerStyle.Alert)
        
        //okボタン
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler:  {action in
                    //ボタンが押された時の動作
                    
                    NSLog("okボタンが押されたよ")
                    
                }
            )
        )
        
        
        presentViewController(alert, animated: true, completion: nil)
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "save" {
            
            
            
            
            let viewController:ViewController = segue.destinationViewController as! ViewController
            
            viewController.receiveTitle = titleTextField!.text
            viewController.receiveUrl = urlTextField!.text
            viewController.addInfo()
        }
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

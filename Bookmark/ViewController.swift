//
//  ViewController.swift
//  Bookmark
//
//  Created by Lilico Isomata on 2016/09/10.
//  Copyright © 2016年 Lilico Isomata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var table: UITableView!
    //@IBAction func addbutton(){
    
    
   // }
    
    var url:String!
    
    var fileArray = ["ライフイズテック","yahoo"]
    //var imageNameArray = [String]()
    var urlArray = ["https://life-is-tech.com","http://www.yahoo.co.jp/"]
    
    
    var receiveTitle :String!
    var receiveUrl : String!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    func addInfo(){
        if userDefaults.stringArrayForKey("fileArray") != nil && userDefaults.stringArrayForKey("urlArray") != nil{
        fileArray = userDefaults.stringArrayForKey("fileArray")!
        urlArray = userDefaults.stringArrayForKey("urlArray")!
        }
        fileArray.append(receiveTitle)
        urlArray.append(receiveUrl)
        userDefaults.setObject(fileArray, forKey: "fileArray")
        userDefaults.setObject(urlArray, forKey: "urlArray")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        table.dataSource = self
        //どこから引っ張るか
        
        table.delegate = self
        table.dataSource = self
        
        if userDefaults.stringArrayForKey("fileArray") != nil && userDefaults.stringArrayForKey("urlArray") !=
            nil {
            fileArray = userDefaults.stringArrayForKey("fileArray")!
            
            urlArray = userDefaults.stringArrayForKey("urlArray")!
        }
        
        
//        fileArray = ["ライフイズテック","yahoo"]
//        
////        imageNameArray = ["life is tech.png"]
//        urlArray = ["https://life-is-tech.com","http://www.yahoo.co.jp/"]
//        

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileArray.count
        //セルの数
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        NSLog("del")
        
        // 編集
        let edit = UITableViewRowAction(style: .Normal, title: "Edit") {
            (action, indexPath) in
            
            self.fileArray[indexPath.row] += "!!"
            self.table.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
        edit.backgroundColor = UIColor.greenColor()
        
        // 削除
        let del = UITableViewRowAction(style: .Default, title: "Delete") {
            (action, indexPath) in
            
            self.fileArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
        del.backgroundColor = UIColor.redColor()
        
        return true
    }
    
    //編集に対応
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            fileArray.removeAtIndex(indexPath.row)
            urlArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath],withRowAnimation:UITableViewRowAnimation.Automatic)
        userDefaults.setObject(fileArray, forKey: "fileArray")
        userDefaults.setObject(urlArray, forKey: "urlArray")
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell?.textLabel?.text =
        fileArray[indexPath.row]
    
        
//        let image: UIImage = UIImage(named: imageNameArray[indexPath.row])!
//        
//        let size = CGSize(width: 50, height: 60)
//        UIGraphicsBeginImageContext(size)
//        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
//        let resizeImage  = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        
//        
//        cell?.imageView?.image = resizeImage
        
        
        
        
        
        return cell!
    }
   
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog(fileArray[indexPath.row])
       // url = urlArray[indexPath.row]
//        NSLog(url)
    }
    
     override func prepareForSegue(segue:UIStoryboardSegue, sender:AnyObject?) {
        if segue.identifier == "detailsegue"{
            if let indexPath = self.table.indexPathForSelectedRow{
                let url = urlArray[indexPath.row]
                
                let resultViewController:ResultViewController = segue.destinationViewController as! ResultViewController
                resultViewController.url = url
                NSLog(url)

            
            }
            
        }
    }
    
       
}


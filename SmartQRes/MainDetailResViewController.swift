//
//  MainDetailResViewController.swift
//  SmartQRes
//
//  Created by ninguchi on 1/7/2558 BE.
//  Copyright (c) 2558 BlueSeed. All rights reserved.
//

import UIKit

class MainDetailResViewController: UIViewController , UISplitViewControllerDelegate {
    
    @IBOutlet weak var labelRestName: UILabel!
    var resId:NSNumber = 0
    @IBOutlet weak var imgRestaurant: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var nav = self.navigationController?.navigationBar
        nav?.barTintColor = UIColor(red: (2/255.0), green: (119/255.0), blue: (189/255.0), alpha: 1.0)
        nav?.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Century Gothic", size: 20)!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        nav?.tintColor = UIColor.whiteColor()
        
        // Do any additional setup after loading the view.
        print("Main Detail Res View Controller")
        print("Current Res Id : \(self.resId)")
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let resId:NSNumber = prefs.integerForKey("RESID") as NSNumber
        self.resId =  resId
        print("User resid \(self.resId)")
        RestaurantController().getRestaurantById(self.resId, uiView: self)
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

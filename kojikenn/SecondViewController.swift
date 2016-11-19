//
//  SecondViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/04/03.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func meikeiHPLinkButton() {
        let url = NSURL(string: "http://www.meikei.ac.jp")
        if UIApplication.sharedApplication().canOpenURL(url!){
            UIApplication.sharedApplication().openURL(url!)
        }
    }
    @IBAction func QuestantLinkButton() {
        let url = NSURL(string: "https://questant.jp/q/GE0S93C9")
        if UIApplication.sharedApplication().canOpenURL(url!){
            UIApplication.sharedApplication().openURL(url!)
        }
    }
}

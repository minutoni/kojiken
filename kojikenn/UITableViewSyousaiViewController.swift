//
//  UITableViewSyousaiViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/06/19.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit

class UITableViewSyousaiViewController: UIViewController, UITextFieldDelegate {
    
    var SetsumeiArray = [String]()
    
    @IBOutlet var  setsumeiText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetsumeiArray = ["中学職員室","高校職員室","校長室","会議室","図書館","生徒会室","教務部室","保健室"]
        setsumeiText.text = SetsumeiArray[index]


        // Do any additional setup after loading the view.
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

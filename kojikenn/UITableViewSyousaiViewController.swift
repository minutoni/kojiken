//
//  UITableViewSyousaiViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/06/19.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit

class UITableViewSyousaiViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var TableSyousaiImageView: UIImageView!
    var selectedImg: UIImage!
    
    @IBOutlet var SetsumeiTextView: UITextView!
    var selectedTextView : UITextView!
    
    
    
    //@IBOutlet var  setsumeiText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableSyousaiImageView.image = selectedImg
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        TableSyousaiImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        
        
        
        //setsumeiText.text = SetsumeiArray[index]
        
        //[index] = [


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

//
//  BusTimePictureViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/06/25.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit

class BusTimePictureViewController: UIViewController {
    
    @IBOutlet var BusTimeImageView: UIImageView!
    var selectedImg: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BusTimeImageView.image = selectedImg
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        //BusTimeImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        //BusTimePicture.image = BusTimeImageArray[index]

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

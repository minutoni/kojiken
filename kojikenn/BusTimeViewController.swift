//
//  busTimeViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/06/20.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit

class BusTimeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var BusTime: UITableView!
    
    
    let BusTimePictureArray: NSArray = ["ひたち野うしく.jpg","研究学園.jpg","6方面.jpg","6方面-2.jpg","6方面-3.jpg", "6方面-3.jpg"]
    
    //方面名の配列
    var BusTimeNameArray = [String]()
    
    var selectedImage: UIImage?
    
    var BusTimeImageArray = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        BusTime.dataSource = self
        
        //UITableが持っているデリゲートメソッドの処理の委託先をViewController.swiftに設定
        BusTime.delegate = self
        
        //BusTimeNameArrayに時刻表名を入れていく。
        BusTimeNameArray = ["ひたち野うしく方面","研究学園方面","守谷・水海道方面/戸頭・板橋方面/茎崎方面","石下・東光台方面/下館・北条方面","江戸崎・阿見方面"]
        
        BusTimeImageArray = ["ひたち野うしく.jpg","研究学園.jpg","6方面.jpg","6方面-2.jpg","6方面-3.jpg", "6方面-3.jpg"]
        
        
    }
    
    //セルの数を指定。
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return BusTimeNameArray.count
    }
    
    
    //ID付きのセルを取得、textLabelに「テスト」と表示させてみる。
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!  as  UITableViewCell
        
        cell.textLabel?.text = BusTimeNameArray[indexPath.row]
        
        cell.imageView?.image = UIImage(named: BusTimeImageArray[indexPath.row])
        
        return cell
    }

    
    //セルが押された時に呼ばれるデリゲートメソッド
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = UIImage(named:"\(BusTimePictureArray[indexPath.row])")
        if selectedImage != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("toBusTime", sender: nil)
        }
        
    }
        
        // Segue 準備
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
            if (segue.identifier == "toBusTime") {
                let subVC: BusTimePictureViewController = (segue.destinationViewController as? BusTimePictureViewController)!
                // SubViewController のselectedImgに選択された画像を設定する
                subVC.selectedImg = selectedImage
        
    }
            

            
            
            
            
            
            
           func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                if (segue.identifier == "toBusTime") {
                    let subVC: BusTimePictureViewController = (segue.destinationViewController as? BusTimePictureViewController)!
                    // SubViewController のselectedImgに選択された画像を設定する
                    subVC.selectedImg = selectedImage
                }
            }
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

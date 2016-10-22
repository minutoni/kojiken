//
//  KounaiMapViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/10/03.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit

class KounaiMapViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var kounai: UITableView!
    
    
    let kounaiPictureArray: NSArray = ["1階.jpg","2階.jpg","3階.jpg","4階.jpg"]
    
    //方面名の配列
    var kounaiNameArray = [String]()
    
    var selectedkounaiImage: UIImage?
    
    var kounaiImageArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        kounai.dataSource = self
        
        //UITableが持っているデリゲートメソッドの処理の委託先をViewController.swiftに設定
        kounai.delegate = self
        
        //kounaiNameArrayに時刻表名を入れていく。
        kounaiNameArray = ["1階","2階","3階","4階"]
        
        kounaiImageArray = ["1階.jpg","2階.jpg","3階.jpg","4階.jpg"]
        
        
    }
    
    //セルの数を指定。
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return kounaiNameArray.count
    }
    
    
    //ID付きのセルを取得、textLabelに「テスト」と表示させてみる。
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("kounaiCell")!  as  UITableViewCell
        
        cell.textLabel?.text = kounaiNameArray[indexPath.row]
        
        cell.imageView?.image = UIImage(named: kounaiImageArray[indexPath.row])
        
        return cell
    }
    
    
    //セルが押された時に呼ばれるデリゲートメソッド
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedkounaiImage = UIImage(named:"\(kounaiPictureArray[indexPath.row])")
        if selectedkounaiImage != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("tokounai", sender: nil)
        }
        
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "tokounai") {
            let subVC: kounaiMapPictureViewController = (segue.destinationViewController as? kounaiMapPictureViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.selectedkounaiImg = selectedkounaiImage
            
        }
        
        
        
        
        
        
        
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            if (segue.identifier == "tokounai") {
                let subVC: kounaiMapPictureViewController = (segue.destinationViewController as? kounaiMapPictureViewController)!
                // SubViewController のselectedImgに選択された画像を設定する
                subVC.selectedkounaiImg = selectedkounaiImage
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




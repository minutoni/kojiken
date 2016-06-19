//
//  UITableViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/06/03.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit

//UITableViewDataSource(データソース)メソッドを使うための「プロトコル宣言」を行う。
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    //場所名の配列
    var PlaceNameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        table.dataSource = self
        
        //UITableが持っているデリゲートメソッドの処理の委託先をViewController.swiftに設定
        table.delegate = self
        
        //SongArrayに曲名を入れていく。
        PlaceNameArray = ["中学職員室","高校職員室","校長室","会議室","図書館","生徒会室","教務部室","保健室"]
        

        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数を指定。
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return PlaceNameArray.count
    }
    
    //ID付きのセルを取得、textLabelに「テスト」と表示させてみる。
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!  as  UITableViewCell
        
        cell.textLabel?.text = PlaceNameArray[indexPath.row]
        return cell
    }
    
    //セルが押された時に呼ばれるデリゲートメソッド
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%@が選ばれました。", PlaceNameArray[indexPath.row])
        
        //文字位置
        //PlaceNameArray.textAlignment = NSTextAlignment.Center
        
        // 文字サイズ
        //PlaceNameArray.font = UIFont.italicSystemFontOfSize(21)
        
        // 背景色
        //table.backgroundColor = UIColor.redColor()
        
        // 文字色
        //PlaceNameArray.textColor =  UIColor.whiteColor()
        
        performSegueWithIdentifier("shousai", sender: nil)
        
    }
}

//
//  UITableViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/06/03.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit

//UITableViewDataSource(データソース)メソッドを使うための「プロトコル宣言」を行う。
class UITableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var searchController = UISearchController(searchResultsController: nil)
    
    let dataList = ["第一体育館","第二体育館","プール","ラグビー場","剣道場","柔道場","トレーナー室","中庭","屋上","相談室","保健室","購買部","セミナー室A・B","コモンスペース","１０１教室","第三美術室","第二美術室","第一美術室",]
    
    var selectedImage : UIImage?
    
    var selectedText : UITextView?
    
    //場所名の配列
    
    var searchResults = [String]()
    
    
    var PlaceNameArray = [String]()
    
    var PlacePictureArray : NSArray = ["第一体育館-6.jpg","第二体育館.jpg","プール.jpg","ラグビー場.jpg","剣道場.jpg","柔道場.jpg","","中庭.jpg","無線斑の電波塔.jpg","","保健室.jpg","購買部.jpg","セミナー室.jpg","","101教室.JPG","第三美術室.jpg","第二美術室.jpg","第一美術室.jpg",]
    
    var SetsumeiArray  : NSArray = ["第一体育館","第二体育館","プール","ラグビー場","剣道場","柔道場","トレーナー室","中庭","屋上","相談室","保健室","購買部","セミナー室A・B","コモンスペース","１０１教室","第三美術室","第二美術室","第一美術室",]
    
    var PlaceImageArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        table.dataSource = self
        
        //UITableが持っているデリゲートメソッドの処理の委託先をViewController.swiftに設定
        table.delegate = self
        
        //結果表示用のビューコントローラーに自分を設定する。
        //searchController.searchResultsUpdater = self
        
        //検索中にコンテンツをグレー表示にしない。
        searchController.dimsBackgroundDuringPresentation = false
        
        //テーブルビューのヘッダーにサーチバーを設定する。
        table.tableHeaderView = searchController.searchBar
        
        //PlaceArrayに曲名を入れていく。
        PlaceNameArray = ["第一体育館","第二体育館","プール","ラグビー場","剣道場","柔道場","トレーナー室","中庭","屋上","相談室","保健室","購買部","セミナー室A・B","コモンスペース","１０１教室","第三美術室","第二美術室","第一美術室",]
        
        PlaceImageArray = ["第一体育館-6.jpg","第二体育館.jpg","プール.jpg","ラグビー場.jpg","剣道場.jpg","柔道場.jpg","","中庭.jpg","無線斑の電波塔.jpg","","保健室.jpg","購買部.jpg","セミナー室.jpg","","101教室.JPG","第三美術室.jpg","第二美術室.jpg","第一美術室.jpg","",]
        
        
        
        
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
        
        cell.imageView?.image = UIImage(named: PlaceImageArray[indexPath.row])
        
        //cell.textLabel?.text = UITextView(named: SetsumeiArray[indexPath.row])
        
        //セルを取得する。
        let Cell = table.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath) as UITableViewCell
        if( searchController.searchBar.text != "" ) {
            cell.textLabel?.text = searchResults[indexPath.row]
        } else {
            cell.textLabel?.text = dataList[indexPath.row]
        }
        
        return cell
    }
    
    
    //データの個数を返すメソッド
    func tableview(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        if( searchController.searchBar.text != "" ) {
            return searchResults.count
        } else {
            return dataList.count
        }
    }
    
    //検索文字列変更時の呼び出しメソッド
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        //検索文字列を含むデータを検索結果配列に格納する。
        searchResults = dataList.filter { data in
            return data.containsString(searchController.searchBar.text!)
        }
        
        //テーブルビューを再読み込みする。
        table.reloadData()
    }
    
    //セルが押された時に呼ばれるデリゲートメソッド
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%@が選ばれました。", PlaceNameArray[indexPath.row])
        
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = UIImage(named:"\(PlacePictureArray[indexPath.row])")
        if selectedImage != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("toSyousai", sender: nil)
        }
        
        /*selectedText = UITextView(coder: NSCoder, "\(SetsumeiArray[indexPath.row])")
        if selectedText != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("toSyousai", sender: nil)
        }*/
        
        //文字位置
        //PlaceNameArray.textAlignment = NSTextAlignment.Center
        
        // 文字サイズ
        //PlaceNameArray.font = UIFont.italicSystemFontOfSize(21)
        
        // 背景色
        //table.backgroundColor = UIColor.redColor()
        
        // 文字色
        //PlaceNameArray.textColor =  UIColor.whiteColor()
        
        //performSegueWithIdentifier("toSyousai", sender: nil)
        
    }
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toSyousai") {
            let subVC: UITableViewSyousaiViewController = (segue.destinationViewController as? UITableViewSyousaiViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.selectedImg = selectedImage
            
            subVC.selectedTextView  = selectedText
            
        }
    }
    
        /*func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            if (segue.identifier == "toSyousai") {
                let subVC: BusTimePictureViewController = (segue.destinationViewController as? BusTimePictureViewController)!
                // SubViewController のselectedImgに選択された画像を設定する
                subVC.selectedImg = selectedImage
*/
}

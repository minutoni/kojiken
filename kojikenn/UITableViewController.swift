//
//  UITableViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/06/03.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit

//UITableViewDataSource(データソース)メソッドを使うための「プロトコル宣言」を行う。
class TableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet var searchBar: UISearchBar!
    
    
    
    var selectedImage : UIImage?
    
    var selectedText : UITextView?
    
    //場所名の配列
    
    var searchResults = [String]()
    
    
    var PlaceNameArray : [String] = ["第一体育館","第二体育館","プール","ラグビー場","剣道場","柔道場","トレーナー室","中庭","屋上","相談室","保健室","購買部","セミナー室A・B","コモンスペース","１０１教室","第三美術室","第二美術室","第一美術室",]
    
    var PlacePictureArray : NSArray = ["第一体育館-6.jpg","第二体育館.jpg","プール.jpg","ラグビー場.jpg","剣道場.jpg","柔道場.jpg","","中庭.jpg","無線斑の電波塔.jpg","","保健室.jpg","購買部.jpg","セミナー室.jpg","","101教室.JPG","第三美術室.jpg","第二美術室.jpg","第一美術室.jpg",]
    
    var SetsumeiArray  : NSArray = ["オアw毛fの：愛rg：おいあんrg：老いん：誤飲：えwpg：ぱwんg：おあんw：gろあん：おうぇgん：ぱwんg","第二体育館","プール","ラグビー場","剣道場","柔道場","トレーナー室","中庭","屋上","相談室","保健室","購買部","セミナー室A・B","コモンスペース","１０１教室","第三美術室","第二美術室","第一美術室",]
    
    var PlaceImageArray : [String] = ["第一体育館-6.jpg","第二体育館.jpg","プール.jpg","ラグビー場.jpg","剣道場.jpg","柔道場.jpg","","中庭.jpg","無線斑の電波塔.jpg","","保健室.jpg","購買部.jpg","セミナー室.jpg","","101教室.JPG","第三美術室.jpg","第二美術室.jpg","第一美術室.jpg","",]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        searchBar.delegate = self
        
        searchBar.showsCancelButton = true
        
        table.dataSource = self
        
        //UITableが持っているデリゲートメソッドの処理の委託先をViewController.swiftに設定
        table.delegate = self
        
        //結果表示用のビューコントローラーに自分を設定する。
        //searchController.searchResultsUpdater = self
        
        //検索中にコンテンツをグレー表示にしない。
        //searchController.dimsBackgroundDuringPresentation = false
        
        //テーブルビューのヘッダーにサーチバーを設定する。
        //table.tableHeaderView = searchController.searchBar
        
        
        
        
                
        
    }
    
    //サーチバー更新時(UISearchBarDelegateを関連づけておく必要があります）
    func mySearchBar(mySearchBar: UISearchBar, textDidChange searchText: String) {
        //            myLabel.text = searchText
    }
    
//    //キャンセルクリック時(UISearchBarDelegateを関連づけておく必要があります）
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        //            myLabel.text = ""
//        searchBar.text = ""
//    }
//    
//    //サーチボタンクリック時(UISearchBarDelegateを関連づけておく必要があります）
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        //            myLabel.text = "社内に同じ意見があるか検索中..."
//        searchBar.text = ""
//        self.view.endEditing(true)
//    }

    
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
        
        cell.textLabel?.text =  UITextView(coder: SetsumeiArray[NSArray])
        //cell.textLabel?.text = SetsumeiArray[indexPath.row]
        
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
        
        selectedText?.text = SetsumeiArray[indexPath.row] as! String
        if selectedText != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("toSyousai", sender: nil)
        }
}

        //文字位置
        //PlaceNameArray.textAlignment = NSTextAlignment.Center
        
        // 文字サイズ
        //PlaceNameArray.font = UIFont.italicSystemFontOfSize(21)
        
        // 背景色
        //table.backgroundColor = UIColor.redColor()
        
        // 文字色
        //PlaceNameArray.textColor =  UIColor.whiteColor()
        
        //performSegueWithIdentifier("toSyousai", sender: nil)

    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toSyousai") {
            let subVC: UITableViewSyousaiViewController = (segue.destinationViewController as? UITableViewSyousaiViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.selectedImg = selectedImage
            
            subVC.selectedTextView  = selectedText
            
        }
    }

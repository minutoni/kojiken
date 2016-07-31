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
    var selectedStr = ""
    
    
    //場所名の配列
    var searchResults = [String]()
    
    var searchImageResults = [String]()
    
    
    
    //Array
    var PlaceNameArray = [String]()
    
    var PlaceImageArray = [String]()
    
    
    //Dictionary
    var setumeiDic = Dictionary<String, String>()
    
    var placePictureDic = [String:String]()
    
    




    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        searchBar.delegate = self
        
        searchBar.showsCancelButton = true
        
        table.dataSource = self
        
        //UITableが持っているデリゲートメソッドの処理の委託先をViewController.swiftに設定
        table.delegate = self
        
        
        
        //Arrayの中身
        PlaceNameArray = ["第一体育館","第二体育館","プール","ラグビー場","剣道場","柔道場","トレーナー室","中庭","屋上","相談室","保健室","購買部","セミナー室A・B","コモンスペース","１０１教室","第三美術室","第二美術室","第一美術室",]
    
        PlaceImageArray = ["第一体育館-6.JPG","第二体育館.JPG","プール.JPG","ラグビー場.JPG","剣道場.JPG","柔道場.JPG","","中庭.JPG","無線斑の電波塔.JPG","","保健室.JPG","購買部.JPG","セミナー室.JPG","","101教室.JPG","第三美術室.JPG","第二美術室.JPG","第一美術室.JPG",]
        
    
        
        
        
        //サムネの文　: 本文
        setumeiDic = ["第一体育館":"第一体育館の説明","第二体育館":"第二体育館の説明","プール":"第一体育館の説明","剣道":"剣道の説明"]
        
        //サムネイル　＋　中身
        placePictureDic = ["第一体育館":"第一体育館-6.JPG","第二体育館":"第二体育館.JPG"]
        
        
        
        searchResults = PlaceNameArray
        searchImageResults = PlaceImageArray
        
    
    
    }
    
    
    
    
    
    
    
    
    
    //キャンセルクリック時(UISearchBarDelegateを関連づけておく必要があります）
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchResults = PlaceNameArray
        searchImageResults = PlaceImageArray
        searchBar.text = ""
        self.view.endEditing(true)

        
        table.reloadData()
    }
    
    
    
    
    //サーチボタンクリック時(UISearchBarDelegateを関連づけておく必要があります）
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //            myLabel.text = "社内に同じ意見があるか検索中..."
        searchResults = PlaceNameArray.filter { data in
            return data.containsString(searchBar.text!)
        }
        searchImageResults = PlaceImageArray.filter { data in
            return data.containsString(searchBar.text!)
        }
        print(searchResults)
        print(searchImageResults)
        searchBar.text = ""
        self.view.endEditing(true)
        table.reloadData()

    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    //セルの数を指定。
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    
    
    
    //ID付きのセルを取得、textLabelに「テスト」と表示させてみる。
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!  as  UITableViewCell
        //let index =
        cell.textLabel?.text = searchResults[indexPath.row]
        
        cell.imageView?.image = UIImage(named: searchImageResults[indexPath.row])
        
        
        //セルを取得する。
        //        let Cell = table.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath) as UITableViewCell
        //        if( searchController.searchBar.text != "" ) {
        //            cell.textLabel?.text = searchResults[indexPath.row]
        //        } else {
        //            cell.textLabel?.text = dataList[indexPath.row]
        //        }
        
        return cell
    }
    
    
    

    
    //検索文字列変更時の呼び出しメソッド
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        //検索文字列を含むデータを検索結果配列に格納する。
        searchResults = searchResults.filter { data in
            return data.containsString(searchController.searchBar.text!)
        }
        
        //テーブルビューを再読み込みする。
        table.reloadData()
    }
    
    
    
    
    //セルが押された時に呼ばれるデリゲートメソッド
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%@が選ばれました。", PlaceNameArray[indexPath.row])
        
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = UIImage(named:"\(PlaceImageArray[indexPath.row])")
        selectedStr = setumeiDic[searchResults[indexPath.row]]!
        if selectedImage != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("toSyousai", sender: nil)
        }

    }
    
    
     @IBAction func  QRCodeButton() {
        // SubViewController へ遷移するために Segue を呼び出す
        performSegueWithIdentifier("toQRCode", sender: nil)
    
    }
    
    
    

    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toSyousai") {
            let subVC: UITableViewSyousaiViewController = (segue.destinationViewController as? UITableViewSyousaiViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.selectedImg = selectedImage
            
            subVC.selectedStr  = selectedStr
            
            
            
        }
    }
}

//ーーーーーーーーーオマケーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
//文字位置
//PlaceNameArray.textAlignment = NSTextAlignment.Center

// 文字サイズ
//PlaceNameArray.font = UIFont.italicSystemFontOfSize(21)

// 背景色
//table.backgroundColor = UIColor.redColor()

// 文字色
//PlaceNameArray.textColor =  UIColor.whiteColor()

//performSegueWithIdentifier("toSyousai", sender: nil)
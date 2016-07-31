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
        PlaceNameArray = ["第一体育館","第二体育館","プール","ラグビー場","剣道場","柔道場","トレーナー室","中庭","屋上","相談室","保健室","購買部","セミナー室A・B","1階コモンスペース","101教室","第三美術室","第二美術室","第一美術室","HR教室","音楽室","2階コモンスペース","高校職員室前廊下","生物室","書道室","進路資料室","コンピューター室","大教室前廊下","図書室","校長室前廊下","事務室前","高校校舎前","食堂前","寮門前","寮",]
    
        PlaceImageArray = ["第一体育館-6.JPG","第二体育館.JPG","プール.JPG","ラグビー場.JPG","剣道場.JPG","柔道場.JPG","トレーナー室(写真なし)","中庭.JPG","無線斑の電波塔.JPG","相談室(写真なし)","保健室.JPG","購買部.JPG","セミナー室.JPG","コモンスペース1.JPG","101教室.JPG","第三美術室.JPG","第二美術室.JPG","第一美術室.JPG","HR教室.JPG","音楽室(写真なし)","コモンスペース２.JPG","高校職員室前廊下.JPG","生物実験室.JPG","書道室.JPG","進路資料室.JPG","第一コンピューター室.JPG","大教室前絵画.JPG","図書室.JPG","交流校.JPG","事務室.JPG","高校棟前.JPG","食堂前.JPG","寮門前.JPG","寮.JPG",]
        
    
        
        
        
        
        
        
        
        
        
        //サムネの文　: 本文
        //setumeiDic = ["第一体育館":"第一体育館の説明","第二体育館":"第二体育館の説明","プール":"第一体育館の説明","剣道":"剣道の説明"]
        setumeiDic = ["第一体育館":"第一体育館の説明","第二体育館":"第二体育館の説明","プール":"プールの説明","ラグビー場":"ラグビー場","剣道場":"剣道場の説明","柔道場":"柔道場の説明","トレーナー室":"トレーナー室の説明","中庭":"中庭の説明","屋上":"屋上の説明","相談室":"相談室の説明","保健室":"保健室の説明","購買部":"購買部の説明","セミナー室A・B":"セミナー室の説明","1階コモンスペース":"1階コモンスペースの説明","101教室":"101教室の説明","第三美術室":"第三美術室の説明","第二美術室":"第二美術室の説明","第一美術室":"第一美術室の説明","HR教室":"HR教室の説明","音楽室":"音楽室の説明","2階コモンスペース":"2階コモンスペースの説明","高校職員室前廊下":"高校職員室前廊下の説明","生物室":"生物室の説明","書道室":"書道室","進路資料室":"進路資料室の説明","コンピューター室":"コンピューター室の説明","大教室前廊下":"大教室前廊下の説明","図書室":"図書室の説明","校長室前廊下":"校長室前廊下の説明","事務室前":"事務室間の説明","高校校舎前":"高校校舎前の説明","食堂前":"食堂前の説明","寮門前":"寮門前の説明","寮":"寮の説明",]
        
        
        
        
        
        
        
        
        
        
        //サムネイル　＋　中身
        //placePictureDic = ["第一体育館":"第一体育館-6.JPG","第二体育館":"第二体育館.JPG"]
        placePictureDic = ["第一体育館":"第一体育館-6.JPG","第二体育館":"第二体育館.JPG","プール":"プール.JPG","ラグビー場":"ラグビー場.JPG","剣道場":"剣道場.JPG","柔道場":"柔道場.JPG","トレーナー室":"トレーナー室(写真なし)","中庭":"中庭.JPG","屋上":"無線斑の電波塔.JPG","相談室":"相談室(写真なし)","保健室":"保健室.JPG","購買部":"購買部.JPG","セミナー室":"セミナー室.JPG","1階コモンスペース":"コモンスペース1.JPG","101教室":"101教室.JPG","第三美術室":"第三美術室.JPG","第二美術室":"第二美術室.JPG","第一美術室":"第一美術室.JPG","HR教室":"HR教室.JPG","音楽室":"音楽室(写真なし)","2階コモンスペース":"コモンスペース２.JPG","高校職員室前廊下":"高校職員室前廊下.JPG","生物実験室":"生物実験室.JPG","書道室":"書道室.JPG","進路資料室":"進路資料室.JPG","コンピューター室":"第一コンピューター室.JPG","大教室前廊下":"大教室前絵画.JPG","図書室":"図書室.JPG","校長室前廊下":"交流校.JPG","事務室前":"事務室.JPG","高校校舎前":"高校棟前.JPG","食堂前":"食堂前.JPG","寮門前":"寮門前.JPG","寮":"寮.JPG",]
        
        
        
        
        
        
        
        
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
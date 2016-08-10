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
        PlaceNameArray = ["第一体育館","第二体育館","プール","ラグビー場","剣道場","柔道場","トレーナー室","中庭","屋上","相談室","保健室","購買部","セミナー室A・B","1階コモンスペース","101教室","第三美術室","第二美術室","第一美術室","HR教室","音楽室","2階コモンスペース","高校職員室前廊下","生物室","書道室","進路資料室","コンピューター室","大教室前廊下","図書室","校長室前廊下","事務室","高校校舎","食堂","寮門前","寮",]
    
        PlaceImageArray = ["第一体育館-6.JPG","第二体育館.JPG","プール.JPG","ラグビー場.JPG","剣道場.JPG","柔道場.JPG","トレーナ室.JPG","中庭.JPG","無線斑の電波塔.JPG","相談.JPG","保健室.JPG","購買.JPG","セミナー室.JPG","コモンスペース1.JPG","101教室.JPG","第三美術室.JPG","第二美術室.JPG","第一美術室.JPG","HR教室.JPG","音楽室.JPG","コモンスペース２.JPG","高校職員室前.JPG","生物実験室.JPG","書道室.JPG","進路資料室.JPG","第一コンピューター室.JPG","大教室前絵画.JPG","図書室.JPG","校長室前廊下.JPG","事務室.JPG","高校棟前.JPG","食堂前.JPG","寮門前.JPG","寮.JPG",]
        
    
        
        
        
        
        
        
        
        
        
        //サムネの文　: 本文
        //setumeiDic = ["第一体育館":"第一体育館の説明","第二体育館":"第二体育館の説明","プール":"第一体育館の説明","剣道":"剣道の説明"]
        setumeiDic = ["第一体育館":"バドミントン部とバスケ部が使っている。茗渓学園は筑波大の同窓会設立の学校のため、筑波大出身の教員が多く、特に体育科は全員筑波大の体育出身。そのため、学生時代にはタイトルを持っていた先生も多く、指導が専門的で上手。","第二体育館":"バレーボール部と体操部が使っている。体操の授業ではトランポリンなどもでき、高校生の体操では大車輪ができる生徒もいる。そして鉄棒から落ちても平気な「ピット」がある。県内でもここまでの施設があるのは２校のみ","プール":"水泳部が使っている。体育の授業では６〜９月にかけてプールの授業がある。","ラグビー場":"ラグビー部が使っている。授業では週三回の内1回はラグビーで、中学一年生はタックルなしのタッチラグビーなので安全。運動神経が鈍くても楽しみながらできるので心配ない。1年に一回、校技大会があり男子の種目はラグビー。","剣道場":"剣道部が使っている。授業では週三回の内一回は武道の時間があり、学年や選択によっては剣道がある。寮生は、週に一度、早朝武道の時間がある。1年に一回、校技大会があり女子の種目は剣道。高校2年では女子は授業で昇段審査が受けられる。普通の人でも１級。運動神経のいい人は初段をとる人もいる。","柔道場":"柔道部が使っている。授業では週三回の内一回は武道の時間があり、学年や選択によっては柔道がある。寮生は、早朝武道の時間がある。","トレーナー室":"月に数回、筑波大のスポーツトレーナーが来る。そこで、肩や膝の故障を見てもらったり、トレーニングの仕方を教えてもらったりなどがあり、予約が多数ある。外科に見てもらう前の予備相談もできる。中高でこの制度を持つ学校は稀。","中庭":"特に決まった部活が使うわけではないが、よくダンス部が使っている。バスケットコートが2つあり、授業で使うことや、部活で使ったり、昼休みにここで遊ぶなど様々なことをしている。","屋上":"科学部無線斑と科学部天文班が使っている。今は使えないが、高校棟屋上には天文班の望遠鏡があり、中学棟の屋上には科学部無線斑のアンテナがあり、六回生で宇宙飛行士の星出さんが国際宇宙ステーションに滞在していた時はここから国際宇宙ステーションに交信をしていたこともある。","相談室":"相談室は2つある。専門のカウンセラーが週3回、予約したり、空いていれば予約なしでもカウンセリングを受けられる。寮生のメンタルヘルスケアだけではなく、通学生や、親も利用している。筑波大の精神科と連携している。","保健室":"看護師の資格を持つ養護教論が2名、非常勤が2名、寮生が病気の場合、朝の点呼でいない時は、HM(ハウスマスター)が保健室へ連絡し朝、看護師が寮に来て様子を見て、受診させる必要のある場合は、学校の車を使い病院まで送り、受診させる。感染症の場合は、別室に移動して食事を運び、静養させるが、状態によっては、自宅や国内帰省先に保護者同伴で一時帰宅してもらう場合もある。入試の面接で、緊急帰省先の確認を行っている。","購買部":"朝、昼休み、放課後に利用することができ、おやつや飲み物、文房具やプロテイン、シャツやタオルなども買うことができ、便利。高校生の給食選択者ではない人は、朝、ここで弁当の注文をすることができる。","セミナー室A・B":"授業では、多目的室として使われ、通学生は申請すれば、夜９時までここで自習することができる。希望者には駿台のサテライン教材を利用することができる。休日にも利用するこてができ、寮にも自習室がある。","1階コモンスペース":"SSHの取り組みについての紹介ポスターや、制服のショーケースなどがある。放課後には、サカエパンの売店ができ、購買やここで買ったものを食べるための飲食スペースもある。","101教室":"101教室の説明","第三美術室":"第三美術室の説明","第二美術室":"第二美術室の説明","第一美術室":"第一美術室の説明","HR教室":"HR教室の説明","音楽室":"音楽室の説明","2階コモンスペース":"2階コモンスペースの説明","高校職員室前廊下":"高校職員室前廊下の説明","生物室":"生物室の説明","書道室":"書道室","進路資料室":"進路資料室の説明","コンピューター室":"コンピューター室の説明","大教室前廊下":"大教室前廊下の説明","図書室":"図書室の説明","校長室前廊下":"校長室前廊下の説明","事務室":"事務室の説明","高校校舎":"高校校舎の説明","食堂":"食堂の説明","寮門前":"寮門前の説明","寮":"寮の説明",]
        
        
        
        
        
        
        
        
        
        
        //サムネイル　＋　中身
        //placePictureDic = ["第一体育館":"第一体育館-6.JPG","第二体育館":"第二体育館.JPG"]
        placePictureDic = ["第一体育館":"第一体育館-6.JPG","第二体育館":"第二体育館.JPG","プール":"プール.JPG","ラグビー場":"ラグビー場.JPG","剣道場":"剣道場.JPG","柔道場":"柔道場.JPG","トレーナー室":"トレーナ室.JPG","中庭":"中庭.JPG","屋上":"無線斑の電波塔.JPG","相談室":"相談.JPG","保健室":"保健室.JPG","購買部":"購買.JPG","セミナー室":"セミナー室.JPG","1階コモンスペース":"コモンスペース1.JPG","101教室":"101教室.JPG","第三美術室":"第三美術室.JPG","第二美術室":"第二美術室.JPG","第一美術室":"第一美術室.JPG","HR教室":"HR教室.JPG","音楽室":"音楽室.JPG","2階コモンスペース":"コモンスペース２.JPG","高校職員室前廊下":"高校職員室前.JPG","生物実験室":"生物実験室.JPG","書道室":"書道室.JPG","進路資料室":"進路資料室.JPG","コンピューター室":"第一コンピューター室.JPG","大教室前廊下":"大教室前絵画.JPG","図書室":"図書室.JPG","校長室前廊下":"校長室前廊下.JPG","事務室前":"事務室.JPG","高校校舎前":"高校棟前.JPG","食堂":"食堂前.JPG","寮門前":"寮門前.JPG","寮":"寮.JPG",]
        
        
        
        
        
        
        
        
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
        //return searchImageResults.count
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
//        //検索文字列を含むデータを検索結果配列に格納する。
//        searchImageResults = searchImageResults.filter { data in
//            return data.containsString(searchController.searchBar.text!)
//        }
//        
        //テーブルビューを再読み込みする。
        table.reloadData()
    }
    
    
    
    
    //セルが押された時に呼ばれるデリゲートメソッド
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%@が選ばれました。", PlaceNameArray[indexPath.row])
        
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = UIImage(named:"\(searchImageResults[indexPath.row])")
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
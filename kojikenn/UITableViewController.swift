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
        PlaceNameArray = ["第一体育館","第二体育館","プール","ラグビー場","剣道場","柔道場","トレーナー室","中庭","屋上","相談室","保健室","購買部","セミナー室A・B","1階コモンスペース","101教室","第三美術室","第二美術室","第一美術室","HR教室","音楽室","2階コモンスペース","高校職員室前廊下","生物室","書道室","進路資料室","コンピューター室","大教室前廊下","図書室","校長室前廊下","事務室","高校校舎前","食堂","寮門前","寮",]
    
        PlaceImageArray = ["第一体育館-6.JPG","第二体育館.JPG","プール.JPG","ラグビー場.JPG","剣道場.JPG","柔道場.JPG","トレーナ室.JPG","中庭.JPG","無線斑の電波塔.JPG","相談.JPG","保健室.JPG","購買.JPG","セミナー室.JPG","コモンスペース1.JPG","101教室.JPG","第三美術室.JPG","第二美術室.JPG","第一美術室.JPG","HR教室.JPG","音楽室.JPG","コモンスペース２.JPG","高校職員室前.JPG","生物実験室.JPG","書道室.JPG","進路資料室.JPG","第一コンピューター室.JPG","大教室前絵画.JPG","図書室.JPG","校長室前廊下.JPG","事務室.JPG","高校棟前.JPG","食堂前.JPG","寮門前.JPG","寮.JPG",]
        
    
        
        
        
        
        
        
        
        
        
        //サムネの文　: 本文
        //setumeiDic = ["第一体育館":"第一体育館の説明","第二体育館":"第二体育館の説明","プール":"第一体育館の説明","剣道":"剣道の説明"]
        setumeiDic = ["第一体育館":"バドミントン部とバスケ部が使っている。茗渓学園は筑波大の同窓会設立の学校のため、筑波大出身の教員が多く、特に体育科は全員筑波大の体育出身。そのため、学生時代にはタイトルを持っていた先生も多く、指導が専門的で上手。","第二体育館":"バレーボール部と体操部が使っている。体操の授業ではトランポリンなどもでき、高校生の体操では大車輪ができる生徒もいる。そして鉄棒から落ちても平気な「ピット」がある。県内でもここまでの施設があるのは２校のみ","プール":"水泳部が使っている。体育の授業では６〜９月にかけてプールの授業がある。","ラグビー場":"ラグビー部が使っている。授業では週三回の内1回はラグビーで、中学一年生はタックルなしのタッチラグビーなので安全。運動神経が鈍くても楽しみながらできるので心配ない。1年に一回、校技大会があり男子の種目はラグビー。","剣道場":"剣道部が使っている。授業では週三回の内一回は武道の時間があり、学年や選択によっては剣道がある。寮生は、週に一度、早朝武道の時間がある。1年に一回、校技大会があり女子の種目は剣道。高校2年では女子は授業で昇段審査が受けられる。普通の人でも１級。運動神経のいい人は初段をとる人もいる。","柔道場":"柔道部が使っている。授業では週三回の内一回は武道の時間があり、学年や選択によっては柔道がある。寮生は、早朝武道の時間がある。","トレーナー室":"月に数回、筑波大のスポーツトレーナーが来る。そこで、肩や膝の故障を見てもらったり、トレーニングの仕方を教えてもらったりなどがあり、予約が多数ある。外科に見てもらう前の予備相談もできる。中高でこの制度を持つ学校は稀。","中庭":"特に決まった部活が使うわけではないが、よくダンス部が使っている。バスケットコートが2つあり、授業で使うことや、部活で使ったり、昼休みにここで遊ぶなど様々なことをしている。","屋上":"科学部無線斑と科学部天文班が使っている。今は使えないが、高校棟屋上には天文班の望遠鏡があり、中学棟の屋上には科学部無線斑のアンテナがあり、六回生で宇宙飛行士の星出さんが国際宇宙ステーションに滞在していた時はここから国際宇宙ステーションに交信をしていたこともある。","相談室":"相談室は2つある。専門のカウンセラーが週3回、予約したり、空いていれば予約なしでもカウンセリングを受けられる。寮生のメンタルヘルスケアだけではなく、通学生や、親も利用している。筑波大の精神科と連携している。","保健室":"看護師の資格を持つ養護教論が2名、非常勤が2名、寮生が病気の場合、朝の点呼でいない時は、HM(ハウスマスター)が保健室へ連絡し朝、看護師が寮に来て様子を見て、受診させる必要のある場合は、学校の車を使い病院まで送り、受診させる。感染症の場合は、別室に移動して食事を運び、静養させるが、状態によっては、自宅や国内帰省先に保護者同伴で一時帰宅してもらう場合もある。入試の面接で、緊急帰省先の確認を行っている。","購買部":"朝、昼休み、放課後に利用することができ、おやつや飲み物、文房具やプロテイン、シャツやタオルなども買うことができ、便利。高校生の給食選択者ではない人は、朝、ここで弁当の注文をすることができる。","セミナー室A・B":"授業では、多目的室として使われ、通学生は申請すれば、夜９時までここで自習することができる。希望者には駿台のサテライン教材を利用することができる。休日にも利用するこてができ、寮にも自習室がある。","1階コモンスペース":"SSHの取り組みについての紹介ポスターや、制服のショーケースなどがある。放課後には、サカエパンの売店ができ、購買やここで買ったものを食べるための飲食スペースもある。","101教室":"帰国生、Gコースでよく使われる教室。ネイティヴの先生が授業をしている。できるだけ海外の現地校やインター校に近い様子にし、生徒への入学後の違和感を小さくしている。教材は、Milestoneを使う。","第三美術室":"第三美術室は中学棟の101教室の先の非常扉の先にある。陶芸や彫塑などの授業で使われる。粘土などを高温で焼く電気がまもある。","第二美術室":"美術部が使っている。第二・第一美術室は、中学棟の3階にある。第二美術室は彫刻、水彩画などをやる。中でも日本画は高校の授業でやっているのは茗渓だけ。","第一美術室":"美術部が使っている。第二・第一美術室は、中学棟の3階にある。主に油彩で使われる。美大に進みたい生徒はデッサン教室が選択授業で選ぶこともできる。","HR教室":"1クラス約40人ほど。設備はエアコン、プロジェクタなどがあり。プロジェクタを使って、プレゼンを行ったりすることでプレゼンをする力を身につける。","音楽室":"第一・第二・第三音楽室がある。吹奏楽部が使っている。","2階コモンスペース":"よく美術の作品や書道の作品などを飾っている。パソコンも置いてある。SSHでの取り組みのポスターや、TVのVTRなどもモニターで流している。","高校職員室前廊下":"壁にはTOEIC歴代高得点者の掲示、語学サービス、SATやTOEFL、IELTSのポスターで受験案内など、大学合格者名の掲示も。中心の棚には、美術の陶芸作品の紹介をしている。備前焼などの作品がある。","生物室":"科学部生物班が使っている。授業では、一人一台の顕微鏡を使い、実験などを行っている。","書道室":"書道部が使っている。日展に17年間連続で出展している先生もいる。","進路資料室":"個人課題研究の論文が全て保管されていて、自由に閲覧することができる。全国の大学のシラバスや、受験の赤本も多数置いてある。","コンピューター室":"コンピューター同好会が使っている。第一、第二コンピューター室があり、各50台ずつパソコンが置いてあり、この他にも、図書館、廊下、コモンスペース、図書館、寮生は各フロアにある。入学すると、学校のパソコン用にアカウントがもらえる。","大教室前廊下":"大教室は演劇部が使っている。大教室前の絵画は、卒業後に画家になった生徒の作品を飾っている。","図書室":"蔵書数は6万冊、墓にも書庫に1万冊以上ある。スタッフは、専任常勤の司書教論2名、非常勤の司書2名の総勢4名。創設時より、図書を潤沢に生徒に与える方針。生徒のリクエストに積極的に答え、読みたい本が図書館にない場合、リクエストカードを書いて出せば購入してもらうこともできる。常時10冊まで借りることができ、たくさん読む生徒は、月に50冊以上読む人もいる。Cinii(国立情報学研究所)の論文検索に登録しており、医学論文などをWebで取れない場合、国立国会図書館のサービスも登録してあるので、文献複写を依頼することができ、個人課題研究等で利用する生徒は多い。","校長室前廊下":"海外交流校のパネル(提携校ではなく、交流校。)や、星出さん、毛利さん、野口さんの話「宇宙飛行士が選んでくれる学校」や、模写画「岩窟の聖母」などがある。","事務室":"寮生は休日や病院に行く時などに自転車を借りることができ、寮生に送られてきた荷物は、ここで受け取ることができたり、スクールバスの定期券の更新などもしている。","高校校舎前":"美術選択者の造った石造物が並んでいる。個人課題研究で製作した作品も並べられている。","食堂":"第一、第二食堂がある。中学生は全員給食、高校生は給食か弁当かで選択することができる(寮生は全員給食)。寮生は2階の風呂を使っている。","寮門前":"監視カメラでの不審者対策をしている。","寮":"寮生は、男子は主に北棟、女子は南棟に住んでいる。東西棟は合宿と通学生の体験入寮で使われている。寮生の朝の点呼は外で行う。点呼に出てこない生徒はHMが確認をとり、病気なら保健室に連絡、看護師が受信させてくれる。入学試験の際に面接があるが、男子は自己管理がしっかりできるかどうか、女子は人間関係のトラブルを上手に解決できるかどうかを確認する。寮では自分で学習ができるかどうかが大事。国内連絡先を入寮前に確認、感染症時に迎えに来れるかどうかが確認を取る。アレルギーのひどい子、夜尿の子は入寮できない。週に一度、早朝武道がある。洗濯は自分で行う。",]
        
        
        
        
        
        
        
        
        
        
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
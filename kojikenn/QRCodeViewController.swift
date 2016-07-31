//
//  ViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/04/02.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate{
    
    
    //Array
    var PlaceSetsumeiArray = [String]()
    
    var PlaceImageArray = [String]()
    
    var index = 0
    var isQR = true
    
    var isFirst = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Arrayの中身
        PlaceSetsumeiArray = ["第一体育館の説明","第二体育館の説明","プール","ラグビー場","剣道場","柔道場","トレーナー室","中庭","屋上","相談室","保健室","購買部","セミナー室A・B","コモンスペース","１０１教室","第三美術室","第二美術室","第一美術室",]
        
        PlaceImageArray = ["第一体育館-6.JPG","第二体育館.JPG","プール.JPG","ラグビー場.JPG","剣道場.JPG","柔道場.JPG","","中庭.JPG","無線斑の電波塔.JPG","","保健室.JPG","購買部.JPG","セミナー室.JPG","","101教室.JPG","第三美術室.JPG","第二美術室.JPG","第一美術室.JPG",]
        
        
        
        //セッションの作成。
        let mySession: AVCaptureSession! = AVCaptureSession ()
        
        //デバイス一覧の取得。
        let devices = AVCaptureDevice.devices()
        
        //デバイスを格納する。
        var myDevice: AVCaptureDevice!
        
        //バックカメラをmyDeviceに格納。
        for device in devices{
            if(device.position == AVCaptureDevicePosition.Back){
                myDevice = device as! AVCaptureDevice
            }
        }
        
        //バックカメラから入力(Input)を取得。
        let myVideoInput = try! AVCaptureDeviceInput(device: myDevice)
        
        if mySession.canAddInput(myVideoInput) {
            
            //セッションに追加。
            mySession.addInput(myVideoInput)
            
        }
        
        // 出力(Output)をMeta情報に.
        let myMetadataOutput: AVCaptureMetadataOutput! = AVCaptureMetadataOutput()
        
        if mySession.canAddOutput(myMetadataOutput) {
            // セッションに追加.
            mySession.addOutput(myMetadataOutput)
            // Meta情報を取得した際のDelegateを設定.
            myMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
            // 判定するMeta情報にQRCodeを設定.
            myMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        }
        
        
        //画像を表示するレイヤーを生成。
        let myVideoLayer = AVCaptureVideoPreviewLayer(session: mySession)
        myVideoLayer.frame = self.view.bounds
        myVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        //Viewに追加
        self.view.layer.addSublayer(myVideoLayer)
        
        //セッション開始
        mySession.startRunning()
        }

    // Meta情報を検出際に呼ばれるdelegate.
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        if metadataObjects.count > 0 {
            if isFirst == true{
                let qrData: AVMetadataMachineReadableCodeObject  = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
                print("\(qrData.type)")
                print("\(qrData.stringValue)")
                
                //SafariでURLを表示（ここを変える！）
                
                
                
                //            UIApplication.sharedApplication().openURL(NSURL(string: qrData.stringValue)!)
                index = Int(qrData.stringValue)!
                
                // SubViewController へ遷移するために Segue を呼び出す
                performSegueWithIdentifier("toSyousaiQR", sender: nil)
                isFirst = false
            }
            
        }
    }
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toSyousaiQR") {
            let subVC: UITableViewSyousaiViewController = (segue.destinationViewController as? UITableViewSyousaiViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.selectedImg = UIImage(named:PlaceImageArray[index])
            
            subVC.selectedStr  = PlaceSetsumeiArray[index]
            subVC.isQR = self.isQR
        }
    }

}


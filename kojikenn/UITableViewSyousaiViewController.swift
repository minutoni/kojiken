//
//  UITableViewSyousaiViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/06/19.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit
import AVFoundation

class UITableViewSyousaiViewController: UIViewController, UITextFieldDelegate {
    
    
    
    /** 話す内容を入力するテキストフィールド */
    @IBOutlet weak var speechText: UITextView!
    /** SpeechSynthesizerクラス */
    var talker = AVSpeechSynthesizer()
    
    var isSpeaking = false
    var isQR = false
    
    
    
    
    
    
    
    @IBOutlet var TableSyousaiImageView: UIImageView!
    var selectedImg: UIImage!
    
    @IBOutlet var SetsumeiTextView: UITextView!
    var selectedTextView : UITextView!
    var selectedStr = ""
    
    
    
    //@IBOutlet var  setsumeiText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isQR {
            //let addBtn = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "twoBack")
            let addBtn = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: "twoBack")
            self.navigationItem.leftBarButtonItem = addBtn
            
            TableSyousaiImageView.userInteractionEnabled = true
            
            
            
           

        }
        
        
        
        TableSyousaiImageView.image = selectedImg
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        TableSyousaiImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        
        
        
        //SetsumeiTextView.text = selectedTextView?.text
        SetsumeiTextView.text = selectedStr

        
        
        // パン認識.
        let myPan = UIPanGestureRecognizer(target: self, action: "panGesture:")
        self.TableSyousaiImageView.addGestureRecognizer(myPan)
        
        
        // ピンチを認識.
        let myPinchGesture = UIPinchGestureRecognizer(target: self, action: "pinchGesture:")
        
        self.TableSyousaiImageView.addGestureRecognizer(myPinchGesture)
        
        

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        


    }
    
    // addBtnをタップしたときのアクション
    func twoBack() {
        navigationController?.popToViewController(navigationController!.viewControllers[1], animated: true)

    }
    
    /** ボタンが押された時の処理 */
    @IBAction func didTapButton(sender: UIButton){
        
        
        if (isSpeaking == false) {
            
            // 話す内容をセット
            let utterance = AVSpeechUtterance(string:self.speechText.text!)
            // 言語を日本に設定
            utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            // 実行
            self.talker.speakUtterance(utterance)
            
            isSpeaking = true
        }else{
            // 読み上げを途中で終了する（終了したところからまた再生したい場合は下のpauseを使う）
            talker.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
            isSpeaking = false
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        // 読み上げを途中で終了する（終了したところからまた再生したい場合は下のpauseを使う）
        talker.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
    }
    
    
    
    
    // ピンチジェスチャー
    func pinchGesture(gesture:UIPinchGestureRecognizer){
        
        let scale = gesture.scale
        TableSyousaiImageView.transform = CGAffineTransformMakeScale(scale, scale)
        
    }
    
    
    //パンジェスチャー
    func panGesture(gesture: UIPanGestureRecognizer){
        
        //移動量を取得する。
        let move:CGPoint = gesture.translationInView(view)
        
        //ドラッグした部品の座標に移動量を加算する。
        gesture.view!.center.x += move.x
        gesture.view!.center.y += move.y
        
        //ラベルに現在座標を表示する。
        //testLabel.text = "\(sender.view!.frame.origin.x), \(sender.view!.frame.origin.y)"
        
        //移動量を0にする。
        gesture.setTranslation(CGPointZero, inView:view)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  GakuensyoikaitableView.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/10/03.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit
import AVFoundation

class GakuensyoikaitableView: UIViewController {
    /** 話す内容を入力するテキストフィールド */
    @IBOutlet weak var speechText: UITextView!
    /** SpeechSynthesizerクラス */
    var talker = AVSpeechSynthesizer()
    
    var isSpeaking = false
    
    override func viewDidLoad() {
        
        // テキストを編集不可にする.
        speechText.editable = false
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}
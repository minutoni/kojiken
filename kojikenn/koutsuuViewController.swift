//
//  koutsuuViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/07/02.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit
import AVFoundation

class koutsuuViewController: UIViewController {
    
    /** 話す内容を入力するテキストフィールド */
    @IBOutlet weak var speechText: UITextView!
    /** SpeechSynthesizerクラス */
    var talker = AVSpeechSynthesizer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /** ボタンが押された時の処理 */
    @IBAction func didTapButton(sender: UIButton)
    {
        // 話す内容をセット
        let utterance = AVSpeechUtterance(string:self.speechText.text!)
        // 言語を日本に設定
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        // 実行
        self.talker.speakUtterance(utterance)
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

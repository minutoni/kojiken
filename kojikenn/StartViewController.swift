//
//  ViewController-2.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/04/03.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var blinkView: UIView!
    @IBOutlet weak var blinkView2: UIView!
    @IBOutlet weak var blinkView3: UIView!
    
    // ボタン.
    @IBOutlet var myButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TouchUpの時のイベントを追加する.
        //myButton.addTarget(self, action: "onUpButton:", forControlEvents: .TouchUpInside  )
        
        // ボタンを作成する.
        myButton = UIButton()
        myButton.layer.masksToBounds = true
        
        func onUpButton(sender: UIButton){
            UIView.animateWithDuration(0.1,
                                       
                                       // アニメーション中の処理.
                animations: { () -> Void in
                    
                    // 拡大用アフィン行列を作成する.
                    self.myButton.transform = CGAffineTransformMakeScale(0.4, 0.4)
                    
                    // 縮小用アフィン行列を作成する.
                    self.myButton.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    
                })
            { (Bool) -> Void in
                
            }
        }
        
        
        
        //点滅アニメーション
        /*UIView.animateWithDuration(1.0, delay: 0.0,
            options: UIViewAnimationOptions.Repeat, animations: { () -> Void in
                self.blinkView.alpha = 0.0
            }, completion: nil)
        
        UIView.animateWithDuration(2.0, delay: 0.0,
            options: UIViewAnimationOptions.Repeat, animations: { () -> Void in
                self.blinkView2.alpha = 0.0
            }, completion: nil)
        
        UIView.animateWithDuration(3.0, delay: 0.0,
            options: UIViewAnimationOptions.Repeat, animations: { () -> Void in
                self.blinkView3.alpha = 0.0
            }, completion: nil)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressButton(sender: AnyObject) {
        
        //点滅の停止処理
        //こっちの方法でもOK
        blinkView.layer.removeAllAnimations()
        blinkView.alpha = 1.0
        
        blinkView2.layer.removeAllAnimations()
        blinkView2.alpha = 1.0
        
        blinkView3.layer.removeAllAnimations()
        blinkView3.alpha = 1.0
    }
    */
    
}
}
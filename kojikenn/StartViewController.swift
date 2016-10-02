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
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        

        
        
        
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
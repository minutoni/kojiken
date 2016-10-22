//
//  kounaiMapPictureViewController.swift
//  kojikenn
//
//  Created by 所　紀彦 on 2016/10/03.
//  Copyright © 2016年 norihiko tokoro. All rights reserved.
//

import UIKit

class kounaiMapPictureViewController: UIViewController {

    
    @IBOutlet var kounaiImageView: UIImageView!
    var selectedkounaiImg: UIImage!
    
    private var beforePoint = CGPointMake(0.0, 0.0)
    private var currentScale:CGFloat = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kounaiImageView.image = selectedkounaiImg
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        //BusTimeImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        //BusTimePicture.image = BusTimeImageArray[index]
        
        // Do any additional setup after loading the view.
        
        
        kounaiImageView.userInteractionEnabled = true
        
        
        // パン認識.
        let myPan = UIPanGestureRecognizer(target: self, action: "panGesture:")
        self.kounaiImageView.addGestureRecognizer(myPan)
        
        
        // ピンチを認識.
        //        let myPinchGesture = UIPinchGestureRecognizer(target: self, action: "pinchGesture:")
        //
        //
        //        self.BusTimeImageView.addGestureRecognizer(myPinchGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: "handleGesture:")
        self.kounaiImageView.addGestureRecognizer(pinchGesture)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
    func handleGesture(gesture: UIGestureRecognizer){
        if let pinchGesture = gesture as? UIPinchGestureRecognizer{
            pinch(pinchGesture)
        }
    }
    
    
    // ピンチジェスチャー
    func pinchGesture(gesture:UIPinchGestureRecognizer){
        
        let scale = gesture.scale
        kounaiImageView.transform = CGAffineTransformMakeScale(scale,scale)
        
    }
    
    private func pinch(gesture:UIPinchGestureRecognizer){
        
        
        var scale = gesture.scale
        if self.currentScale > 1.0{
            scale = self.currentScale + (scale - 1.0)
        }
        switch gesture.state{
        case .Changed:
            let scaleTransform = CGAffineTransformMakeScale(scale, scale)
            let transitionTransform = CGAffineTransformMakeTranslation(self.beforePoint.x, self.beforePoint.y)
            self.kounaiImageView.transform = CGAffineTransformConcat(scaleTransform, transitionTransform)
        case .Ended , .Cancelled:
            if scale <= 1.0{
                self.currentScale = 1.0
                self.kounaiImageView.transform = CGAffineTransformIdentity
            }else{
                self.currentScale = scale
            }
        default:
            NSLog("not action")
        }
        
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

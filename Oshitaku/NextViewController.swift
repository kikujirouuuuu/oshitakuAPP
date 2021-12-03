//
//  NextViewController.swift
//  Oshitaku
//
//  Created by 福本桃果 on 2021/11/11.
//

import UIKit
import SwiftUI




class NextViewController: UIViewController {


    @IBOutlet weak var bananaImageView: UIImageView!
    
    
    @IBOutlet weak var cherryImageView: UIImageView!
    
    
    @IBOutlet weak var IceImageView: UIImageView!
    
    
    @IBOutlet weak var ninjinImageView: UIImageView!
    
    
    @IBOutlet weak var onigiriImageView: UIImageView!
    
    
    @IBOutlet weak var tomatoImageView: UIImageView!
    
    
    var startPoint: CGPoint?
    var startPoint2: CGPoint?
    

    var bananaImageNowPoint: CGPoint?
    var cherryImageNowPoint: CGPoint?
    
    var isImageInside: Bool?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bananaImageView.image = UIImage(named: "banana")
        cherryImageView.image = UIImage(named:"cherry")
        
        
        // 識別するためにtag設定
         bananaImageView.tag = 100
         cherryImageView.tag = 200
        

        // 画像のフレームを設定
        bananaImageView.frame = CGRect(x:50, y:150, width:100, height:100)
        cherryImageView.frame = CGRect(x:247, y:151, width:100, height:100)
        
        //タップを検出
        bananaImageView.isUserInteractionEnabled = true
        cherryImageView.isUserInteractionEnabled = true
         //isUserInteractionEnabledとセット？
        self.view.addSubview(bananaImageView)
        self.view.addSubview(cherryImageView)

  

    }
    
    // 画面にタッチで呼ばれる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        
        // タッチをやり始めた座標を取得
        let touch: UITouch = touches.first!

        startPoint =  touch.location(in: bananaImageView)
        startPoint2 =  touch.location(in: cherryImageView)

        //println("startPoint =\(startPoint)")
        
        // タッチをやり始めた時のイメージの座標を取得
        bananaImageNowPoint = self.bananaImageView.frame.origin
        cherryImageNowPoint = self.cherryImageView.frame.origin
        print("bananaImageNowPoint =\(String(describing: bananaImageNowPoint) )")

           
        let MinX = bananaImageNowPoint!.x
        print(MinX)
        let MaxX = bananaImageNowPoint!.x + self.bananaImageView!.frame.width
        print(MaxX)
        let MinY = bananaImageNowPoint!.y
        print(MinY)
        let MaxY = bananaImageNowPoint!.y + self.bananaImageView!.frame.height
        print(MaxY)

        let MinX2 = cherryImageNowPoint!.x
        let MaxX2 = cherryImageNowPoint!.x + self.cherryImageView!.frame.width
        let MinY2 = cherryImageNowPoint!.y
        let MaxY2 = cherryImageNowPoint!.y + self.cherryImageView!.frame.height

        print(startPoint!.x)
        print(startPoint!.y)

        //print(startPoint2!.x)
        //print(startPoint2!.y)

            
            // イメージの範囲内をタッチした時のみisImageInsideをtrueにする
            if (MinX <= (startPoint!.x+50) && (startPoint!.x+50) <= MaxX) && (MinY <= (startPoint!.y+150) && (startPoint!.y+150) <= MaxY) {
                print("Inside of  banana")
                isImageInside = true
            }
            else {
                print("Outside of banana")
                isImageInside = false
            }
// イメージの範囲内をタッチした時のみisImageInsideをtrueにする
            if (MinX <= startPoint2!.x && startPoint2!.x <= MaxX) && (MinY <= startPoint2!.y && startPoint2!.y <= MaxY) {
                print("Inside of cherry")
                isImageInside = true
                }
            else {
                print("Outside of cherry")
                isImageInside = false
                }

        
    }
     
    //　ドラッグ時に呼ばれる
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isImageInside! {
             // タッチ中の座標を取得
            let touch: UITouch = touches.first!
            let location: CGPoint = touch.location(in: self.view)
             print("タッチ")
             print("location =\(location)")
             
             // 移動量を計算
             let deltaX: CGFloat = CGFloat((location.x) - (startPoint!.x+50))
             let deltaY: CGFloat = CGFloat((location.y) - (startPoint!.y+150))
            
             print("deltaX: \(deltaX), deltaY: \(deltaY)")
            
            let deltaX2: CGFloat = CGFloat(location.x - startPoint2!.x)
            let deltaY2: CGFloat = CGFloat(location.y - startPoint2!.y)
             
             // イメージを移動
             self.bananaImageView.frame.origin.x = bananaImageNowPoint!.x + deltaX
             self.bananaImageView.frame.origin.y = bananaImageNowPoint!.y + deltaY
            
             self.cherryImageView.frame.origin.x = cherryImageNowPoint!.x + deltaX
             self.cherryImageView.frame.origin.y = cherryImageNowPoint!.y + deltaY
            }
        else {
             // Do nothing
            }
        
    }
     
    // ドラッグ終了
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
      
    
    
}


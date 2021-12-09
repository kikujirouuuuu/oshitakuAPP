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
    
    var isImageInsidebanana: Bool?
    var isImageInsidecherry: Bool?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bananaImageView.image = UIImage(named: "banana")
        cherryImageView.image = UIImage(named:"cherry")
        
        
        // 識別するためにtag設定
         bananaImageView.tag = 100
         cherryImageView.tag = 200
        

        // 画像のフレームを設定
        bananaImageView.frame = CGRect(x:50, y:150, width:100, height:100)
        cherryImageView.frame = CGRect(x:250, y:150, width:100, height:100)
        
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
        
        // タッチをやり始めた座標を取得→全ての画像に効く？？
        let touch: UITouch = touches.first!

        startPoint =  touch.location(in: bananaImageView)
        startPoint2 =  touch.location(in: cherryImageView)

        //println("startPoint =\(startPoint)")
        
        // タッチをやり始めた時のイメージの座標を取得
        bananaImageNowPoint = self.bananaImageView.frame.origin
        cherryImageNowPoint = self.cherryImageView.frame.origin
        print("bananaImageNowPoint =\(String(describing: bananaImageNowPoint) )")
        print("cherryImageNowPoint =\(String(describing: cherryImageNowPoint) )")

           
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

        print(startPoint2!.x)
        print(startPoint2!.y)

            
            // イメージの範囲内をタッチした時のみisImageInsideをtrueにする
            if (MinX <= (startPoint!.x+50) && (startPoint!.x+50) <= MaxX) && (MinY <= (startPoint!.y+150) && (startPoint!.y+150) <= MaxY) {
                print("Inside of  banana")
                isImageInsidebanana = true
            }
           
        // イメージの範囲内をタッチした時のみisImageInsideをtrueにする
            else if (MinX <= (startPoint2!.x+250) && (startPoint2!.x+250) <= MaxX) && (MinY <= (startPoint2!.y+150) && (startPoint2!.y+150) <= MaxY) {
                print("Inside of cherry")
                isImageInsidecherry = true
                }
        
        
            else {
                print("Outside of banana")
                isImageInsidebanana = false
                
                print("Outside of cherry")
                isImageInsidecherry = false
                }

        
    }
     
    //　ドラッグ時に呼ばれる
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isImageInsidebanana == true {
             // タッチ中の座標を取得
            let touch: UITouch = touches.first!
            let location: CGPoint = touch.location(in: self.view)
             print("bananaタッチ")
             print("location =\(location)")
             
             // 移動量を計算
            let deltaX: CGFloat = CGFloat((location.x) - (startPoint!.x+50))
            let deltaY: CGFloat = CGFloat((location.y) - (startPoint!.y+150))
            
             print("deltaX: \(deltaX), deltaY: \(deltaY)")
            
             // イメージを移動
             self.bananaImageView.frame.origin.x = bananaImageNowPoint!.x + deltaX
             self.bananaImageView.frame.origin.y = bananaImageNowPoint!.y + deltaY

            }
        
         else if isImageInsidecherry == true {
             // タッチ中の座標を取得
            let touch: UITouch = touches.first!
            let location: CGPoint = touch.location(in: self.view)
             print("cherryタッチ")
             print("location =\(location)")
             
             // 移動量を計算
            
             let deltaX2: CGFloat = CGFloat((location.x) - (startPoint2!.x+250))
             let deltaY2: CGFloat = CGFloat((location.y) - (startPoint2!.y+150))
             
             // イメージを移動
            
             self.cherryImageView.frame.origin.x = cherryImageNowPoint!.x + deltaX2
             self.cherryImageView.frame.origin.y = cherryImageNowPoint!.y + deltaY2
            }
        
        else {
             // Do nothing
            }
        
    }
     
    // ドラッグ終了
    //https://teratail.com/questions/255947?link=qa_related_pc
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
        print("width: ", scrWidth)
        print("height: ", scrHeight)
        print("center.x: ", coin.center.x)
        print("center.y: ", coin.center.y)

        if coin.center.x > scrWidth {
        coin.removeFromSuperview()
        coinCount = coinCount - 1
        } else if 0 >= coin.center.x {
        coin.removeFromSuperview()
        coinCount = coinCount - 1
        }

        if coin.center.y > scrHeight {
        coin.removeFromSuperview()
        coinCount = coinCount - 1
        } else if 0 >= coin.center.y {
        coin.removeFromSuperview()
        coinCount = coinCount - 1
        }*/
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
      
    
    
}


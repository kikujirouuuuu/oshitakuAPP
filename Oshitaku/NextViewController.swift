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
    
    var bananaLastlocation : CGPoint?
    var cherryLastlocaction : CGPoint?
    
    
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
        
        bananaLastlocation = touch.location(in: bananaImageView)
        cherryLastlocaction = touch.location(in: cherryImageView)
        
        //println("startPoint =\(startPoint)")
        
        // タッチをやり始めた時のイメージの座標を取得
        bananaImageNowPoint = self.bananaImageView.frame.origin
        cherryImageNowPoint = self.cherryImageView.frame.origin
        print("bananaImageNowPoint =\(String(describing: bananaImageNowPoint) )")
        print("cherryImageNowPoint =\(String(describing: cherryImageNowPoint) )")
        
     
        
        
        //bananaの範囲
        let MinX = bananaImageNowPoint!.x
        print(MinX)
        let MaxX = bananaImageNowPoint!.x + self.bananaImageView!.frame.width
        print(MaxX)
        let MinY = bananaImageNowPoint!.y
        print(MinY)
        let MaxY = bananaImageNowPoint!.y + self.bananaImageView!.frame.height
        print(MaxY)
        
        let  baMinX = bananaLastlocation!.x
        print(baMinX)
        let baMaxX = bananaLastlocation!.x + self.bananaImageView!.frame.width
        print(baMaxX)
        let baMinY = bananaLastlocation!.y
        print(baMinY)
        let baMaxY = bananaLastlocation!.y + self.bananaImageView!.frame.height
        print(baMaxY)
        
      
        
        //cherrry
        let MinX2 = cherryImageNowPoint!.x
        let MaxX2 = cherryImageNowPoint!.x + self.cherryImageView!.frame.width
        let MinY2 = cherryImageNowPoint!.y
        let MaxY2 = cherryImageNowPoint!.y + self.cherryImageView!.frame.height
        
        let chMinX2 = cherryLastlocaction!.x
        let chMaxX2 = cherryLastlocaction!.x + self.cherryImageView!.frame.width
        let chMinY2 = cherryLastlocaction!.y
        let chMaxY2 = cherryLastlocaction!.y + self.cherryImageView!.frame.height

        print("startPont=\(startPoint!.x)")
        print("startPont=\(startPoint!.y)")
        
        
        if bananaLastlocation != nil{
            print("bananaLastLocation =\(bananaLastlocation!.x)")
            print("bananaLastLocation =\(bananaLastlocation!.y)")
            
            
        }
        
        if cherryLastlocaction != nil{
            print("cherryLastLocation =\(cherryLastlocaction!.x)")
            print("cherryLastLocation =\(cherryLastlocaction!.y)")
            
        }
        
        
        //  bananaイメージの範囲内をタッチした時のみisImageInsideをtrueにする
        if  ( (MinX <= (startPoint!.x+50) && (startPoint!.x+50) <= MaxX) && (MinY <= (startPoint!.y+150) && (startPoint!.y+150) <= MaxY) || (baMinX <= (startPoint!.x+50) && (startPoint!.x+50) <= baMaxX) && (baMinY <= (startPoint!.y+150) && (startPoint!.y+150) <= baMaxY)  )
    
                {
                print("Inside of  banana")
                    isImageInsidebanana = true
                    isImageInsidecherry = false
            
                }
       
        // cherryイメージの範囲内をタッチした時のみisImageInsideをtrueにする
        else if ((MinX2 <= (startPoint2!.x+250) && (startPoint2!.x+250) <= MaxX2) && (MinY2 <= (startPoint2!.y+150) && (startPoint2!.y+150) <= MaxY2) || (chMinX2 <= (startPoint2!.x+250) && (startPoint2!.x+250) <= chMaxX2) && (chMinY2 <= (startPoint2!.y+150) && (startPoint2!.y+150) <= chMaxY2) ){
                    print("Inside of cherry")
                    isImageInsidecherry = true
                    isImageInsidebanana = false
            
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
            
            
            //再度タッチした位置の座標
            bananaLastlocation!.x = bananaImageNowPoint!.x + deltaX
            bananaLastlocation!.y = bananaImageNowPoint!.y + deltaY
            
           
            

            

            }
        
         else if isImageInsidecherry == true {
             
             // タッチ中の座標を取得
            let touch: UITouch = touches.first!
            let location2: CGPoint = touch.location(in: self.view)
             print("cherryタッチ")
             print("location2 =\(location2)")
             
             // 移動量を計算
            
             let deltaX2: CGFloat = CGFloat((location2.x) - (startPoint2!.x+250))
             let deltaY2: CGFloat = CGFloat((location2.y) - (startPoint2!.y+150))
             
             // イメージを移動
            
             self.cherryImageView.frame.origin.x = cherryImageNowPoint!.x + deltaX2
             self.cherryImageView.frame.origin.y = cherryImageNowPoint!.y + deltaY2
             
             
             cherryLastlocaction!.x = cherryImageNowPoint!.x + deltaX2
             cherryLastlocaction!.y = cherryImageNowPoint!.y + deltaY2
             
            }
        
        else {
             // Do nothing
            }
        
    }
     
    // ドラッグ終了
    //https://teratail.com/questions/255947?link=qa_related_pc
    //https://teratail.com/questions/32977
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
      
    
    
}


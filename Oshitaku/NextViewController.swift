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
    
    @IBOutlet weak var mouth: UIImageView!
    
    var startPoint: CGPoint?
    var startPoint2: CGPoint?
    

    var bananaImageNowPoint: CGPoint?
    var cherryImageNowPoint: CGPoint?
      
    
    var isImageInsidebanana: Bool?
    var isImageInsidecherry: Bool?
    
    var isImageInsidebananaSecond: Bool?
    var isImageInsidecherrySecond: Bool?
    
    var bananaLastlocation : CGPoint?
    var cherryLastlocaction : CGPoint?
    
    var deltaX : CGFloat?
    var deltaY : CGFloat?
    
    var deltaX2 : CGFloat?
    var deltaY2 : CGFloat?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bananaImageView.image = UIImage(named: "banana")
        cherryImageView.image = UIImage(named:"cherry")
        
        mouth.image = UIImage(named: "mouth")
        
        

        // 画像のフレームを設定
        bananaImageView.frame = CGRect(x:50, y:150, width:100, height:100)
        cherryImageView.frame = CGRect(x:250, y:150, width:100, height:100)
        
        mouth.frame = CGRect(x: 99, y: 610, width: 240, height: 128)
        
        
        
        
        
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

        startPoint =  touch.location(in: self.view)//最初にタッチした位置・タッチ再開した位置
      
        
        print("startPont.x=\(startPoint!.x)")
        print("startPont.y=\(startPoint!.y)")        //println("startPoint =\(startPoint)")
        
        // タッチをやり始めた時のイメージの座標を取得
        bananaImageNowPoint = self.bananaImageView.frame.origin
        cherryImageNowPoint = self.cherryImageView.frame.origin
        print("bananaImageNowPoint =\(String(describing: bananaImageNowPoint) )")
        print("cherryImageNowPoint =\(String(describing: cherryImageNowPoint) )")
        
     
        
        
        //bananaの最初の範囲
        let MinX = bananaImageNowPoint!.x
        print("MinX =\(MinX)")
        let MaxX = bananaImageNowPoint!.x + self.bananaImageView!.frame.width
        print("MaxX =\(MaxX)")
        let MinY = bananaImageNowPoint!.y
        print("MinY =\(MinY)")
        let MaxY = bananaImageNowPoint!.y + self.bananaImageView!.frame.height
        print("MaxY =\(MaxY)")
        
        
        //cherrry
        let MinX2 = cherryImageNowPoint!.x
        let MaxX2 = cherryImageNowPoint!.x + self.cherryImageView!.frame.width
        let MinY2 = cherryImageNowPoint!.y
        let MaxY2 = cherryImageNowPoint!.y + self.cherryImageView!.frame.height
        
        //  bananaイメージの範囲内をタッチした時のみisImageInsideをtrueにする
            if  ( (MinX <= (startPoint!.x) && (startPoint!.x) <= MaxX) )
                   && ( (MinY <= (startPoint!.y) && (startPoint!.y) <= MaxY) ) {
                print("Inside of  banana")
                    isImageInsidebanana = true
                    isImageInsidecherry = false
                
                print("deltaX: \(String(describing: deltaX))")
                print("deltaY: \(String(describing: deltaY))")
            }
           
        
        // cherryイメージの範囲内をタッチした時のみisImageInsideをtrueにする
            else if ((MinX2 <= (startPoint!.x) && (startPoint!.x) <= MaxX2) && (MinY2 <= (startPoint!.y) && (startPoint!.y) <= MaxY2)){
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
            deltaX = location.x - (startPoint!.x)
            deltaY = location.y - (startPoint!.y)
            
             print("deltaX: \(deltaX), deltaY: \(deltaY)")
            
             // イメージを移動
            self.bananaImageView.frame.origin.x = bananaImageNowPoint!.x + deltaX!
            self.bananaImageView.frame.origin.y = bananaImageNowPoint!.y + deltaY!
     
             
  
            }
        

        
        
        
         else if isImageInsidecherry == true {
             
             // タッチ中の座標を取得
            let touch: UITouch = touches.first!
            let location2: CGPoint = touch.location(in: self.view)
             print("cherryタッチ")
             print("location2 =\(location2)")
             
             // 移動量を計算
            
             deltaX2 = location2.x - (startPoint!.x)
             deltaY2 = location2.y - (startPoint!.y)
             
             // イメージを移動
            
             self.cherryImageView.frame.origin.x = cherryImageNowPoint!.x + deltaX2!
             self.cherryImageView.frame.origin.y = cherryImageNowPoint!.y + deltaY2!
             
 
             
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


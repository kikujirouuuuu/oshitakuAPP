//
//  NextViewController.swift
//  Oshitaku
//
//  Created by 福本桃果 on 2021/11/11.
//

import UIKit
import SwiftUI
import CoreMotion




class NextViewController: UIViewController {


    @IBOutlet weak var bananaImageView: UIImageView!
    
    
    @IBOutlet weak var cherryImageView: UIImageView!
    
    
    @IBOutlet weak var IceImageView: UIImageView!
    
    
    @IBOutlet weak var ninjinImageView: UIImageView!
    
    
    @IBOutlet weak var onigiriImageView: UIImageView!
    
    
    @IBOutlet weak var tomatoImageView: UIImageView!
    
    @IBOutlet weak var mouth: UIImageView!
    
    var startPoint: CGPoint?
    

    var bananaImageNowPoint: CGPoint?
    var cherryImageNowPoint: CGPoint?
    var IceImageNowPoint: CGPoint?
    var ninjinImageNowPoint: CGPoint?
    var onigiriImageNowPoint: CGPoint?
    var tomatoImageImageNowPoint: CGPoint?
    
    var mouthPoint: CGPoint?
      
    
    var isImageInsidebanana: Bool?
    var isImageInsidecherry: Bool?
    var isImageInsibeIce: Bool?
    var isImageInsideninjin: Bool?
    var isImageInsideonigiri: Bool?
    var isImageInsidetomato: Bool?
    
    
    var location : CGPoint?//banana
    
    
    var deltaX : CGFloat?
    var deltaY : CGFloat?
    
    var deltaX2 : CGFloat?
    var deltaY2 : CGFloat?

    var deltaX3 : CGFloat?
    var deltaY3 : CGFloat?
    
    var deltaX4 : CGFloat?
    var deltaY4 : CGFloat?
    
    var deltaX5 : CGFloat?
    var deltaY5 : CGFloat?
    
    var deltaX6 : CGFloat?
    var deltaY6 : CGFloat?
    
    var removeRect: CGRect!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // bananaImageView.image = UIImage(named: "banana")
       // cherryImageView.image = UIImage(named:"cherry")
        
       // mouth.image = UIImage(named: "mouth")
        
        

        // 画像のフレームを設定
        bananaImageView.frame = CGRect(x:50, y:150, width:100, height:100)
        cherryImageView.frame = CGRect(x:250, y:150, width:100, height:100)
        IceImageView.frame = CGRect(x:50, y:300, width:100, height:100)
        ninjinImageView.frame = CGRect(x:50, y: 450, width:100, height:100)
        onigiriImageView.frame = CGRect(x:250, y:300, width:100, height:100)
        tomatoImageView.frame = CGRect(x:250, y: 450, width:100, height:100)
        
        
        mouth.frame = CGRect(x: 99, y: 610, width: 240, height: 128)
        
        
        
        
        
        //タップを検出
        bananaImageView.isUserInteractionEnabled = true
        cherryImageView.isUserInteractionEnabled = true
        IceImageView.isUserInteractionEnabled = true
        ninjinImageView.isUserInteractionEnabled = true
        onigiriImageView.isUserInteractionEnabled = true
        tomatoImageView.isUserInteractionEnabled = true
        
        
         //isUserInteractionEnabledとセット？
        self.view.addSubview(bananaImageView)
        self.view.addSubview(cherryImageView)
        self.view.addSubview(IceImageView)
        self.view.addSubview(ninjinImageView)
        self.view.addSubview(onigiriImageView)
        self.view.addSubview(tomatoImageView)
  

    }
    
    // 画面にタッチで呼ばれる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        
        // タッチをやり始めた座標を取得→全ての画像に効く？？
        let touch: UITouch = touches.first!

        startPoint =  touch.location(in: self.view)//最初にタッチした位置・タッチ再開した位置→全ての画像にきく
      
        
        print("startPont.x=\(startPoint!.x)")
        print("startPont.y=\(startPoint!.y)")        //println("startPoint =\(startPoint)")
        
        
    
            if bananaImageView != nil{
                // タッチをやり始めた時のイメージの座標を取得
                bananaImageNowPoint = self.bananaImageView.frame.origin
                print("bananaImageNowPoint =\(String(describing: bananaImageNowPoint) )")
                
                //bananaの範囲
                let MinX = bananaImageNowPoint!.x
                print("MinX =\(MinX)")
                let MaxX = bananaImageNowPoint!.x + self.bananaImageView!.frame.width
                print("MaxX =\(MaxX)")
                let MinY = bananaImageNowPoint!.y
                print("MinY =\(MinY)")
                let MaxY = bananaImageNowPoint!.y + self.bananaImageView!.frame.height
                print("MaxY =\(MaxY)")
                
                //  bananaイメージの範囲内をタッチした時のみisImageInsideをtrueにする
                    if  ( (MinX <= (startPoint!.x) && (startPoint!.x) <= MaxX) )
                           && ( (MinY <= (startPoint!.y) && (startPoint!.y) <= MaxY) ) {
                        print("Inside of  banana")
                            isImageInsidebanana = true
                            isImageInsidecherry = false
                            isImageInsibeIce = false
                            isImageInsideninjin = false
                            isImageInsideonigiri = false
                            isImageInsidetomato = false
                            
                        
                        print("deltaX: \(String(describing: deltaX))")
                        print("deltaY: \(String(describing: deltaY))")
                    }
                
            }
            if cherryImageView != nil{
                cherryImageNowPoint = self.cherryImageView.frame.origin
                print("cherryImageNowPoint =\(String(describing: cherryImageNowPoint) )")
                
                //cherrryの範囲
                let MinX2 = cherryImageNowPoint!.x
                let MaxX2 = cherryImageNowPoint!.x + self.cherryImageView!.frame.width
                let MinY2 = cherryImageNowPoint!.y
                let MaxY2 = cherryImageNowPoint!.y + self.cherryImageView!.frame.height
                
                // cherryイメージの範囲内をタッチした時のみisImageInsideをtrueにする
                    if ((MinX2 <= (startPoint!.x) && (startPoint!.x) <= MaxX2) && (MinY2 <= (startPoint!.y) && (startPoint!.y) <= MaxY2)){
                           // print("Inside of cherry")
                            isImageInsidecherry = true
                            isImageInsidebanana = false
                            isImageInsibeIce = false
                            isImageInsideninjin = false
                            isImageInsideonigiri = false
                            isImageInsidetomato = false
                    
                        }
                    
            }
        
            if IceImageView != nil{
                IceImageNowPoint = self.IceImageView.frame.origin
                
                //iceの範囲
                let MinX3 = IceImageNowPoint!.x
                let MaxX3 = IceImageNowPoint!.x + self.IceImageView!.frame.width
                let MinY3 = IceImageNowPoint!.y
                let MaxY3 = IceImageNowPoint!.y + self.IceImageView!.frame.height
                
                if((MinX3 <= (startPoint!.x) && (startPoint!.x) <= MaxX3) && (MinY3 <= (startPoint!.y) && (startPoint!.y) <= MaxY3)){
                    // print("Inside of ice")
                    isImageInsibeIce = true
                    isImageInsidebanana = false
                    isImageInsidecherry = false
                    isImageInsideninjin = false
                    isImageInsideonigiri = false
                    isImageInsidetomato = false
                }
                
            }
            
            
            if ninjinImageView != nil {
                ninjinImageNowPoint = self.ninjinImageView.frame.origin
                
                //ninjinの範囲
                let MinX4 = ninjinImageNowPoint!.x
                let MaxX4 = ninjinImageNowPoint!.x + self.ninjinImageView!.frame.width
                let MinY4 = ninjinImageNowPoint!.y
                let MaxY4 = ninjinImageNowPoint!.y + self.ninjinImageView!.frame.height
                
                if((MinX4 <= (startPoint!.x) && (startPoint!.x) <= MaxX4) && (MinY4 <= (startPoint!.y) && (startPoint!.y) <= MaxY4)){
                    print("Inside of ninjin")
                    isImageInsideninjin = true
                    isImageInsibeIce = false
                    isImageInsidebanana = false
                    isImageInsidecherry = false
                    isImageInsideonigiri = false
                    isImageInsidetomato = false
                }
            }
            
        
            if onigiriImageView != nil {
                    onigiriImageNowPoint = self.onigiriImageView.frame.origin
                    
                    let MinX5 = onigiriImageNowPoint!.x
                    let MaxX5 = onigiriImageNowPoint!.x + self.onigiriImageView!.frame.width
                    let MinY5 = onigiriImageNowPoint!.y
                    let MaxY5 = onigiriImageNowPoint!.y + self.onigiriImageView!.frame.height
                    
                    if((MinX5 <= (startPoint!.x) && (startPoint!.x) <= MaxX5) && (MinY5 <= (startPoint!.y) && (startPoint!.y) <= MaxY5)){
                        print("Inside of onigiri")
                        isImageInsideonigiri = true
                        isImageInsideninjin = false
                        isImageInsibeIce = false
                        isImageInsidebanana = false
                        isImageInsidecherry = false
                        isImageInsidetomato = false
                    }
                
                }
            if tomatoImageView != nil {
                tomatoImageImageNowPoint = self.tomatoImageView.frame.origin
                
                let MinX6 = tomatoImageImageNowPoint!.x
                let MaxX6 = tomatoImageImageNowPoint!.x + self.tomatoImageView!.frame.width
                let MinY6 = tomatoImageImageNowPoint!.y
                let MaxY6 = tomatoImageImageNowPoint!.y + self.tomatoImageView!.frame.height
                
                if((MinX6 <= (startPoint!.x) && (startPoint!.x) <= MaxX6) && (MinY6 <= (startPoint!.y) && (startPoint!.y) <= MaxY6)){
                    print("Inside of tomato")
                    isImageInsidetomato = true
                    isImageInsideonigiri = false
                    isImageInsideninjin = false
                    isImageInsibeIce = false
                    isImageInsidebanana = false
                    isImageInsidecherry = false
                }
            }
            
        
        
        /*
        // タッチをやり始めた時のイメージの座標を取得
        bananaImageNowPoint = self.bananaImageView.frame.origin
        cherryImageNowPoint = self.cherryImageView.frame.origin
        IceImageNowPoint = self.IceImageView.frame.origin
        ninjinImageNowPoint = self.ninjinImageView.frame.origin
        
        //print("bananaImageNowPoint =\(String(describing: bananaImageNowPoint) )")
        print("cherryImageNowPoint =\(String(describing: cherryImageNowPoint) )")
        
     
        /*//bananaの範囲
        let MinX = bananaImageNowPoint!.x
        print("MinX =\(MinX)")
        let MaxX = bananaImageNowPoint!.x + self.bananaImageView!.frame.width
        print("MaxX =\(MaxX)")
        let MinY = bananaImageNowPoint!.y
        print("MinY =\(MinY)")
        let MaxY = bananaImageNowPoint!.y + self.bananaImageView!.frame.height
        print("MaxY =\(MaxY)")*/
        
        
        //cherrryの範囲
        let MinX2 = cherryImageNowPoint!.x
        let MaxX2 = cherryImageNowPoint!.x + self.cherryImageView!.frame.width
        let MinY2 = cherryImageNowPoint!.y
        let MaxY2 = cherryImageNowPoint!.y + self.cherryImageView!.frame.height
        
        //iceの範囲
        let MinX3 = IceImageNowPoint!.x
        let MaxX3 = IceImageNowPoint!.x + self.IceImageView!.frame.width
        let MinY3 = IceImageNowPoint!.y
        let MaxY3 = IceImageNowPoint!.y + self.IceImageView!.frame.height
        
        //ninjinの範囲
        let MinX4 = ninjinImageNowPoint!.x
        let MaxX4 = ninjinImageNowPoint!.x + self.ninjinImageView!.frame.width
        let MinY4 = ninjinImageNowPoint!.y
        let MaxY4 = ninjinImageNowPoint!.y + self.ninjinImageView!.frame.height
        
        
        /*//  bananaイメージの範囲内をタッチした時のみisImageInsideをtrueにする
            if  ( (MinX <= (startPoint!.x) && (startPoint!.x) <= MaxX) )
                   && ( (MinY <= (startPoint!.y) && (startPoint!.y) <= MaxY) ) {
                print("Inside of  banana")
                    isImageInsidebanana = true
                    isImageInsidecherry = false
                    isImageInsibeIce = false
                    isImageInsideninjin = false
                
                print("deltaX: \(String(describing: deltaX))")
                print("deltaY: \(String(describing: deltaY))")
            }
           */
        
        // cherryイメージの範囲内をタッチした時のみisImageInsideをtrueにする
            if ((MinX2 <= (startPoint!.x) && (startPoint!.x) <= MaxX2) && (MinY2 <= (startPoint!.y) && (startPoint!.y) <= MaxY2)){
                   // print("Inside of cherry")
                    isImageInsidecherry = true
                    isImageInsidebanana = false
                    isImageInsibeIce = false
                    isImageInsideninjin = false
            
                }
        
            else if((MinX3 <= (startPoint!.x) && (startPoint!.x) <= MaxX3) && (MinY3 <= (startPoint!.y) && (startPoint!.y) <= MaxY3)){
                // print("Inside of ice")
                isImageInsibeIce = true
                isImageInsidebanana = false
                isImageInsidecherry = false
                isImageInsideninjin = false
            }
                
            else if((MinX4 <= (startPoint!.x) && (startPoint!.x) <= MaxX4) && (MinY4 <= (startPoint!.y) && (startPoint!.y) <= MaxY4)){
                print("Inside of ninjin")
                isImageInsideninjin = true
                isImageInsibeIce = false
                isImageInsidebanana = false
                isImageInsidecherry = false
            }*/

    
    
            else {
                
              //  print("Outside of banana")
                    isImageInsidebanana = false
            
              //  print("Outside of cherry")
                    isImageInsidecherry = false
                
               // print("Outside of Ice")
                    isImageInsibeIce = false
                
               // print("Outside of ninjin")
                    isImageInsideninjin = false
                
                    isImageInsideonigiri = false
                
                    isImageInsidetomato = false
                
                
                }
        
        
        
        
    }
     
    //　ドラッグ時に呼ばれる
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
        if isImageInsidebanana == true {
             // タッチ中の座標を取得
            let touch: UITouch = touches.first!
            location = touch.location(in: self.view)
            
             print("bananaタッチ")
             print("location =\(location)")
             
             // 移動量を計算
            deltaX = location!.x - (startPoint!.x)
            deltaY = location!.y - (startPoint!.y)
            
             print("deltaX: \(deltaX), deltaY: \(deltaY)")
            
             // イメージを移動
            self.bananaImageView.frame.origin.x = bananaImageNowPoint!.x + deltaX!
            self.bananaImageView.frame.origin.y = bananaImageNowPoint!.y + deltaY!
            
  
            }
        

        
         if isImageInsidecherry == true {
             
             // タッチ中の座標を取得
            let touch: UITouch = touches.first!
            let location2: CGPoint = touch.location(in: self.view)
            
            // print("cherryタッチ")
            // print("location2 =\(location2)")
             
             // 移動量を計算
            
             deltaX2 = location2.x - (startPoint!.x)
             deltaY2 = location2.y - (startPoint!.y)
             
             // イメージを移動
            
             self.cherryImageView.frame.origin.x = cherryImageNowPoint!.x + deltaX2!
             self.cherryImageView.frame.origin.y = cherryImageNowPoint!.y + deltaY2!
             
 
             
            }
        
        
        if isImageInsibeIce == true {
            
            // タッチ中の座標を取得
           let touch: UITouch = touches.first!
           let location3 = touch.location(in: self.view)
            print("iceタッチ")
            print("location3 =\(location3)")
            
            // 移動量を計算
           
            deltaX3 = location3.x - (startPoint!.x)
            deltaY3 = location3.y - (startPoint!.y)
            
            // イメージを移動
           
            self.IceImageView.frame.origin.x = IceImageNowPoint!.x + deltaX3!
            self.IceImageView.frame.origin.y = IceImageNowPoint!.y + deltaY3!
            

            
           }
        
        
        
        if isImageInsideninjin == true {
            
            // タッチ中の座標を取得
           let touch: UITouch = touches.first!
           let location4: CGPoint = touch.location(in: self.view)
            print("ninjinタッチ")
            print("location4 =\(location4)")
            
            // 移動量を計算
           
            deltaX4 = location4.x - (startPoint!.x)
            deltaY4 = location4.y - (startPoint!.y)
            
            // イメージを移動
           
            self.ninjinImageView.frame.origin.x = ninjinImageNowPoint!.x + deltaX4!
            self.ninjinImageView.frame.origin.y = ninjinImageNowPoint!.y + deltaY4!
            

            
           }
        
        if isImageInsideonigiri == true {
            
            // タッチ中の座標を取得
           let touch: UITouch = touches.first!
           let location5: CGPoint = touch.location(in: self.view)
            print("onigiriタッチ")
            print("location5 =\(location5)")
            
            // 移動量を計算
           
            deltaX5 = location5.x - (startPoint!.x)
            deltaY5 = location5.y - (startPoint!.y)
            
            // イメージを移動
           
            self.onigiriImageView.frame.origin.x = onigiriImageNowPoint!.x + deltaX5!
            self.onigiriImageView.frame.origin.y = onigiriImageNowPoint!.y + deltaY5!
            
           }
        
        
        if isImageInsidetomato == true {
            
            // タッチ中の座標を取得
           let touch: UITouch = touches.first!
           let location6: CGPoint = touch.location(in: self.view)
            print("onigiriタッチ")
            print("location6 =\(location6)")
            
            // 移動量を計算
           
            deltaX6 = location6.x - (startPoint!.x)
            deltaY6 = location6.y - (startPoint!.y)
            
            // イメージを移動
           
            self.tomatoImageView.frame.origin.x = tomatoImageImageNowPoint!.x + deltaX6!
            self.tomatoImageView.frame.origin.y = tomatoImageImageNowPoint!.y + deltaY6!
            
           }
        
        
        
        else {
             // Do nothing
            }
        
    }
     
    // ドラッグ終了
    //https://teratail.com/questions/255947?link=qa_related_pc
    //https://teratail.com/questions/32977
    //https://teratail.com/questions/254193
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //パターン１　mouthと各々の画像が重なったら消える。初回のみ成功
        
        mouthPoint = self.mouth.frame.origin
        
        let mouthMinX = mouthPoint!.x
        let mouthMaxX = mouthPoint!.x + self.mouth!.frame.width
        let mouthMinY = mouthPoint!.y
        let mouthMaxY = mouthPoint!.y + self.mouth!.frame.height
        
        // パターン1 if bananaがmouthと重なった場合、imageが消える。
        if ((location != nil) && ((mouthMinX <= (location!.x) && (location!.x) <= mouthMaxX) && (mouthMinY <= (location!.y) && (location!.y) <= mouthMaxY))) {
                // 消したいFrameと重なっている場合
            if bananaImageView != nil{
                bananaImageView.removeFromSuperview()}
            else if cherryImageView != nil{
                cherryImageView.removeFromSuperview()
            }
            
            else if IceImageView != nil{
                IceImageView.removeFromSuperview()
            }
            else if ninjinImageView != nil{
                ninjinImageView.removeFromSuperview()
            }
            
            else if onigiriImageView != nil{
                onigiriImageView.removeFromSuperview()
            }
            
            else if tomatoImageView != nil{
                tomatoImageView.removeFromSuperview()
            }
            
            else{}
            
            }
        /*パターン２　消したいフレームと重なると消える。
        if let rect = removeRect where CGRectIntersectsRect() {
                  // 消したいFrameと重なっている場合
                  bananaImageView.removeFromSuperview()
              }*/
        
         
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
      
    
    
}


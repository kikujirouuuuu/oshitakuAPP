//
//  NameViewController.swift
//  Oshitaku
//
//  Created by 福本桃果 on 2022/03/01.
//

import UIKit
import SwiftUI

class NameViewController: UIViewController,UITextFieldDelegate {
//textFild
    @IBOutlet weak var name1: UITextField!
    
    @IBOutlet weak var name2: UITextField!
    
    
    @IBOutlet weak var name3: UITextField!
    
    
    @IBOutlet weak var name4: UITextField!
    
    
    @IBOutlet weak var name5: UITextField!
    
   //配列List
    var nameList = ["ゲスト","わたし",]
    
    //
    let userDefaults = UserDefaults.standard
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //nameTextFeildのデリゲートを ViewController が受け取る
        name1.delegate = self
        name2.delegate = self
        name3.delegate = self
        name4.delegate = self
        name5.delegate = self
        
        print(nameList)
        //if let 定数名 = 値を取り出すコード { }
        //userというキーを指定して保存していた値を取り出す
        if let value1 = userDefaults.string(forKey: "user"){
            //取り出した値をテキストフィールドに設定
            name1.text = value1
        }
        if (UserDefaults.standard.array(forKey: "user") != nil){
            //nilじゃない場合nameListに追加された値の取得？？
            nameList = UserDefaults.standard.array(forKey: "user")as![String]
            print(nameList)
        }
       
    }

    @IBAction func saveButton(_ sender: Any) {
        //ボタン押したらほぞん
        UserDefaults.standard.set(name1, forKey: "user")
        //取得したユーザー名の追加
        nameList.append(name1.text!)
        //UserDefaultsへの値の保存を明示的に行う→いらない？？？？
        userDefaults.synchronize()
        print("SAVE")
        print(nameList)
        
    }
    
    func textFieldShouldReturn(_: UITextField)->Bool
    {
        // キーボードを閉じる
        name1.resignFirstResponder()
     
        
        
        return true
    }
}

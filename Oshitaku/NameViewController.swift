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
    
    //userDefaultsの定義
    let userDefaults = UserDefaults.standard
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
        //nameTextFeildのデリゲートを ViewController が受け取る
        name1.delegate = self
        name2.delegate = self
        name3.delegate = self
        name4.delegate = self
        name5.delegate = self
        
        print(name1.text)
        //if let 定数名 = 値を取り出すコード { }
        //userというキーを指定して保存していた値を取り出す
        if let value1 = userDefaults.string(forKey: "user1"){
            //取り出した値をテキストフィールドに設定
            name1.text = value1
        }
        if let value2 = userDefaults.string(forKey: "user2"){
            name2.text = value2
        }
        if let value3 = userDefaults.string(forKey: "user3"){
            name3.text = value3
        }
        if let value4 = userDefaults.string(forKey: "user4"){
            name4.text = value4
        }
        if let value5 = userDefaults.string(forKey: "user5"){
            name5.text = value5
        }
     
        
        
        /*if (UserDefaults.standard.array(forKey: "name1") != nil){
            //nilじゃない場合nameListに追加された値の取得？？
            nameList = UserDefaults.standard.array(forKey: "name1")as![String]
            
        }*/
        
        
        
       
    }
    
    

    @IBAction func saveButton(_ sender: Any) {
        //ボタン押したらほぞん
        UserDefaults.standard.set(name1.text, forKey: "user1")
        UserDefaults.standard.set(name2.text, forKey: "user2")
        UserDefaults.standard.set(name3.text, forKey: "user3")
        UserDefaults.standard.set(name4.text, forKey: "user4")
        UserDefaults.standard.set(name5.text, forKey: "user5")
        //配列も保存
        UserDefaults.standard.set(nameList, forKey: "userList")
        
        print("SET")
        //取得したユーザー名の追加
        nameList.append(name1.text!)
        nameList.append(name2.text!)
        nameList.append(name3.text!)
        nameList.append(name4.text!)
        nameList.append(name5.text!)
        
        //UserDefaultsへの値の保存を明示的に行う→いらない？？？？
        userDefaults.synchronize()
        print("SAVE")
        print(nameList)
        
    }
    //https://softmoco.com/basics/how-to-dismiss-keyboard-by-tapping-outside.php
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_: UITextField)->Bool
    {
        // キーボードを閉じる
        name1.resignFirstResponder()

        
        
        return true
    }
}

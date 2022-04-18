//
//  ViewController.swift
//  Oshitaku
//
//  Created by 福本桃果 on 2021/11/05.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var NameList: UIButton!
    //名前リストのプロパティ
    var UserNameList: String="わたし"
    
    @IBOutlet weak var NamePopUpList: UIMenu!
    
    @IBOutlet weak var NichigetuLabel: UILabel!
    
    

    
    let image1 = UIImage(named:"banana")
    let image2 = UIImage(named:"cherry")
    let image3 = UIImage(named:"ice")
    let image4 = UIImage(named:"ninjin")
    let image5 = UIImage(named:"onigiri")
    let image6 = UIImage(named:"tomato")
    
       
    @IBOutlet weak var ohyouButton: UIButton!

    @IBOutlet weak var okigaeButton: UIButton!
    
    @IBOutlet weak var toileButton: UIButton!
        
    @IBOutlet weak var hamigakiButton: UIButton!
    
    @IBOutlet weak var kenonButton: UIButton!
    
    @IBOutlet weak var gohanButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NichigetuLabel.text = getToday(format: "yyyy年MM月dd日")//引数（何を呼ぶか）
        
        title = ""
        
        //Name Listに選択中の名前を表示
        
    }
    //メソッド関数　実際に何をするか（機能をまとめる）
    func getToday(format:String = "yyyy年MM月dd日") -> String {
            let now = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = format
            return formatter.string(from: now as Date)
        }
    

    
    
    
    
    
    
    
    @IBAction func TouchohayouButton(_ sender: Any) {
        //print("おはよう")
        ohyouButton.setImage(UIImage(named:"banana"), for: .normal)
        }


    @IBAction func okigaeButton(_ sender: Any) {
        okigaeButton.setImage(UIImage(named:"cherry"), for: .normal)
    }
    
    @IBAction func toileButton(_ sender: Any) {
        toileButton.setImage(UIImage(named:"ice"), for: .normal)
    }
    
    
    @IBAction func hamigakiButton(_ sender: Any) {
        hamigakiButton.setImage(UIImage(named:"ninjin"), for: .normal)
    }
    
    @IBAction func kenonButton(_ sender: Any) {
        kenonButton.setImage(UIImage(named:"onigiri"), for: .normal)
    }
    
    @IBAction func gohanButton(_ sender: Any) {
        gohanButton.setImage(UIImage(named:"tomato"), for: .normal)
    }
    
    @IBOutlet weak var UserName: UIMenu!
    
    
    
    
    @IBAction func returnTop(segue: UIStoryboardSegue) {
        
        ohyouButton.setImage(UIImage(named:"ohayou"), for: .normal)
        okigaeButton.setImage(UIImage(named:"okigae"), for: .normal)
        toileButton.setImage(UIImage(named:"toile"), for: .normal)
        hamigakiButton.setImage(UIImage(named:"hamigaki"), for: .normal)
        kenonButton.setImage(UIImage(named:"kenon"), for: .normal)
        gohanButton.setImage(UIImage(named:"gohan"), for: .normal)
        
        
    }
    
}



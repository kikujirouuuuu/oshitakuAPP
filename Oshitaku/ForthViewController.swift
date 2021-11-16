//
//  ForthViewController.swift
//  Oshitaku
//
//  Created by 福本桃果 on 2021/11/11.
//

import UIKit

class ForthViewController: UIViewController {
 //https://teratail.com/questions/178038
 //https://programfromscratch.com/swift%E5%85%A5%E9%96%80%E4%B9%B1%E6%95%B0%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9/
    var animalimg01 :UIImage = UIImage(named:"panda")!
    var animalimg02 :UIImage = UIImage(named:"risu")!
    var animalimg03 :UIImage = UIImage(named:"tako")!
    var animalimg04 :UIImage = UIImage(named:"uma")!
    var animalimg05 :UIImage = UIImage(named:"torikera")!
    var animalimg06 :UIImage = UIImage(named:"tentou")!
    var animalimg07 :UIImage = UIImage(named:"neko")!
    var animalimg08 :UIImage = UIImage(named:"chinanago")!
    var animalimg09 :UIImage = UIImage(named:"fugu")!
    var animalimg10 :UIImage = UIImage(named:"nezumi")!
    var animalimg11 :UIImage = UIImage(named:"pengin")!
    var animalimg12 :UIImage = UIImage(named:"tirano")!
    var animalimg13 :UIImage = UIImage(named:"kujira")!
    
    //いらない？var imgArray:[UIImage] = []
    
    @IBOutlet weak var animalImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animalImageView.image = [animalimg01, animalimg02, animalimg03,animalimg04,animalimg05,animalimg06,animalimg07,animalimg08,animalimg09,animalimg10,animalimg11,animalimg12,animalimg13].randomElement()!
        print("ランダム")
    }
    

    @IBAction func modoruButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        print("戻る")
    }
   
    
}

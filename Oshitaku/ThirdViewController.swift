//
//  ThirdViewController.swift
//  Oshitaku
//
//  Created by 福本桃果 on 2021/11/11.
//

import UIKit

class ThirdViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("test")
        let timer = Timer.scheduledTimer(
            timeInterval: 3,
            target: self,
            selector: #selector(self.chengeView),
            userInfo: nil,
            repeats: false)
         print("test2")
      
    }
    
    @objc func chengeView(){
        //print("chengeView")
        self.performSegue(withIdentifier: "toForth", sender: nil)
        //print("after")
    }
    

    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

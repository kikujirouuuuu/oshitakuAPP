//
//  NextViewController.swift
//  Oshitaku
//
//  Created by 福本桃果 on 2021/11/11.
//

import UIKit
import SwiftUI




class NextViewController: UIViewController {

    
override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
    //https://swiftui.i-app-tec.com/ios/draggesture.html#2
    struct ContentView: View {
     
        @State var position: CGSize = CGSize(width: 100, height: 100)
        
        var drag: some Gesture {
            DragGesture()
            .onChanged{ value in
                self.position = CGSize(
                    width: value.startLocation.x
                        + value.translation.width,
                    height: value.startLocation.y
                        + value.translation.height
                )
            }
            .onEnded{ value in
                self.position = CGSize(
                    width: value.startLocation.x
                        + value.translation.width,
                    height: value.startLocation.y
                        + value.translation.height
                )
            }
            
        }
        
        var body: some View {
     
            VStack {
     
                Image("banana")
                    .position(x: position.width, y: position.height)
                    .gesture(drag)
            }
        }
    }
     
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


    
    
    
}


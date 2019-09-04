//
//  GameViewController.swift
//  MultiplicationTables
//
//  Created by Apps on 9/4/19.
//  Copyright © 2019 Kevin Tanner. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        equationGenerator()
    }
    
    func equationGenerator() -> Int {
        let number1 = Int.random(in: 0..<20)
        let number2 = Int.random(in: 0..<20)
        
        //outlet1 = "\(number1)"
        //outlet2 = "\(number2)"
        
        return number1 * number2
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

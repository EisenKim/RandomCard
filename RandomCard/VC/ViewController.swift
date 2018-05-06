//
//  ViewController.swift
//  RandomCard
//
//  Created by Myeong chul Kim on 2018. 5. 6..
//  Copyright © 2018년 Myeong chul Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrMeterials:[String] = ["해","달","별","양","염소","꽃","구름","창","칼","방패"]
    var arrCards = [String]()
    
    @IBOutlet weak var viewCard1: UIView!
    @IBOutlet weak var viewCard2: UIView!
    @IBOutlet weak var viewCard3: UIView!
    
    @IBOutlet weak var btnViewCard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func generateRandomCard() -> [String]  {
        var arrResult = [String]()
        while arrMeterials.count > 0 {
            // random key from array
            let arrayKey = Int(arc4random_uniform(UInt32(arrMeterials.count)))
            // your random number
            let randCard = arrMeterials[arrayKey]
            arrResult.append(randCard)
            // make sure the number isnt repeated
            arrMeterials.remove(at: arrayKey)
        }
        return arrResult
    }
    
    @IBAction func actViewCard(_ sender: Any) {
        self.arrCards = self.generateRandomCard()
        
        for i in 0 ..< 3 {
            print(arrCards[i])
        }
    }
}


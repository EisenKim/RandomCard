//
//  ViewController.swift
//  RandomCard
//
//  Created by Myeong chul Kim on 2018. 5. 6..
//  Copyright © 2018년 Myeong chul Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrMeterials:[String] = ["해","달","별","양","염소","꽃","구름","창","칼","방패","지팡이"]
    var arrCards = [String]()
    
    @IBOutlet weak var viewCard1: UIView!
    @IBOutlet weak var viewCard2: UIView!
    @IBOutlet weak var viewCard3: UIView!
    
    @IBOutlet weak var btnViewCard: UIButton!
    
    var viewRandomCard1 = CardView()
    var viewRandomCard2 = CardView()
    var viewRandomCard3 = CardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.viewCard1.layer.cornerRadius = 8.0
        self.viewCard2.layer.cornerRadius = 8.0
        self.viewCard3.layer.cornerRadius = 8.0
        
        self.viewRandomCard1 = Bundle.main.loadNibNamed("CardView", owner: self, options: nil)?.first as! CardView
        self.viewRandomCard2 = Bundle.main.loadNibNamed("CardView", owner: self, options: nil)?.first as! CardView
        self.viewRandomCard3 = Bundle.main.loadNibNamed("CardView", owner: self, options: nil)?.first as! CardView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func generateRandomCard() -> [String]  {
        var arrTemp = self.arrMeterials
        var arrResult = [String]()
        while arrTemp.count > 0 {
            // random key from array
            let arrayKey = Int(arc4random_uniform(UInt32(arrTemp.count)))
            // your random number
            let randCard = arrTemp[arrayKey]
            arrResult.append(randCard)
            // make sure the number isnt repeated
            arrTemp.remove(at: arrayKey)
        }
        return arrResult
    }
    
    @IBAction func actViewCard(_ sender: Any) {
        self.arrCards.removeAll()
        
        self.arrCards = self.generateRandomCard()
        
        print("\(self.arrCards[0]), \(self.arrCards[1]), \(self.arrCards[2])")
        
        self.viewRandomCard1.lblName.text = self.arrCards[0]
        self.viewRandomCard2.lblName.text = self.arrCards[1]
        self.viewRandomCard3.lblName.text = self.arrCards[2]
        
        self.viewCard1.addSubview(viewRandomCard1)
        self.viewCard2.addSubview(viewRandomCard2)
        self.viewCard3.addSubview(viewRandomCard3)
    }
}


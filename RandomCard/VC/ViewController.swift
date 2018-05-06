//
//  ViewController.swift
//  RandomCard
//
//  Created by Myeong chul Kim on 2018. 5. 6..
//  Copyright © 2018년 Myeong chul Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrMeterials:[String] = ["해","달","별","양","염소","꽃","구름","창","칼","방패","지팡이","소","열쇠","무지개","나무","비둘기","까마귀","비","탑","돌","낙타","가시덤불","활","화살","나귀","구덩이","감옥","밀","보리","뱀","개구리","메뚜기","금","은","구리","장막","무화과","석류","포도","천사","항아리","뿔나팔","기름","겉옷","무릿매","수금","산","성전","빵(또는 떡)","병거","물고기","폭풍우","두루마리","사자","왕관","물","불","무덤","배","보물"]
    
    var arrCards = [String]()
    
    @IBOutlet weak var viewCard1: UIView!
    @IBOutlet weak var viewCard2: UIView!
    @IBOutlet weak var viewCard3: UIView!
    @IBOutlet weak var viewCard4: UIView!
    @IBOutlet weak var viewCard5: UIView!
    @IBOutlet weak var viewCard6: UIView!
    
    @IBOutlet weak var btnViewCard: UIButton!
    
    var viewRandomCard1 = CardView()
    var viewRandomCard2 = CardView()
    var viewRandomCard3 = CardView()
    var viewRandomCard4 = CardView()
    var viewRandomCard5 = CardView()
    var viewRandomCard6 = CardView()
    
    var iRemainCardCount: Int = 0
    var isStartGame: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("\(self.arrMeterials.count)")
        self.viewCard1.layer.cornerRadius = 8.0
        self.viewCard2.layer.cornerRadius = 8.0
        self.viewCard3.layer.cornerRadius = 8.0
        self.viewCard4.layer.cornerRadius = 8.0
        self.viewCard5.layer.cornerRadius = 8.0
        self.viewCard6.layer.cornerRadius = 8.0
        
        self.viewRandomCard1 = Bundle.main.loadNibNamed("CardView", owner: self, options: nil)?.first as! CardView
        self.viewRandomCard2 = Bundle.main.loadNibNamed("CardView", owner: self, options: nil)?.first as! CardView
        self.viewRandomCard3 = Bundle.main.loadNibNamed("CardView", owner: self, options: nil)?.first as! CardView
        self.viewRandomCard4 = Bundle.main.loadNibNamed("CardView", owner: self, options: nil)?.first as! CardView
        self.viewRandomCard5 = Bundle.main.loadNibNamed("CardView", owner: self, options: nil)?.first as! CardView
        self.viewRandomCard6 = Bundle.main.loadNibNamed("CardView", owner: self, options: nil)?.first as! CardView
        
        let gestureChangeCard1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.changeCard(_:)))
        gestureChangeCard1.numberOfTapsRequired = 1
        self.viewCard1.tag = 1
        self.viewCard1.addGestureRecognizer(gestureChangeCard1)
        
        let gestureChangeCard2: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.changeCard(_:)))
        gestureChangeCard2.numberOfTapsRequired = 1
        self.viewCard2.tag = 2
        self.viewCard2.addGestureRecognizer(gestureChangeCard2)
        
        let gestureChangeCard3: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.changeCard(_:)))
        gestureChangeCard3.numberOfTapsRequired = 1
        self.viewCard3.tag = 3
        self.viewCard3.addGestureRecognizer(gestureChangeCard3)
        
        let gestureChangeCard4: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.changeCard(_:)))
        gestureChangeCard3.numberOfTapsRequired = 1
        self.viewCard4.tag = 4
        self.viewCard4.addGestureRecognizer(gestureChangeCard4)
        
        let gestureChangeCard5: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.changeCard(_:)))
        gestureChangeCard5.numberOfTapsRequired = 1
        self.viewCard5.tag = 5
        self.viewCard5.addGestureRecognizer(gestureChangeCard5)
        
        let gestureChangeCard6: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.changeCard(_:)))
        gestureChangeCard6.numberOfTapsRequired = 1
        self.viewCard6.tag = 6
        self.viewCard6.addGestureRecognizer(gestureChangeCard6)
        
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
    
    @objc func changeCard(_ sender:UIGestureRecognizer) {
        if self.isStartGame {
            let index : Int = (sender.view?.tag)!
            print("Change Card = \(index)")
            
            if self.iRemainCardCount > 0 {
                switch (index) {
                case 1:
                    self.viewRandomCard1.lblName.text = self.arrCards[self.iRemainCardCount - 1]
                    break
                case 2:
                    self.viewRandomCard2.lblName.text = self.arrCards[self.iRemainCardCount - 1]
                    break
                case 3:
                    self.viewRandomCard3.lblName.text = self.arrCards[self.iRemainCardCount - 1]
                    break
                case 4:
                    self.viewRandomCard4.lblName.text = self.arrCards[self.iRemainCardCount - 1]
                    break
                case 5:
                    self.viewRandomCard5.lblName.text = self.arrCards[self.iRemainCardCount - 1]
                    break
                case 6:
                    self.viewRandomCard6.lblName.text = self.arrCards[self.iRemainCardCount - 1]
                    break
                default:
                    break
                }
                self.iRemainCardCount = self.iRemainCardCount - 1
                print("Remain Card Count = \(self.iRemainCardCount)")
            } else {
                print("Card is empty")
            }
        }
    }
    
    @IBAction func actViewCard(_ sender: Any) {
        self.isStartGame = true
        self.arrCards.removeAll()
        self.arrCards = self.generateRandomCard()
        
        self.iRemainCardCount = self.arrCards.count
        print("Remain Card Count = \(self.iRemainCardCount)")
        
//        print("\(self.arrCards[0]), \(self.arrCards[1]), \(self.arrCards[2])")
        
        self.viewRandomCard1.lblName.text = self.arrCards[0]
        self.viewRandomCard2.lblName.text = self.arrCards[1]
        self.viewRandomCard3.lblName.text = self.arrCards[2]
        self.viewRandomCard4.lblName.text = self.arrCards[3]
        self.viewRandomCard5.lblName.text = self.arrCards[4]
        self.viewRandomCard6.lblName.text = self.arrCards[5]
        
        self.viewCard1.addSubview(viewRandomCard1)
        self.viewCard2.addSubview(viewRandomCard2)
        self.viewCard3.addSubview(viewRandomCard3)
        self.viewCard4.addSubview(viewRandomCard4)
        self.viewCard5.addSubview(viewRandomCard5)
        self.viewCard6.addSubview(viewRandomCard6)
    }
}


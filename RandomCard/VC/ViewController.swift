//
//  ViewController.swift
//  RandomCard
//
//  Created by Myeong chul Kim on 2018. 5. 6..
//  Copyright © 2018년 Myeong chul Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrMeterials:[[String:String]] = [["1":"해"],["2":"별"],["3":"양"],["4":"염소"],["5":"꽃"],["6":"구름"],["7":"창"],["8":"칼"],["9":"방패"],["10":"지팡이"],["11":"소"],["12":"열쇠"],["13":"무지개"],["14":"나무"],["15":"비둘기"],["16":"까마귀"],["17":"비"],["18":"탑"],["19":"돌"],["20":"낙타"],["21":"가시덤불"],["22":"활"],["23":"팥죽"],["24":"나귀"],["25":"구덩이"],["26":"감옥"],["27":"밀"],["28":"뱀"],["29":"개구리"],["30":"메뚜기"],["31":"금"],["32":"은"],["33":"구리"],["34":"장막"],["35":"무화과"],["36":"석류"],["37":"포도"],["38":"천사"],["39":"항아리"],["40":"뿔나팔"],["41":"기름"],["42":"겉옷"],["43":"무릿매"],["44":"수금"],["45":"산"],["46":"성전"],["47":"빵(또는 떡)"],["48":"병거"],["49":"물고기"],["50":"소금"],["51":"바람"],["52":"두루마리"],["53":"사자"],["54":"면류관"],["55":"물"],["56":"불"],["57":"무덤"],["58":"배"],["59":"보물"],["60":"광야"]]
    
//    var arrMeterialsImage:[String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","51","52","53","54","55","56","57","58","59","60"]
    
    var arrCards = [[String:String]]()
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewCard1: UIView!
    @IBOutlet weak var viewCard2: UIView!
    @IBOutlet weak var viewCard3: UIView!
    @IBOutlet weak var viewCard4: UIView!
    @IBOutlet weak var viewCard5: UIView!
    @IBOutlet weak var viewCard6: UIView!
    
    @IBOutlet weak var btnViewCard: UIButton!
    @IBOutlet weak var btnTimerReset: UIButton!
    
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var lblRemainCards: UILabel!
    
    var viewRandomCard1 = CardView()
    var viewRandomCard2 = CardView()
    var viewRandomCard3 = CardView()
    var viewRandomCard4 = CardView()
    var viewRandomCard5 = CardView()
    var viewRandomCard6 = CardView()
    
    var iRemainCardCount: Int = 0
    var isStartGame: Bool = false
    
    var timer : Timer? = nil
    var count : Int = 0         // timer count (180sec == 3min)
    var isBlockCertNumberAction : Bool = false
    
    func startTimer() {
        count = 180
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerUpdate), userInfo: nil, repeats: true)
        isBlockCertNumberAction = true
    }
    
    func resetTimer(){
        timer?.invalidate()
        startTimer()
    }
    
    func stopTimer() {
        timer?.invalidate()
        isBlockCertNumberAction = false
    }
    
    @objc func timerUpdate() {
        
        if(count >= 0){
            let seconds = count % 60
            let minutes = (count / 60) % 60
            let strMinutes = minutes > 9 ? String(minutes) : "0" + String(minutes)
            let strSeconds = seconds > 9 ? String(seconds) : "0" + String(seconds)
            
            self.lblTimer.isHidden = false
            self.lblTimer.text = strMinutes + ":" + strSeconds    // 라벨에 타이머 출력
            count = count - 1
        } else {
            isBlockCertNumberAction = false
            self.stopTimer()
            
            let message = "턴이 종료 되었습니다."
            let alert = UIAlertController(title: "시간 초과!!!", message: message, preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: { Void in
                self.btnViewCard.isEnabled = true
            })
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.lblName.text = "이름: \(GlobalData.sharedInstance.strName ?? "")"
        self.lblTimer.layer.borderWidth = 1
        self.lblTimer.layer.borderColor = UIColor.lightGray.cgColor
        
        self.btnViewCard.setTitle("카드 보여주기", for: .normal)
        self.btnViewCard.setTitle("게임 진행 중...", for: .disabled)
        
        self.viewCard1.layer.cornerRadius = 8.0
        self.viewCard2.layer.cornerRadius = 8.0
        self.viewCard3.layer.cornerRadius = 8.0
        self.viewCard4.layer.cornerRadius = 8.0
        self.viewCard5.layer.cornerRadius = 8.0
        self.viewCard6.layer.cornerRadius = 8.0
        
        self.viewCard1.layer.borderWidth = 1
        self.viewCard2.layer.borderWidth = 1
        self.viewCard3.layer.borderWidth = 1
        self.viewCard4.layer.borderWidth = 1
        self.viewCard5.layer.borderWidth = 1
        self.viewCard6.layer.borderWidth = 1
        
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
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }

    func generateRandomCard() -> [[String:String]]  {
        var arrTemp = self.arrMeterials
        var arrResult = [[String:String]]()
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
            
            let cardIndex: Int = 0  //(self.iRemainCardCount - 1)
            
            if self.iRemainCardCount > 0 {
                switch (index) {
                case 1:
                    for key in self.arrCards[cardIndex].keys {
                        self.viewRandomCard1.lblName.text = self.arrCards[cardIndex][key]
                        self.viewRandomCard1.ivImage.image = UIImage(named: key)
                    }
                    break
                case 2:
                    for key in self.arrCards[cardIndex].keys {
                        self.viewRandomCard2.lblName.text = self.arrCards[cardIndex][key]
                        self.viewRandomCard2.ivImage.image = UIImage(named: key)
                    }
                    break
                case 3:
                    for key in self.arrCards[cardIndex].keys {
                        self.viewRandomCard3.lblName.text = self.arrCards[cardIndex][key]
                        self.viewRandomCard3.ivImage.image = UIImage(named: key)
                    }
                    break
                case 4:
                    for key in self.arrCards[cardIndex].keys {
                        self.viewRandomCard4.lblName.text = self.arrCards[cardIndex][key]
                        self.viewRandomCard4.ivImage.image = UIImage(named: key)
                    }
                    break
                case 5:
                    for key in self.arrCards[cardIndex].keys {
                        self.viewRandomCard5.lblName.text = self.arrCards[cardIndex][key]
                        self.viewRandomCard5.ivImage.image = UIImage(named: key)
                    }
                    break
                case 6:
                    for key in self.arrCards[cardIndex].keys {
                        self.viewRandomCard6.lblName.text = self.arrCards[cardIndex][key]
                        self.viewRandomCard6.ivImage.image = UIImage(named: key)
                    }
                    break
                default:
                    break
                }
                self.arrCards.remove(at: cardIndex)
                self.iRemainCardCount = self.arrCards.count
                print("Remain Card Count = \(self.iRemainCardCount)")
                self.lblRemainCards.text = "남은카드: \(self.iRemainCardCount)"
                
            } else {
                print("Card is empty")
                let message = "카드가 없어요!!!"
                let alert = UIAlertController(title: "게임 종료", message: message, preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: { Void in
                    self.btnViewCard.isEnabled = true
                    self.isBlockCertNumberAction = false
                    self.lblTimer.text = "00:00"
                    self.stopTimer()
                })
                
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        if self.isStartGame {
            self.resetTimer()
        }
    }
    
    @IBAction func actViewCard(_ sender: Any) {
        self.isStartGame = true
        self.arrCards.removeAll()
        self.arrCards = self.generateRandomCard()
        
//        print("\(self.arrCards[0]), \(self.arrCards[1]), \(self.arrCards[2])")
        
        for key in self.arrCards[0].keys {
            self.viewRandomCard1.lblName.text = self.arrCards[0][key]
            self.viewRandomCard1.ivImage.image = UIImage(named: key)
        }
        // 출력한 카드는 제거
        self.arrCards.remove(at: 0)
        
        for key in self.arrCards[0].keys {
            self.viewRandomCard2.lblName.text = self.arrCards[0][key]
            self.viewRandomCard2.ivImage.image = UIImage(named: key)
        }
        // 출력한 카드는 제거
        self.arrCards.remove(at: 0)
        
        for key in self.arrCards[0].keys {
            self.viewRandomCard3.lblName.text = self.arrCards[0][key]
            self.viewRandomCard3.ivImage.image = UIImage(named: key)
        }
        // 출력한 카드는 제거
        self.arrCards.remove(at: 0)
        
        for key in self.arrCards[0].keys {
            self.viewRandomCard4.lblName.text = self.arrCards[0][key]
            self.viewRandomCard4.ivImage.image = UIImage(named: key)
        }
        // 출력한 카드는 제거
        self.arrCards.remove(at: 0)
        
        for key in self.arrCards[0].keys {
            self.viewRandomCard5.lblName.text = self.arrCards[0][key]
            self.viewRandomCard5.ivImage.image = UIImage(named: key)
        }
        // 출력한 카드는 제거
        self.arrCards.remove(at: 0)
        
        for key in self.arrCards[0].keys {
            self.viewRandomCard6.lblName.text = self.arrCards[0][key]
            self.viewRandomCard6.ivImage.image = UIImage(named: key)
        }
        // 출력한 카드는 제거
        self.arrCards.remove(at: 0)
        
        self.viewCard1.addSubview(viewRandomCard1)
        self.viewCard2.addSubview(viewRandomCard2)
        self.viewCard3.addSubview(viewRandomCard3)
        self.viewCard4.addSubview(viewRandomCard4)
        self.viewCard5.addSubview(viewRandomCard5)
        self.viewCard6.addSubview(viewRandomCard6)
        
        self.iRemainCardCount = self.arrCards.count
        print("Remain Card Count = \(self.iRemainCardCount)")
        self.lblRemainCards.text = "남은카드: \(self.iRemainCardCount)"
        
        
        self.resetTimer()
        self.btnViewCard.isEnabled = false
        
    }
}


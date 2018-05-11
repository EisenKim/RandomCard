//
//  IntroViewController.swift
//  RandomCard
//
//  Created by Myeong chul Kim on 2018. 5. 11..
//  Copyright © 2018년 Myeong chul Kim. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtInputName: UITextField!
    @IBOutlet weak var btnConfirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.lblTitle.text = "제1회 금곡어린이 퀴즈대회"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goMainPage(_ sender: Any) {
        if txtInputName.text != "" {
            GlobalData.sharedInstance.strName = txtInputName.text
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.present(viewController, animated: true, completion: nil)
        } else {
            // Occur Error
            let message = "이름을 넣어주세요!!!"
            let alert = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: { Void in
                
            })
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

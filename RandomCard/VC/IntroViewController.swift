//
//  IntroViewController.swift
//  RandomCard
//
//  Created by Myeong chul Kim on 2018. 5. 11..
//  Copyright © 2018년 Myeong chul Kim. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtInputName: UITextField!
    @IBOutlet weak var btnConfirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.lblTitle.text = "제1회 금곡어린이 퀴즈대회"
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        if keyboardFrame.size.height == 0 {
            keyboardFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        }
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
        
    }
    
    @IBAction func goMainPage(_ sender: Any) {
        if txtInputName.text != "" {
            GlobalData.sharedInstance.strName = txtInputName.text
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.present(viewController, animated: true, completion: nil)
        } else {
            // Occur Error
            let message = "이름을 넣지 않으면 게임을 진행할 수 없어요~!!"
            let alert = UIAlertController(title: "이름을 넣어주세요!!!", message: message, preferredStyle: UIAlertControllerStyle.alert)
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

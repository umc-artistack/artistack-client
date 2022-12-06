//
//  ShowMoreBtnPopupViewController.swift
//  Artistack
//
//  Created by csh on 2022/12/06.
//

import UIKit

class ShowMoreBtnPopupViewController: UIViewController {

    @IBOutlet weak var backgroundPopupView: UIView!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var declareBtn: UIButton!
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var dismissBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundPopupView.cornerRadius = 5
 
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectedShareBtn(_ sender: Any) {
        print("공유하기 버튼 클릭")
    }
    
    @IBAction func selectedDeclareBtn(_ sender: Any) {
        print("신고하기 버튼 클릭")
        alertView.cornerRadius = 5
        alertView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.alertView.isHidden = true
        }
    }
    
    
    @IBAction func selectedDissmissBtn(_ sender: Any) {
        self.dismiss(animated: false)
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

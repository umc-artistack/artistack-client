//
//  OneProjectViewController.swift
//  Practice_Artistack
//
//  Created by csh on 2022/08/21.
//

import UIKit

class OneProjectViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("OneProjectViewController 실행했어욥")

    }
    
    
    @IBAction func clickDismiss(_ sender: Any) {
        self.dismiss(animated: true)
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

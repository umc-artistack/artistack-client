//
//  TabBarController.swift
//  Artistack
//
//  Created by 임영준 on 2022/07/20.
//

import UIKit
import CoreMotion
import JJFloatingActionButton


class TabBarController: UITabBarController, UITabBarControllerDelegate {

    static let actionButton = JJFloatingActionButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        addFloatingButton()
        tabBar.barTintColor = UIColor.Gray6
        tabBar.isTranslucent = false
    }
    

    func addFloatingButton(){
        TabBarController.actionButton.buttonImage = UIImage(named: "CameraButton")
        TabBarController.actionButton.buttonColor = .clear
        TabBarController.actionButton.buttonImageSize = CGSize(width: 48, height: 44)

        TabBarController.actionButton.addTarget(self, action: #selector(self.addButtonAction(sender:)), for: .touchUpInside)

        self.view.addSubview(TabBarController.actionButton)
        TabBarController.actionButton.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint(item: TabBarController.actionButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        TabBarController.actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
        
        self.view.layoutIfNeeded()
        }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            self.tabBar.items?[1].image = UIImage(named: "CameraButton")?.withRenderingMode(.alwaysOriginal)
        }
        
        if item.tag == 1 {
            let storyboard = UIStoryboard(name: "Media", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CameraVC") as! RecordingViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalTransitionStyle = .crossDissolve //기본은 coverVertical
            nav.modalPresentationStyle = .fullScreen // 풀스크린 만들기 그럼 dismiss 만들어야함
            nav.setNavigationBarHidden(true, animated: false)
            self.present(nav, animated: true, completion: nil)
        }
        
        else if item.tag == 2{
            self.tabBar.items?[1].image = UIImage(named: "firstRecord")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    
    @objc func addButtonAction(sender: UIButton){
        //IsStackable이 False면 alert메시지를 띄우고 촬영이 안되게끔? OK
        TabBarController.actionButton.showAnimation {
            self.checkIfBGMisNil()
            let storyboard = UIStoryboard(name: "Media", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CameraVC") as! RecordingViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalTransitionStyle = .crossDissolve //기본은 coverVertical
            nav.modalPresentationStyle = .fullScreen // 풀스크린 만들기 그럼 dismiss 만들어야함
            nav.setNavigationBarHidden(true, animated: false)
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    func checkIfBGMisNil(){
        guard (RecordingViewController.VideoURL != nil)
        else{
            RecordingViewController.IsStackable = false
            return
        }
    
}


}

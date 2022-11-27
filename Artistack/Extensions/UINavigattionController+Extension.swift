//
//  UINavigationExtensions.swift
//  Artistack
//
//  Created by 임영준 on 2022/11/06.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func setColor(){
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor.Gray6
        self.navigationBar.standardAppearance = navigationBarAppearance
        self.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
}


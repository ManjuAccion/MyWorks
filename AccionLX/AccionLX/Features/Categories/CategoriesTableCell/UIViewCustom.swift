//
//  UIViewCustom.swift
//  AccionLX
//
//  Created by Thilak kumar on 18/11/19.
//  Copyright © 2019 Manjunath. All rights reserved.
//

import Foundation
import UIKit
extension UIView  {

   func dropShadow() {
    self.layer.cornerRadius = 10
    self.layer.shadowColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
    self.layer.shadowOpacity = 5
    self.layer.shadowOffset = .zero
    self.layer.shadowRadius = 5
   }
}


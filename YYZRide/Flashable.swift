//
//  Flashable.swift
//  YYZRide
//
//  Created by Yevhen Kim on 2016-10-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit

protocol Flashable {
    
}

extension Flashable where Self: UIView {
    func flash() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.alpha = 1.0
        }) { (animationComplete) in
            if animationComplete == true {
                UIView.animate(withDuration: 0.3, delay: 2.0, options: .curveEaseOut, animations: {
                    self.alpha = 0.0
                    }, completion: nil)
            }
        }
    }
}

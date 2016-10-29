//
//  DirectionVC.swift
//  YYZRide
//
//  Created by Yevhen Kim on 2016-10-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import Foundation
import UIKit

class DirectionVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var getRouteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func getRouteButtonPressed(_ sender: UIButton) {
        let vc: WebVC = self.storyboard?.instantiateViewController(withIdentifier: "WebVC") as! WebVC
        present(vc, animated: true)
    }
    
}

//
//  PrincipleViewController.swift
//  kiDoku
//
//  Created by Rodrigo Sagebin on 6/5/18.
//  Copyright © 2018 Rodrigo Sagebin. All rights reserved.
//

import UIKit

class PrincipleViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var cells: [Button]!
    var diffLvl = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for cell in cells {
            cell.roundCornersAndDropShadow(cornerRadius: 12, shadowColor: UIColor.black.cgColor,
                                           shadowOpacity: 0.7, shadowOffset: .zero, shadowRadius: 5)
        }
    }
    
    // MARK: - Actions
    @IBAction func cellPressed(_ sender: UIButton) {
        if let val = sender.titleLabel!.text?.integerValue! {
            if val < 6 {
                sender.setTitle("\(val+1)", for: .normal)
            } else {
                sender.setTitle("1", for: .normal)
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


// MARK: - Extension
private extension String {
    struct Formatter {
        static let instance = NumberFormatter()
    }
    
    var doubleValue: Double? {
        return Formatter.instance.number(from: self)?.doubleValue
    }
    
    var integerValue: Int? {
        return Formatter.instance.number(from: self)?.intValue
    }
}

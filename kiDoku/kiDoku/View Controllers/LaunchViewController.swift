//
//  LaunchViewController.swift
//  kiDoku
//
//  Created by Rodrigo Sagebin on 6/6/18.
//  Copyright © 2018 Rodrigo Sagebin. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var startButtonTapped: Button!
    @IBOutlet var levels: [Button]!
    @IBOutlet var dimensions: [Button]!
    @IBOutlet weak var backgroundPic: UIImageView!
    
    // MARK: - Custom Properties
    var timer = Timer()
    private var _dimSelected: String?
    var dimSelected: String? {
        get {
            return _dimSelected
        } set {
            _dimSelected = newValue
        }
    }
    
    private var _lvlSelected: Int?
    var lvlSelected: Int? {
        get {
            return _lvlSelected
        } set {
            _lvlSelected = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for dimension in dimensions {
            dimension.roundCornersAndDropShadow(cornerRadius: 15, shadowColor: UIColor.black.cgColor, shadowOpacity: 0.7, shadowOffset: .zero, shadowRadius: 5)
        }
        for level in levels {
            level.roundCornersAndDropShadow(cornerRadius: 15, shadowColor: UIColor.black.cgColor, shadowOpacity: 0.7, shadowOffset: .zero, shadowRadius: 5)
        }
        startButtonTapped.roundCornersAndDropShadow(cornerRadius: 15, shadowColor: UIColor.black.cgColor, shadowOpacity: 0.7, shadowOffset: .zero, shadowRadius: 5)
    }
    
    // MARK: - Actions
    
    @IBAction func lvlButtonPressed(_ sender: Button) {
        if sender.alpha != 1 {
            sender.alpha = 1
            lvlSelected = nil
        } else {
            for level in levels {
                level.alpha = 1
            }
            
            sender.alpha = 0.8
            if let lvl = sender.titleLabel!.text {
                switch lvl {
                case "Easy" :
                    lvlSelected = 0
                case "Medium" :
                    lvlSelected = 1
                case "Hard" :
                    lvlSelected = 2
                default :
                    lvlSelected = 0
                }
            }
        }
    }
    
    @IBAction func startButtonTapped(_ sender: Button) {
        if let dim = dimSelected {
            if let lvl = lvlSelected {
                self.performSegue(withIdentifier: dim, sender: lvl)
            } else {
                self.performSegue(withIdentifier: dim, sender: 0)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dim = dimSelected {
            switch dim {
            case "4x4":
                if let destination = segue.destination as? PrincipleViewController {
                    if let lvl = sender as? Int {
                        destination.diffLvl = lvl
                    }
                }
            case "6x6":
                if let destination = segue.destination as? PrincipleViewController {
                    if let lvl = sender as? Int {
                        destination.diffLvl = lvl
                    }
                }
            case "9x9":
                if let destination = segue.destination as? PrincipleViewController {
                    if let lvl = sender as? Int {
                        destination.diffLvl = lvl
                    }
                }
            default:
                break
            }
        }
    }
}




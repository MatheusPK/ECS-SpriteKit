//
//  ItemCatcherViewController.swift
//  GameEngine
//
//  Created by Matheus P.K on 01/10/22.
//

import UIKit
import SpriteKit

class ItemCatcherViewController: UIViewController {
    
    private let mainView: UIView
    
    init(mainView: UIView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


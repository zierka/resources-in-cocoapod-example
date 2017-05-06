//
//  ViewController.swift
//  dummy
//
//  Created by Erik Zier on 28/04/2017.
//  Copyright © 2017 Erik Zier. All rights reserved.
//

import UIKit
import exampleFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        showStuff()
    }
    
    private func showStuff() {
        // you can get any resource from the bundle, not just images
        let filePath = Bundle.resourceBundle!.path(forResource: "stringfile", ofType: "txt")!
        let string = try! NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8.rawValue) as String
        let label = UILabel()
        label.text = string
        
        let image1 = UIImage(named: "iphone", in: Bundle.resourceBundle, compatibleWith: nil)
        let image2 = UIImage(bundleImageNamed: "lock-unlocked")
        let image3 = UIImage.bundleImage(named: "trash-can")
        
        let stackView = UIStackView(arrangedSubviews: [label, UIImageView(image: image1), UIImageView(image: image2), UIImageView(image: image3)])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

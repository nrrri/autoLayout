//
//  ViewController.swift
//  autoLayout
//
//  Created by Narissorn Chowarun on 2024-06-29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label1 = createLabel(text: "Hello", color: .red)
        let label2 = createLabel(text: "World", color: .purple)
        let label3 = createLabel(text: "These", color: .blue)
        let label4 = createLabel(text: "are", color: .green)
        let label5 = createLabel(text: "Labels", color: .yellow)
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)

//      Auto Layout
//        let viewsDictionary = ["label1": label1,"label2": label2,"label3": label3,"label4": label4,"label5": label5]
//        
//        // set horizon
//        for label in viewsDictionary.keys {
//            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
//        }
//        
//        // set vertical
//        let metrics = ["labelHeight": 88]
//        
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(==72)-[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
        
        var previous: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.heightAnchor.constraint(equalToConstant: 88).isActive = true
            
            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 4).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            
            previous = label
        }
        
        
    }

    func createLabel(text:String, color: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = color
        label.sizeToFit()
        
        return label
    }

}


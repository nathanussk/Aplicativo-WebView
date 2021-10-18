//
//  ViewController.swift
//  MyWebKitView
//
//  Created by ACT on 11/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Web View", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpOutside)
        button.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
        button.center = view.center
    }
    
    @objc private func didTapButton() {
        guard let url = URL(string: "https://www.sodexobeneficios.com.br/index.htm") else {
            return
        }
        
        let vc = WebViewViewController(url: url, title: "Web View")
        let navVc = UINavigationController(rootViewController: vc)
        present(navVc, animated: true)
    }
}

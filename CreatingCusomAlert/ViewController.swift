//
//  ViewController.swift
//  CreatingCusomAlert
//
//  Created by Kirill on 30.06.2023.
//

import UIKit

//MARK: - ViewController
final class ViewController: UIViewController {
    
    private let button = UIButton()
    private let customAlert = CastomALertView()
    private let gradient = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIView()
        setupConstraint()
    }
}

//MARK: - settings UIView for ViewController
private extension ViewController {
    func setupUIView() {
        gradient.colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor, UIColor.red.cgColor]
        gradient.frame = self.view.bounds
        self.view.layer.addSublayer(gradient)
        
        addSubviews()
        setupCustomAlert()
        setupButton()
        addAction()
    }
}
//MARK: - settings Item
private extension ViewController {
    func addSubviews() {
        self.view.addSubview(button)
    }
    
    func setupCustomAlert() {
        customAlert.delegate = self
        customAlert.backgroundColor = .white
    }
    
    func setupButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Alert", for: .normal)
        button.backgroundColor = .lightGray
    }
    
    func addAction() {
        button.addTarget(self, action: #selector(showfAlert), for: .touchUpInside)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
}

//MARK: - #selector Action
private extension ViewController {
    
    @objc func showfAlert(_ sender: UIButton) {
        customAlert.setupAlert(title: "Hold on!",
                               message: "Would you like to ty our short tutorial to show you how this app work? It will take no more than 30 seconds!",
                               view: self.view, height: 250, width: 350)
        animateIn()
    }
}

//MARK: - #Animation
private extension ViewController {
    
    //MARK: Animation showfAlert
    func animateIn() {
        customAlert.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        customAlert.alpha = 0
        self.customAlert.layoutIfNeeded()
        UIView.animate(withDuration: 0.4) {
            self.customAlert.visualEffectView.alpha = 1
            self.customAlert.alpha = 1
            self.customAlert.transform = CGAffineTransform.identity
            
            self.customAlert.layoutIfNeeded()
        }
    }
}

//MARK: - customAlert Action
extension ViewController: AlertDelegate {
    func closeButtonPype() {
        UIView.animate(withDuration: 0.4) {
            self.customAlert.alpha = 0
            self.customAlert.visualEffectView.alpha = 0
            self.customAlert.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { _ in
            self.customAlert.removeFromSuperview()
            self.customAlert.transform = CGAffineTransform.identity
        }
    }
}

//MARK: - SwiftUI Preview
import SwiftUI
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview()
    }
}

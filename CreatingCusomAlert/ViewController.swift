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
        customAlert.frame = CGRect(x: 0, y: 0, width: 350, height: 250)
        customAlert.center = self.view.center
        customAlert.backgroundColor = .white
    }
    
    func setupButton() {
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.center = self.view.center
        button.setTitle("Show Alert", for: .normal)
        button.backgroundColor = .lightGray
    }
    
    func addAction() {
        button.addTarget(self, action: #selector(showfAlert), for: .touchUpInside)
    }
}

//MARK: - #selector Action
private extension ViewController {
    
    @objc func showfAlert(_ sender: UIButton) {
        customAlert.setupAlert(title: "Hold on!",
                               message: "Would you like to ty our short tutorial to show you how this app work? It will take no more than 30 seconds!",
                               view: self.view)
        animateIn()
    }
}

//MARK: - #Animation
private extension ViewController {
    
    //MARK: Animation showfAlert
    func animateIn() {
        customAlert.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        customAlert.alpha = 0

        UIView.animate(withDuration: 0.4) {
            self.customAlert.visualEffectView.alpha = 1
            self.customAlert.alpha = 1
            self.customAlert.transform = CGAffineTransform.identity
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

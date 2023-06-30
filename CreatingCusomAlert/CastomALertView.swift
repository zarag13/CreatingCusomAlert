//
//  CastomALertView.swift
//  CreatingCusomAlert
//
//  Created by Kirill on 30.06.2023.
//

import UIKit

//MARK: - AlertDelegate
protocol AlertDelegate {
    func closeButtonPype()
}


//MARK: - CastomALert
final class CastomALertView: UIView {

    var delegate: AlertDelegate?
    
    let visualEffectView = UIVisualEffectView()
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let buttonAlert = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



//MARK: - settings CastomALert
extension CastomALertView {
    
    func setupAlert(title: String, message: String, view: UIView) {
        self.roundedCorners(corners: [UIRectCorner.topRight, UIRectCorner.bottomLeft], radius: 100)
        
        addSubviews(view: view)
        setupTitleLabel(title: title)
        setupMessageLabel(message: message)
        setupBlureView(view: view)
        setupButton()
        addAction()
    }
}



//MARK: - settings Item
private extension CastomALertView {
    func addSubviews(view: UIView) {
        addSubview(buttonAlert)
        addSubview(titleLabel)
        addSubview(messageLabel)
        view.addSubview(visualEffectView)
        view.addSubview(self)
    }
    
    func setupTitleLabel(title: String) {
        titleLabel.frame = CGRect(x: 15, y: 30, width: self.frame.width - 30, height: 80)
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .purple
        titleLabel.textAlignment = .left
    }
    
    func setupMessageLabel(message: String) {
        messageLabel.frame = CGRect(x: 15, y: 32, width: self.frame.width - 30, height: 180)
        messageLabel.text = message
        messageLabel.textAlignment = .left
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = .lightGray
        addSubview(messageLabel)
    }
    
    func setupBlureView(view: UIView) {
        let blureEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        visualEffectView.effect = blureEffect
        visualEffectView.alpha = 0
        visualEffectView.frame = view.bounds
    }
    
    func setupButton() {
        buttonAlert.frame = CGRect(x: self.frame.width - 80, y: self.frame.height - 90, width: self.frame.width - 280, height: 40)
        let heart = UIImage(systemName: "heart")!
        buttonAlert.setImage(heart, for: .normal)
    }
    
    func addAction() {
        buttonAlert.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
    }
    
}



//MARK: - #selector Action
private extension CastomALertView {
    @objc func dismissAlert() {
        delegate?.closeButtonPype()
    }
}

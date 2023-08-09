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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundedCorners(corners: [UIRectCorner.topRight, UIRectCorner.bottomLeft], radius: 100)
    }
}



//MARK: - settings CastomALert
extension CastomALertView {
    
    func setupAlert(title: String, message: String, view: UIView, height: CGFloat, width: CGFloat) {
        //self.roundedCorners(corners: [UIRectCorner.topRight, UIRectCorner.bottomLeft], radius: 100)
        addSubviews(view: view)
        setupTitleLabel(title: title)
        setupMessageLabel(message: message)
        setupBlureView(view: view)
        setupButton()
        addAction()
        setupConstrate(view: view, height: height, width: width)
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
    
    //MARK: - settings TitleLabel
    func setupTitleLabel(title: String) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .purple
        titleLabel.textAlignment = .left
    }
    
    //MARK: - settings MessageLabel
    func setupMessageLabel(message: String) {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = message
        messageLabel.textAlignment = .left
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = .lightGray
        addSubview(messageLabel)
    }
    
    //MARK: - settings BlureView
    func setupBlureView(view: UIView) {
        let blureEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        visualEffectView.effect = blureEffect
        visualEffectView.alpha = 0
        visualEffectView.frame = view.bounds
    }
    
    //MARK: - settings Button
    func setupButton() {
        buttonAlert.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        guard let heart = UIImage(systemName: "heart", withConfiguration: config) else { return }
        buttonAlert.setImage(heart, for: .normal)
    }
    
    func addAction() {
        buttonAlert.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
    }
    
    func setupConstrate(view: UIView, height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.heightAnchor.constraint(equalToConstant: height),
            self.widthAnchor.constraint(equalToConstant: width),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            buttonAlert.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            buttonAlert.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            buttonAlert.heightAnchor.constraint(equalToConstant: 30),
            buttonAlert.widthAnchor.constraint(equalToConstant: 30),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        ])
    }
}



//MARK: - #selector Action
private extension CastomALertView {
    @objc func dismissAlert() {
        delegate?.closeButtonPype()
    }
}

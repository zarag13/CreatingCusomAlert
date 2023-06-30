//
//  ExtensionUIView.swift
//  CreatingCusomAlert
//
//  Created by Kirill on 30.06.2023.
//

import Foundation
import UIKit


//MARK: - roundedCorners
extension UIView {
    func roundedCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

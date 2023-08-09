//
//  Preview.swift
//  CreatingCusomAlert
//
//  Created by Kirill on 09.08.2023.
//

// MARK: - SwiftUI extension UIViewController Preview
import SwiftUI
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController : UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
    func showPreview() -> some View {
        Preview(viewController: self).edgesIgnoringSafeArea(.all)
    }
}

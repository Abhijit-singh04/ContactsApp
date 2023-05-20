//
//  UIViewControllerExtension.swift
//  ContactsApp
//
//  Created by Abhijit Singh.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

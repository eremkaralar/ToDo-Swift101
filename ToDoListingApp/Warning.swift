//
//  Warning.swift
//  ToDoListingApp
//
//  Created by Erem Karalar on 23.03.2021.
//

import Foundation
import Foundation
import UIKit

struct Alert {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert, animated: true) }
    }
    
    
    static func showIncompleteFormAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Incompleted", message: "To create a todo, please pick an image and type your task name")
    }
    
    static func showIncompleteTextAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Incompleted", message: "To create a todo, please type your task name")
    }
    
    static func showIncompleteImageAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Incompleted", message: "To create a todo, please pick an image")
    }
    
    static func showAbsurdDate(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Incompleted", message: "To create a todo, please select a future date")
    }
    
    
    
}

//
//  ToDoCreateViewController.swift
//  ToDoListingApp
//
//  Created by Erem Karalar on 19.03.2021.
//

import UIKit


class ToDoCreateViewController: UIViewController {
    
    
    @IBOutlet weak var TaskNameField: UITextField!
    
    
    @IBOutlet weak var TaskDue: UIDatePicker!
    
    
   
    
    var selectedImage: UIImage?
    
    @IBOutlet weak var PickedImage: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var MainViewController : ViewController?
    var newToDo: ToDos?
   
    
    @IBAction func ImagePick(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
        
    }
    
    
    @IBAction func CancelAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "unwindToViewController" {
            let viewController = segue.destination as! ViewController
            let newToDo = sender as! ToDos
            viewController.newToDo = newToDo
            }

    }
    
    func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    DispatchQueue.main.async { vc.present(alert, animated: true) }
}

    @IBAction func DoneCreate(_ sender: UIBarButtonItem) {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
//        self.TaskDue.maximumDate = Date()
        let today = Date()
      
        let toDoObject = ToDos(TaskName: TaskNameField.text!, TaskDue: dateFormatterGet.string(from: TaskDue.date), TaskImage:selectedImage ?? UIImage(named: "washing-machine")!)
        if(TaskNameField.text! == "" && self.selectedImage == nil){
            Alert.showIncompleteFormAlert(on: self)
        }
        else if(TaskNameField.text! != "" && self.selectedImage == nil){
            Alert.showIncompleteImageAlert(on: self)
        }
        else if(TaskNameField.text! == "" && self.selectedImage != nil){
            Alert.showIncompleteTextAlert(on: self)
        }
        else if(TaskDue.date <= today){
            Alert.showAbsurdDate(on: self)
        }
        else{
            self.performSegue(withIdentifier: "unwindToViewController", sender: toDoObject)
        }

    }

}

 

extension ToDoCreateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            selectedImage = image
            PickedImage.image = image
            picker.dismiss(animated: true, completion: nil)
        }
        
        
       
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

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
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedImage: UIImage?
    @IBOutlet weak var PickedImage: UIImageView!
    var MainViewController : ViewController?
    var newToDo: ToDos?
    var stackImages: [UIImage] = [
        UIImage(named: "dishwasher")!,
        UIImage(named: "vacuum")!,UIImage(named: "vegetables-basket")!,UIImage(named: "washing-machine")!,UIImage(named: "yoga")!,
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
// Flow Layout setting
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionView.collectionViewLayout = layout
        
        collectionView.register(StackImagesCollectionViewCell.nib(), forCellWithReuseIdentifier: "StackImagesCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
   
    
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
//Fixing the date bug. Today couldn't be selected before.
        else if(TaskDue.date.addingTimeInterval(2 * 60) < today){
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

extension ToDoCreateViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
      
        selectedImage = stackImages[indexPath.row]
        PickedImage.image = stackImages[indexPath.row]
        
    }
}

extension ToDoCreateViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stackImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StackImagesCollectionViewCell", for: indexPath) as! StackImagesCollectionViewCell
        
        
        cell.stackImageView.image = stackImages[indexPath.row]
        
        return cell
    }
}

extension ToDoCreateViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

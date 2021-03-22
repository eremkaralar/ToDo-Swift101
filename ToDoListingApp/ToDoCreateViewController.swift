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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var MainViewController : ViewController?
    var newToDo: ToDos?
   
    
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

    @IBAction func DoneCreate(_ sender: UIBarButtonItem) {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
      
        let toDoObject = ToDos(TaskName: TaskNameField.text!, TaskDue: dateFormatterGet.string(from: TaskDue.date), TaskImage:UIImage(named:"washing-machine")!)
        
        self.performSegue(withIdentifier: "unwindToViewController", sender: toDoObject)

    }

}

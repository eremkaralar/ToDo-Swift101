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
    var AddtoDos: [ToDos] = []
   
    
    @IBAction func CancelAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewController {
//           let ViewController = ViewController()
        
        }
            
    }
    
    @IBAction func DoneCreate(_ sender: UIBarButtonItem) {
       
        
//        let vc = storyboard?.instantiateViewController(identifier: <#T##String#>) as! ToDoCreateViewController
//        present(vc,animated:true)
//        MainViewController?.onUserAction(data: "The quick brown fox jumps over the lazy dog")
//        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
//           self.tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
//
//        let ToDoObject.TaskDue = TaskDue.date
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
      
        var toDoObject: [ToDos] = [ToDos(TaskName: TaskNameField.text!, TaskDue: dateFormatterGet.string(from: TaskDue.date), TaskImage:UIImage(named:"washing-machine")!)]
        var strtypdate = dateFormatterGet.string(from: TaskDue.date)
        
      
        
        print(TaskNameField.text!)
        print(strtypdate)
        self.dismiss(animated: true, completion: nil)
//    vcontrollera gonder (arraye eklenmek zorunda)(table view reload) ->dismiss
    }
    
    
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

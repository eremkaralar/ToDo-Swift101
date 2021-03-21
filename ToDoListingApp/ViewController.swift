//
//  ViewController.swift
//  ToDoListingApp
//
//  Created by Erem Karalar on 12.03.2021.
//

import UIKit

class ViewController: UIViewController {
 
//    Object Oriented Prog. Assimilation

    var toDos: [ToDos] = [ToDos(TaskName: "Camasir", TaskDue: "2021-03-13", TaskImage:UIImage(named:"washing-machine")!),ToDos(TaskName: "Bulasik", TaskDue: "2021-03-13", TaskImage:UIImage(named:"dishwasher")!),ToDos(TaskName: "Supurum", TaskDue: "2021-03-14", TaskImage:UIImage(named:"vacuum")!),ToDos(TaskName: "Yoga", TaskDue: "2021-03-14", TaskImage:UIImage(named:"yoga")!),ToDos(TaskName: "Sebze Alma", TaskDue: "2021-03-15", TaskImage:UIImage(named:"vegetables-basket")!)]
    
   
    let cellReuseIdentifier = "cell"
    
    
    @IBOutlet weak var tableView: UITableView!
    
    static var newToDo: ToDos?
    
    

    override func viewDidLoad() {
           super.viewDidLoad()
        
       
           
//  Grand list title
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "To Dos"
        
        
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
           self.tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
           
           tableView.delegate = self
           tableView.dataSource = self

        

//        view controllere obje gonder -> (methodu kaldır)
//        let vc = ToDoCreateViewController(nibName: "ToDoCreateViewController", bundle: nil)
//        vc.MainViewController = self
        tableView.reloadData()
       }
            
   }

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return toDos.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//Access to the properties!
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell",for:indexPath) as! DemoTableViewCell
         
        cell.TaskName.text = toDos[indexPath.row].TaskName
        cell.TaskDue.text = toDos[indexPath.row].TaskDue
        cell.TaskImage.image = toDos[indexPath.row].TaskImage
        
         
         return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell No: \(indexPath.row).")
    }
    func onUserAction(data: String)
    {
        print("Data received: \(data)")
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DVC = segue.destination as! ToDoCreateViewController //replace ViewController2 with the name of your 2nd VC
        toDos += DVC.AddtoDos
    }
    
    //This func is handling the delete operation.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

           if editingStyle == .delete {

                toDos.remove(at: indexPath.row)
               
            
               tableView.deleteRows(at: [indexPath], with: .fade)

           } else if editingStyle == .insert {
               // For the insert. Let it stay there
           }
      
    
    
    
    }


}
//For the date(Task Due) array!
extension String {
    func getMyDate() -> DateComponents {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        let dateComp = Calendar.current.dateComponents([.day, .month, .year], from: date!)
        return dateComp
    }
}






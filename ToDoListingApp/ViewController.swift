//
//  ViewController.swift
//  ToDoListingApp
//
//  Created by Erem Karalar on 12.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
   
    var toDo: [String] = ["Camasir", "Bulasik", "Supurum", "Yoga", "Sebze Alma"]
    var TaskDues = ["2021-03-13", "2021-03-13", "2021-03-13", "2021-03-13", "2021-03-14", "2021-03-15"]
    //Images are so cute OMG!
    var TaskImage = [UIImage(named:"washing-machine"),UIImage(named:"dishwasher"),UIImage(named:"vacuum"),UIImage(named:"yoga"),UIImage(named:"vegetables-basket")]

    
   
    let cellReuseIdentifier = "cell"
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
           super.viewDidLoad()
           
           let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
           self.tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
           
           tableView.delegate = self
           tableView.dataSource = self
       }
       
     
       
     
   }

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return toDo.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//Access to the properties!
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell",for:indexPath) as! DemoTableViewCell
         
         cell.TaskName.text = "Task: " + toDo[indexPath.row]
         cell.TaskDue.text = "Due: " + TaskDues[indexPath.row]
        //Let them settle cutely ^^
        cell.TaskImage.image = TaskImage[indexPath.row]
         
         return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell No: \(indexPath.row).")
    }
    //This func is handling the delete operation.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

           if editingStyle == .delete {

                toDo.remove(at: indexPath.row)
                TaskDues.remove(at:indexPath.row)
                TaskImage.remove(at:indexPath.row)
            
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






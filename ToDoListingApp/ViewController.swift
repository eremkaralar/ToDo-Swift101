//
//  ViewController.swift
//  ToDoListingApp
//
//  Created by Erem Karalar on 12.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
   
    let toDo: [String] = ["Camasir", "Bulasik", "Supurum", "Yoga", "Sebze Alma"]
    let TaskDues = ["2021-03-13 10:00:00", "2021-03-13 12:00:00", "2021-03-13 14:00:00", "2021-03-13 16:00:00", "2021-03-14 10:00:00", "2021-03-15 12:00:00"]
   

    
   
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
         
         cell.TaskName.text = toDo[indexPath.row]
         cell.TaskDue.text = TaskDues[indexPath.row]
         cell.TaskImage.backgroundColor = .systemBlue
         
         return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell No: \(indexPath.row).")
    }
    
}
//For the date(Task Due) array!
extension String {
    func getMyDate() -> DateComponents {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:MM:SS"
        let date = dateFormatter.date(from: self)
        let dateComp = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: date!)
        return dateComp
    }
}

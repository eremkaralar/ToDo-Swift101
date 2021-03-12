//
//  ViewController.swift
//  ToDoListingApp
//
//  Created by Erem Karalar on 12.03.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    let toDo: [String] = ["Camasir", "Bulasik", "Supurum", "Yoga", "Sebze Alma"]
    
   
    let cellReuseIdentifier = "cell"
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
           super.viewDidLoad()
           
         
           self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
           
           tableView.delegate = self
           tableView.dataSource = self
       }
       
      
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.toDo.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
           
          
           cell.textLabel?.text = self.toDo[indexPath.row]
           
           return cell
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("Cell No: \(indexPath.row).")
       }
   }

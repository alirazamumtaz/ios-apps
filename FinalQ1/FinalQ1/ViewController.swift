//
//  ViewController.swift
//  FinalQ1
//
//  Created by Ali Raza on 18/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableview: UITableView!
    @IBAction func homePressed(_ sender: UIButton){
        print("Home Pressed")
        
        names = ["Fuck it"]
        
        update()
    }
    
    @IBAction func fuk(_ sender: UIButton){
        print("Fuck this shit!")
    }
    
    var names = [
        "this",
        "that",
        "there"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func update(){
        self.tableview.reloadData()
    }

}
 
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
    
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row ]
        
        return cell
    }
}



//
//  ViewController.swift
//  Random names
//
//  Created by Vasiliy on 2/28/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var names = [Name]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func storeTextFieldNames() {
        let saveName = Name(name: TextField.text!)
        names.insert(saveName, at: 0)
        TextField.text = ""
        TableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameDisplay", for: indexPath) as! DisplayTableViewCell
        let named = names[indexPath.row]
        cell.EnteredName.text = named.name
        
        return cell
    }
    
    @IBOutlet var TableView: UITableView!
    
  
    @IBOutlet var TextField: UITextField!
    
    
    @IBOutlet var AddButton: UIButton!
    
    
    @IBOutlet var randomAwards: UILabel!
    
    
    @IBAction func addNamePressed(_ sender: Any) {
        storeTextFieldNames()
    }
    
    
    @IBAction func WinButtonTapped(_ sender: Any) {
        let randomItem = names.randomElement()
        
        randomAwards.text = randomItem?.name
    }
    
    
}


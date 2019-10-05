//
//  ViewController.swift
//  machineTest2.4Final
//
//  Created by rpsindia on 13/09/19.
//  Copyright © 2019 Apurva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var searchText: UISearchBar!
    
    let snacksArray = ["Pani-puri", "samosa chaat", "bhaje", "pakodi", "edli", "poha", "vdapav", "bakarwadi", "bhel", "kachori", "Bhujiya", "Ghujiya", "chaat", "Samose", "Dosa", " Sev-Parmal", "Laddoo", "Poha", "Dum Aloo", "Shikhanji", "Gulabjamun"]
    
    var searching : Bool = false
    
    
    var searchResult = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching {
            return searchResult.count
        } else {
            return snacksArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if searching {
            cell?.textLabel?.text = searchResult[indexPath.row]
        }
        else {
            cell?.textLabel?.text = snacksArray[indexPath.row]
        }
        return cell!
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


}
}
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 3 {
            searchResult = snacksArray.filter({$0.prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tblView.reloadData()
    }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tblView.reloadData()
    }
}


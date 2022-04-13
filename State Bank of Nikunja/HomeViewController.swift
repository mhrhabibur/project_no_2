//
//  ViewController.swift
//  State Bank of Nikunja
//
//  Created by Habibur Rahman on 4/11/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var borrowers = [Data]()
    let borrowerManager = BorrowerManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "State Bank of Nikunja"
        borrowerManager.fetchData { borrower, error in
            if error != nil {
                return
            }
            if let loanBorrower = borrower {
                self.borrowers = loanBorrower.data
            DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.borrowers.sort { $0.interest > $1.interest}
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return borrowers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let individual = borrowers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.name?.text = "Name: \(individual.name)"
        cell.principalAmount?.text = "Principal Amount:  $\(individual.principalAmount)"
        cell.interestPaid?.text = "Interest Paid: $\(String(format: "%.0f", individual.interest))"
        return cell
    }

}


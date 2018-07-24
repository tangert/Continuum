//
//  ViewController.swift
//  Continuum-V1_0
//
//  Created by Tyler Angert on 7/23/18.
//  Copyright © 2018 Tyler Angert. All rights reserved.
//

import UIKit

var items = [5,3]

class ContentViewController: UIViewController {

    // MARK: IB Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addCellFooter: UIView!
    @IBOutlet weak var addCellButton: UIButton!
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tableview delegates
        tableView.delegate = self
        tableView.dataSource = self
        
        // Initial TableView setup
        tableView.estimatedRowHeight = 100
    }
}

// MARK: TableView delegates
extension ContentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // FIXME: this will be updated as the author creates more text cells
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WritingBlock", for: indexPath) as! WritingBlockController
        cell.textView.delegate = self
        cell.selectionStyle = .none
        
        return cell
    }
    
}

// FIXME: Write some code to be able to "continue deletion" from one tableview cell to the next

// MARK: TextView delegate for each cell
extension ContentViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
    }
}

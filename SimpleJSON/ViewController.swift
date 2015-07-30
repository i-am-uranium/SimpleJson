//
//  ViewController.swift
//  SimpleJSON
//
//  Created by Ravi Ranjan on 29/07/15.
//  Copyright © 2015 Ravi Ranjan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let viewModel = ViewMOdel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchItems {
            dispatch_async(dispatch_get_main_queue()){
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section)
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        confugureCell(cell,atIndexPath: indexPath)
        return cell
    }
    
    func confugureCell(cell:UITableViewCell,atIndexPath indexPath:NSIndexPath){
        cell.textLabel?.text = viewModel.titleForItemAtIndexPath(indexPath)
    }
}


//
//  ViewController.swift
//  testInterview
//
//  Created by Asanka on 6/17/19.
//  Copyright © 2019 Asanka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var viewModel: ViewModel!
    @IBOutlet var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberofItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        configureCell(cell: cell, forRawAtIndexPath: indexPath )
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchMovies {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func configureCell(cell: UITableViewCell, forRawAtIndexPath indexPath:IndexPath){
        cell.textLabel?.text = viewModel.titleForItemAtIndexPath(indexPath: indexPath)
    }

}


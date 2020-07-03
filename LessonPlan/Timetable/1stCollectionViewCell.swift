//
//  1stCollectionViewCell.swift
//  CVTest1
//
//  Created by Tristan Brynildsen on 9/05/20.
//  Copyright © 2020 Tristan Brynildsen. All rights reserved.
//

import UIKit

class _stCollectionViewCell: UICollectionViewCell, SetTVDelegates {
    
    @IBOutlet weak var dayLabel: UITextField!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var listTableView: UITableView!
    
    func refreshTableView() {
        listTableView.reloadData()
    }
    
    func setTableViewOptions(delegate: UITableViewDataSource & UITableViewDelegate, row: Int) {
        listTableView.delegate = delegate
        listTableView.dataSource = delegate
        listTableView.tag = row
        listTableView.reloadData()
    }
    
}

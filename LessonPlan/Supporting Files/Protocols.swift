//
//  Protocols.swift
//  CVTest1
//
//  Created by Tristan Brynildsen on 9/05/20.
//  Copyright © 2020 Tristan Brynildsen. All rights reserved.
//

import Foundation
import UIKit

protocol SetCVDelegates {
    
    func setCVDelegates(delegate: UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout)
    
    func refreshTV()
    
}

protocol SetTVDelegates {
    
    func setTableViewOptions(delegate: UITableViewDataSource & UITableViewDelegate, row: Int)
    
}

protocol SetNavBarTitle {
    func setTitle(delegate: ViewController)
}

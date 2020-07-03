//
//  SelectionMenuLayout.swift
//  CVTest1
//
//  Created by Tristan Brynildsen on 20/05/20.
//  Copyright © 2020 Tristan Brynildsen. All rights reserved.
//

import UIKit

class SelectionMenuLayout: UICollectionViewLayout {
    
    override func prepare() {
        //Prepare/perform any calculations required to determine CV size and position of items
    }

    override var collectionViewContentSize: CGSize {
        //Width and height of entire content views content
        return CGSize(width: 500, height: 200)
    }
}

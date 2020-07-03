////
////  ListTableViewCell.swift
////  CVTest1
////
////  Created by Tristan Brynildsen on 9/05/20.
////  Copyright © 2020 Tristan Brynildsen. All rights reserved.
////
//
//import UIKit
//
//
//
//class ListTableViewCell: UITableViewCell, SetCVDelegates {
//    
//
//    
//
//    @IBOutlet weak var lectureCollectionView: UICollectionView!
//    
//    
//    func setCVDelegates(delegate: UICollectionViewDataSource & UICollectionViewDelegateFlowLayout) {
//        lectureCollectionView.delegate = delegate
//        lectureCollectionView.dataSource = delegate
//    }
//    
//    var dataSourceForCV: UICollectionViewDataSource?
//    var delegateForCV: UICollectionViewDelegate?
//    
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//
//        self.contentView.frame = self.bounds
//        self.contentView.layoutIfNeeded()
//        let size = CGSize(width: self.lectureCollectionView.contentSize.width
//            , height: self.lectureCollectionView.contentSize.width)
//        return size
//
//    }
//    
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//    
//    
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}

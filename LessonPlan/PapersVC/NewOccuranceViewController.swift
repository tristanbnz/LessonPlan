//
//  NewOccuranceViewController.swift
//  CVTest1
//
//  Created by Tristan Brynildsen on 18/05/20.
//  Copyright © 2020 Tristan Brynildsen. All rights reserved.
//

import UIKit
import CoreData

class NewOccuranceViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var optionsCollectionView: UICollectionView!
    var paper: Paper?
    var context: NSManagedObjectContext?
    var occurance: Occurance?
    
    
    var selectionStep = 0 {
        didSet {
            
            optionsCollectionView.reloadData()
            
            switch(selectionStep) {
            case 0:
                titleLabel.text = "What type is it?"
            case 1:
                titleLabel.text = "Which day?"
            case 2:
                titleLabel.text = "What time?"
            
                
            default:
                titleLabel.text = ""
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionsCollectionView.delegate = self
        optionsCollectionView.dataSource = self
        
        context = coreDataContext.returnContext()
        
        if let cdContext = context {
            occurance = Occurance(context: cdContext)
            if let paperAddingTo = paper {
                occurance?.paper = paperAddingTo
            }
        }
        
        

        // Do any additional setup after loading the view.
    }
    


}

extension NewOccuranceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (selectionStep == 0) {
            return Constants.OCCURANCE_TYPES.count
        } else if (selectionStep == 1) {
            return Constants.DAYS.count
        }
        return Constants.TIMES.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (selectionStep == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addOccuranceCell", for: indexPath) as! AddOccuranceCollectionViewCell
            cell.label.text = Constants.OCCURANCE_TYPES[indexPath.row]
            return cell
        } else if (selectionStep == 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addOccuranceCell", for: indexPath) as! AddOccuranceCollectionViewCell
            cell.label.text = Constants.DAYS[indexPath.row]
            return cell
        }
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addOccuranceCell", for: indexPath) as! AddOccuranceCollectionViewCell
            cell.label.text = Constants.TIMES[indexPath.row]
            return cell
        
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (selectionStep == 0) {
            
            selectionStep += 1
        } else if (selectionStep == 1) {
            
            if let unwrapped = occurance {
                unwrapped.day = Int16(indexPath.row)
            }
            
            selectionStep += 1
        }
        
        else {
            
            if let unwrapped = occurance {
                unwrapped.time = Int16(indexPath.row)
            }
            //Save the occurance
//            if let addToPaper = paper, let context = coreDataContext.returnContext(), let occur = occurance {
//                    occur.paper = addToPaper
//                    do {
//                        try context.save()
//                    } catch {
//                        print("Core data error")
//                    }
//                                    
//            }
//            navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
}

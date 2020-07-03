//
//  NewPaperViewController.swift
//  CVTest1
//
//  Created by Tristan Brynildsen on 13/05/20.
//  Copyright © 2020 Tristan Brynildsen. All rights reserved.
//

import UIKit
import CoreData

class NewPaperViewController: UIViewController {
    
    @IBOutlet weak var paperNameTextBox: UITextField!
    @IBOutlet weak var occurancesTableView: UITableView!
    @IBOutlet weak var navBar: UINavigationItem!
    
//    @IBAction func paperCodeEditingChanged(_ sender: Any) {
//
//        if (paperCodeTextBox.text == "") {
//
//            paperCodeTextBox.backgroundColor = UIColor.red
//            paper?.subjectCode = ""
//
//
//        } else {
//            //TODO: Check input and split into subject code and paper code using REGEX
//            paper?.subjectCode = paperCodeTextBox.text
//        }
//
//    }
//
    @IBAction func paperNameEditingChanged(_ sender: Any) {
        if (paperNameTextBox.text == "") {
            
            paperNameTextBox.backgroundColor = UIColor.red
            paper?.name = ""
            
            
        } else {
            //TODO: Check input and split into subject code and paper code using REGEX
            paper?.name = paperNameTextBox.text
        }
        
    
    }
    
    
    let errorTextView = UITextView()
    public var paper: Paper? //Public so Objc can access it
    
    
    let context = coreDataContext.returnContext()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "newOccuranceSegue") {
            let destination = segue.destination as? NewOccuranceViewController
            guard let paperBeingAdded = paper else {
                print("Error with paper before adding occurance")
                return
            }
            destination?.paper = paperBeingAdded
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        occurancesTableView.delegate = self
        occurancesTableView.dataSource = self

        errorTextView.textColor = UIColor.red
        //errorTextView.font = UIFontDescriptor(name: "San Francisco", size: 12)
        
        if let context = context {
            paper = Paper(context: context)
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissScreen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(savePaper))
        navigationItem.hidesBackButton = true
        
    }
    
    @objc private func savePaper() {
//        let readyForInsert = false
//        print("saving")
//        guard let paperToInsert = paper else {
//            print("Caught by guard")
//            return
//        }
//        //Check info has been filled in
//        if (paperCodeTextBox.text == "") {
//
//            paperCodeTextBox.backgroundColor = UIColor.red


        if (paperNameTextBox.text == "") {

            paperNameTextBox.backgroundColor = UIColor.red

        } else {
            do {
                if coreDataContext.returnContext()?.hasChanges ?? false {
                    try coreDataContext.returnContext()?.save()
                    print("saved")
//                    self.dismiss(animated: true, completion: nil)
                    
                }
                //No changes, so just pop
                navigationController?.popViewController(animated: true)
                
                
            } catch let error as NSError {
                print(error)
                print("Error saving new lecture to database")
                return
            }
            
            
            
        //If validated, Save and dismiss
        
        //Else, message box
    }
        
    }
    
    @objc private func dismissScreen() {
        navigationController?.popViewController(animated: true)
    }
    

}

extension NewPaperViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addNewOccurance", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "newOccuranceSegue", sender: self)
    }
    
    
}

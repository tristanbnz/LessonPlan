//
//  PapersViewController.swift
//  CVTest1
//
//  Created by Tristan Brynildsen on 9/05/20.
//  Copyright © 2020 Tristan Brynildsen. All rights reserved.
//


import UIKit
import CoreData

class PapersViewController: UIViewController {

    @IBOutlet weak var papersTableView: UITableView!
    
    private var paperToAdd: Paper?
    private var papers: [Paper]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        papersTableView.delegate = self
        papersTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        papers = coreDataContext.getPapers()
        papersTableView.reloadData()
    }
    
    private func saveLecture(paperName: String) {
        //get the appD
        guard let appD = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //get the context
        let context = appD.persistentContainer.viewContext
        
        //Create the object to save
        let paper = Paper(context: context)
        
        paper.subjectCode = paperName
        
        appD.saveContext()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    


}

extension PapersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            if let paperArray = papers {
                return paperArray.count
            }
            return 0
        }
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "paperCode", for: indexPath) as! PapersTableViewCell
            
            if let paperArray = papers {
                cell.paperCode.text = paperArray[indexPath.row].subjectCode
            }
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "addNewPaper", for: indexPath)
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            
            performSegue(withIdentifier: "addNewPaperSegue", sender: self)
    }
    }
    
    
}

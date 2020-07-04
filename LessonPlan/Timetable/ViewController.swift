//
//  ViewController.swift
//  CVTest1
//
//  Created by Tristan Brynildsen on 9/05/20.
//  Copyright © 2020 Tristan Brynildsen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    private final let days = Constants.DAYS
    private var currentDay = 0
    private var tableViewDelegate: SetCVDelegates?
        
    //2d array, outer array for the day, inner for the occurances on that day
    var occurances = Array(repeating: [Occurance](), count: Constants.DAYS.count)

    @IBOutlet weak var scrollCV: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollCV.delegate = self
        scrollCV.dataSource = self
        
        navigationController?.navigationBar.prefersLargeTitles = true        
    }
    
    override func viewDidLayoutSubviews() {
                scrollCV.setContentOffset(CGPoint(x: CGFloat(currentDay) * scrollCV.bounds.size.width, y: 0.0), animated: false)

    }
    
    override func viewWillLayoutSubviews() {
        scrollCV.collectionViewLayout.invalidateLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {

        for day in 0..<days.count {
            let request: NSFetchRequest<Occurance> = Occurance.fetchRequest()
            request.predicate = NSPredicate(format: "day == %i", day)

            var papers = [Occurance]()
            let context = coreDataContext.returnContext()!
            
            do {
                papers = try context.fetch(request)
            }
            catch {
                print("CORE DATA ERROR - Fetching papers")
            }
            
            occurances[day] = papers
        }
        
        scrollCV.reloadData()
        
        //Get the current date/time
        let date = Date()
        let formatter  = DateFormatter()
        formatter.dateFormat = "E"
        let formattedDate = formatter.string(from: date)
        
        
        
        //Set the current index depending on the day, so the pageview displays the current day first
        switch(formattedDate) {
            case("Tue"): currentDay = 1
            case("Wed"): currentDay = 2
            case("Thu"): currentDay = 3
            case("Fri"): currentDay = 4
        case("Sat"): currentDay = 5
        case("Sun"): currentDay = 6
            default: currentDay = 0

        }
        
        
        
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! _stCollectionViewCell
            cell.setTableViewOptions(delegate: self, row: indexPath.row)
//            cell.dayLabel.text = days[indexPath.row]
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: scrollCV.bounds.size.width, height: scrollCV.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return occurances[tableView.tag].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! OccuranceTableViewCell
        cell.paperNameLabel.text = occurances[tableView.tag][indexPath.row].paper?.name
        return cell
    }
    
}

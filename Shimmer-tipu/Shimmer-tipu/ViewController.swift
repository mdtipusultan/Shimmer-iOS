//
//  ViewController.swift
//  Shimmer-tipu
//
//  Created by LEADS Corporation Limited on 5/4/24.
//

import UIKit
import SkeletonView

class ViewController: UIViewController,SkeletonTableViewDataSource,SkeletonTableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.rowHeight = 120
        tableview.estimatedRowHeight = 120
        tableview.dataSource = self
        tableview.delegate = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            for _ in 0...20 {
                self.data.append("Row Numbers")
            }
            
           // self.tableview.stopSkeletonAnimation()
            self.tableview.reloadData()
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableview.isSkeletonable = true
        //tableview.showSkeleton(usingColor: .greenSea, transition: .crossDissolve(0.25))
        //tableview.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .gray), animation: nil, transition: .crossDissolve(0.25))
        tableview.showSkeleton(usingColor: .wetAsphalt, transition: .crossDissolve(0.25))
        
       // tableview.showSkeleton(usingColor: .lightGray, transition: .slideLeft(duration: 0.5))

    }
    
//MARK: TABLEVIEW
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // Return the number of sections in your tableview
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return cellTableViewCell.identifier
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTableViewCell.identifier, for: indexPath) as! cellTableViewCell
        if !data.isEmpty {
            cell.name.text = data[indexPath.row]
        }
        
        return cell
    }
}


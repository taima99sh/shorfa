//
//  CourseDetailsViewController.swift
//  Shorfa
//
//  Created by taima on 2/18/21.
//  Copyright © 2021 mac air. All rights reserved.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet weak var CoursestableView: ContentSizedTableView!
    @IBOutlet weak var detailsTableView: ContentSizedTableView!

    @IBOutlet weak var bottomView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}


extension CourseDetailsViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if tableView == detailsTableView {
                return 5
            } else {
                return 10
            }
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if tableView == detailsTableView {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesDetailsTableViewCell") as! CoursesDetailsTableViewCell
                return cell
                
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableViewCell") as! CoursesTableViewCell
                return cell
            }
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == detailsTableView {
            return 90
        } else {
            return 160
        }
    }
}
extension CourseDetailsViewController {
    func setupView(){
        bottomView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.bottomView.isHidden = true
            // your code here
        }
        CoursestableView.register(UINib(nibName: "CoursesTableViewCell", bundle: nil), forCellReuseIdentifier: "CoursesTableViewCell")
        detailsTableView.register(UINib(nibName: "CoursesDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "CoursesDetailsTableViewCell")
    }
    func localized(){}
    func setupData(){
        self.detailsTableView.delegate = self
        self.detailsTableView.dataSource = self
        self.CoursestableView.delegate = self
        self.CoursestableView.dataSource = self
    }
    func fetchData(){}
}

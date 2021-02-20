//
//  CoursesViewController.swift
//  Shorfa
//
//  Created by taima on 2/18/21.
//  Copyright © 2021 mac air. All rights reserved.

import UIKit

class CoursesViewController: UIViewController {
    
    enum typePage: String {
        case tab1
        case tab2
        case tab3
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblDiscover: UILabel!
    @IBOutlet weak var lblShare: UILabel!
    @IBOutlet weak var lblDevelop: UILabel!
    @IBOutlet weak var imgDevelop: UIImageView!
    @IBOutlet weak var imgDiscover: UIImageView!
    @IBOutlet weak var imgShare: UIImageView!
    
    var type: typePage = .tab1 {
        didSet {
            updateGUI()
        }
    }
    
    var tableArr: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        localized()
        setupData()
        //fetchData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func btnDiscover(_ sender: Any) {
        self.type = .tab1
    }
    @IBAction func btnShare(_ sender: Any) {
        self.type = .tab2
    }
    @IBAction func btnDevelop(_ sender: Any) {
        self.type = .tab3
    }
}

extension CoursesViewController {
    func setupView(){
        self.type = .tab1
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "CoursesTableViewCell", bundle: nil), forCellReuseIdentifier: "CoursesTableViewCell")
        tableView.register(UINib(nibName: "PlaceholderTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceholderTableViewCell")
    }
    func localized(){}
    func setupData(){}
    func updateGUI() {
        switch self.type {
        case .tab1:
            lblDiscover.textColor = "PrimaryColor".myColor
            lblShare.textColor = "placeholderColor".myColor
            lblDevelop.textColor = "placeholderColor".myColor
            imgDiscover.image = "pointTab".image_
            imgDiscover.setImageColor(color: "PrimaryColor".myColor)
            imgDevelop.image = UIImage()
            imgShare.image = UIImage()
            
        case .tab2:
            lblDiscover.textColor = "placeholderColor".myColor
            lblShare.textColor = "PrimaryColor".myColor
            lblDevelop.textColor = "placeholderColor".myColor
            imgShare.image = "pointTab".image_
            imgDiscover.image = UIImage()
            imgDevelop.image = UIImage()
            imgShare.setImageColor(color: "PrimaryColor".myColor)
            
        case .tab3:
            lblDiscover.textColor = "placeholderColor".myColor
            lblShare.textColor = "placeholderColor".myColor
            lblDevelop.textColor = "PrimaryColor".myColor
            imgDevelop.image = "pointTab".image_
            imgDiscover.image = UIImage()
            imgDevelop.setImageColor(color: "PrimaryColor".myColor)
            imgShare.image = UIImage()
        }
    }
}


extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tableArr.count == 0 ? 2 : tableArr.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if tableArr.count == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceholderTableViewCell") as! PlaceholderTableViewCell
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableViewCell") as! CoursesTableViewCell
            //cell.object = tableArr[indexPath.row]
            //cell.configureCell()
            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "CourseDetailsViewController") as! CourseDetailsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


final class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}

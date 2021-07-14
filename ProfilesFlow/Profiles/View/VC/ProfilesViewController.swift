//
//  ProfilesViewController.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/8/21.
//

import UIKit

class ProfilesViewController: UIViewController {
    fileprivate var presenter: ProfilesPresenter
    var tableView = UITableView()
    var buttonView = RoundedtButtonView()
    
    
    init(presenter: ProfilesPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // config tableview
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 1
        self.tableView.separatorStyle = .none
        
        self.tableView.register(HeaderViewCell.self, forCellReuseIdentifier: cellIdentifiers.HeaderViewCell.rawValue)
        self.tableView.register(ImageViewCell.self, forCellReuseIdentifier: cellIdentifiers.ImageViewCell.rawValue)
        self.tableView.register(TextCell.self, forCellReuseIdentifier: cellIdentifiers.TextCell.rawValue)
        
        //config button
        self.buttonView.configure(title: "Next")
        self.buttonView.configure(percentageDiameter: 20)
        self.buttonView.configure(percentagePosX: 85, percentagePosY: 85)
        
        // add subviews
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.buttonView)
        self.view.insertSubview(self.tableView, belowSubview: self.buttonView)


        // create constraints
        let views = ["table" : self.tableView]
        let tableViewConstraintsH = NSLayoutConstraint.constraints(withVisualFormat: "H:|[table]|", options: [], metrics: nil, views: views)
        let tableViewConstraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:|[table]|", options: [], metrics: nil, views: views)
        


        // add constraints
        self.view.addConstraints(tableViewConstraintsH + tableViewConstraintsV)

        // hand off to presenter
        self.presenter.handleViewDidLoad()
        
    }
}

extension ProfilesViewController { // delegation
    func set(dataSource: UITableViewDataSource) {
        self.tableView.dataSource = dataSource
    }
    
    func set(delegate: UITableViewDelegate) {
        self.tableView.delegate = delegate
    }
}

public enum cellIdentifiers: String {
    case HeaderViewCell
    case ImageViewCell
    case TextCell
}


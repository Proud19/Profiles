//
//  ProfilesViewController.swift
//  ProfilesFlow
//
//  Created by Proud Mpala on 7/8/21.
//

import UIKit

class ProfilesViewController: UIViewController {
    fileprivate var presenter: ProfilesPresenterType
    fileprivate var tableView = UITableView()
    fileprivate var buttonView = RoundedtButtonView()
    
    init(presenter: ProfilesPresenterType) {
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
        self.buttonView.layer.cornerRadius = 32.0
        
        // add subviews
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.buttonView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.buttonView)
        
        // create constraints
        let views = ["table" : self.tableView,
                     "button" : self.buttonView]
        let tableViewConstraintsH = NSLayoutConstraint.constraints(withVisualFormat: "H:|[table]|", options: [], metrics: nil, views: views)
        let tableViewConstraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:|[table]|", options: [], metrics: nil, views: views)
        let buttonConstraintsH = [NSLayoutConstraint(item: self.buttonView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -16.0),
                                  NSLayoutConstraint(item: self.buttonView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 64.0)]
        let buttonConstraintsV = [NSLayoutConstraint(item: self.buttonView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -16.0),
                                  NSLayoutConstraint(item: self.buttonView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 64.0)]
        
        // add constraints
        self.view.addConstraints(tableViewConstraintsH + tableViewConstraintsV)
        self.view.addConstraints(buttonConstraintsH + buttonConstraintsV)

        // hand off to presenter
        self.presenter.handleViewDidLoad()
    }
}

extension ProfilesViewController { // appearance
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func configure(shouldHideButton: Bool) {
        self.buttonView.isHidden = shouldHideButton
    }
}

extension ProfilesViewController { // delegation
    func set(dataSource: UITableViewDataSource) {
        self.tableView.dataSource = dataSource
    }
    
    func set(delegate: UITableViewDelegate) {
        self.tableView.delegate = delegate
    }
    
    func set(target: Any?, selector: Selector) {
        self.buttonView.addTarget(target, action: selector, for: .touchUpInside)
    }
}

public enum cellIdentifiers: String {
    case HeaderViewCell
    case ImageViewCell
    case TextCell
}


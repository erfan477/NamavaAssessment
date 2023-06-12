//
//  HomeView.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/12/23.
//

import UIKit

class HomeView: UIView {
    // MARK: - properties
    let title = UILabel()
    var tableView: UITableView!
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - prepare UI
    func setupView() {
        // title
        prepareTitle()
        
        // table view
        prepareTableView()
        
        // add subview
        addSubview(tableView)
        addSubview(title)
        
        // add constraints
        tableView.anchorWithConstantsToTop(top: title.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 16, leftConstant: K.sizes.leftPadding, rightConstant: K.sizes.rightPadding)
        title.anchorWithConstantsToTop(top: topAnchor, topConstant: 8)
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func prepareTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .gray
    }
    
    func prepareTitle() {
        title.text = "0 Result"
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.textColor = .black
    }
}

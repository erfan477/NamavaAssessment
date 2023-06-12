//
//  HomeView.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/12/23.
//

import UIKit

class HomeView: UIView {
    // MARK: - properties
    let searchBar = UISearchBar()
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
        // search bar
        prepareSearchBar()
        
        // table view
        prepareTableView()
        
    }
    
    func prepareTableView() {
        
    }
    
    func prepareSearchBar() {
        
    }
}

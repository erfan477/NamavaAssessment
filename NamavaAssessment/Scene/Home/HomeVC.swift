//
//  HomeVC.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/12/23.
//

import UIKit

class HomeVC: UIViewController {
    // MARK: - properties
    let searchBar = UISearchBar(frame: .init(x: 0, y: 0, width: 400, height: 200))
    
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    // MARK: - prepareUI
    private func prepareUI() {
        // mainView
        let mainView = HomeView()
        prepareSearchBar()
        // add subview
        view.addSubview(mainView)
        
        // add constraints
        mainView.anchorToSafeArea(view: view)
    }
    
    // MARK: - prepare search bar
    func prepareSearchBar() {
        searchBar.placeholder = "search for music..."
        searchBar.tintColor = .systemGray
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        searchBar.delegate = self
    }
}

// MARK: - search bar delegate
extension HomeVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text)
    }
}

//
//  HomeVC.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/12/23.
//

import UIKit

class HomeVC: UIViewController {
    // MARK: - properties
    let searchBar = UISearchBar(frame: .init(x: 0, y: 0, width: K.sizes.width, height: 0))
    let viewModel = HomeVM()
    var titleLabel: UILabel!
    var tableView: UITableView!
    
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        bindViewModel()
    }
    
    // MARK: - prepareUI
    private func prepareUI() {
        // mainView
        let mainView = HomeView()
        self.tableView = mainView.tableView
        self.titleLabel = mainView.title
        
        // search bar
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
    
    // MARK: - bind viewModel
    func bindViewModel() {
        self.viewModel.errorCompletion = {[weak self] error in
            DispatchQueue.main.async {
                print("Error", error.localizedDescription)
            }
        }
        
        self.viewModel.dataCompletion = {[weak self] data in
            DispatchQueue.main.async {
                self?.titleLabel.text = "\(data.count) Resutls"
                print("data count",data.count)
            }
        }
    }
}

// MARK: - search bar delegate
extension HomeVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let keyword = searchBar.text, keyword.count >= 3 {
            self.viewModel.fetchMusic(by: keyword)
        }
    }
}

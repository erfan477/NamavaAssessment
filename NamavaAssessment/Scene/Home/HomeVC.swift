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
        self.tableView.delegate = self
        self.tableView.dataSource = self
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
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - search bar delegate
extension HomeVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let keyword = searchBar.text, keyword.count >= 3 {
            self.viewModel.fetchMusic(by: keyword)
        } else {
            self.viewModel.data = []
            self.viewModel.dataCompletion?([])
        }
    }
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeMusicCell.CellID) as! HomeMusicCell
        let music = self.viewModel.data[indexPath.row]
        cell.configure(music: music)
        return cell
    }
    
}

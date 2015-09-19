//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var searchBar: UISearchBar!
    var searchSettings = GithubRepoSearchSettings()
    
    @IBOutlet weak var gitTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gitTableView.dataSource = self
        gitTableView.estimatedRowHeight = 100
        gitTableView.rowHeight = UITableViewAutomaticDimension
        
        // initialize UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self
        
        // add search bar to navigation bar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        doSearch()
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        
        return cell
    }
    
    
    private func doSearch() {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        GithubRepo.fetchRepos(searchSettings, successCallback: { (repos) -> Void in
            for repo in repos {
                print("[Name: \(repo.name!)]" +
                    "\n\t[Stars: \(repo.stars!)]" +
                    "\n\t[Forks: \(repo.forks!)]" +
                    "\n\t[Owner: \(repo.ownerHandle!)]" +
                    "\n\t[Avatar: \(repo.ownerAvatarURL!)]")
                
                print("\n\t[Description: \(repo.description!)]")

            }
            MBProgressHUD.hideHUDForView(self.view, animated: true)
        }, error: { (error) -> Void in
            print(error)
        })
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true;
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}
//
//  ChantsViewController.swift
//  Football Chants
//
//  Created by Ricardo Camarena on 10/05/23.
//

import UIKit

class ChantsViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tv = UITableView() // Creation of Table View
        tv.translatesAutoresizingMaskIntoConstraints = false // To enhance autolayout
        tv.backgroundColor = .clear // Remove background of the cell
        tv.rowHeight = UITableView.automaticDimension // To scale the cell dynamically
        tv.estimatedRowHeight = 44 // The minimum height
        tv.separatorStyle = .none // No style for cells
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)
        return tv
    }()
    
    private lazy var teamsViewModel = TeamsViewModel()
    private lazy var audioManagerViewModel = AudioManagerViewModel()

    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
    }
}

private extension ChantsViewController {
    
    func setup() {
        
        navigationController?.navigationBar.topItem?.title = "Football Chants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}

// MARK: UITableVIewDataSource

extension ChantsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsViewModel.teams.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = teamsViewModel.teams[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellId, for: indexPath) as! TeamTableViewCell
        cell.configure(with: team, delegate: self)
        return cell
    }
}

extension ChantsViewController: TeamTableViewCellDelegate {
    
    func didTapPlayback(for team: Team) {
        audioManagerViewModel.playback(team)
        teamsViewModel.togglePlayback(for: team)
        tableView.reloadData()
    }
}

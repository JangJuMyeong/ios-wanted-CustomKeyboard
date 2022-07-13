//
//  ViewController.swift
//  CustomKeyboard
//

import UIKit

class HomeViewController: UIViewController {
    
    private let reviewTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.cellID)
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let reviewTextFile : ReviewTextFieldView = {
        let view = ReviewTextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setConstraints()
    }
    
    private func setTableView() {
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
    }
    
    private func setConstraints() {
        
        view.addSubview(reviewTableView)
        view.addSubview(reviewTextFile)
        
        NSLayoutConstraint.activate([
            reviewTextFile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            reviewTextFile.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewTextFile.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewTextFile.bottomAnchor.constraint(equalTo: reviewTableView.topAnchor),
            reviewTextFile.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            reviewTableView.topAnchor.constraint(equalTo: reviewTextFile.bottomAnchor),
            reviewTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reviewTableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.cellID, for: indexPath) as! ReviewTableViewCell
        
        return cell
    }
}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


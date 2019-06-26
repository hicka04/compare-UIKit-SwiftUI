//
//  ViewController.swift
//  ListSampleUIKit
//
//  Created by hicka04 on 2019/06/26.
//  Copyright © 2019 hicka04. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    return tableView
  }()
  
  private var numbers: [Int] = [] {
    didSet {
      let diff = numbers.difference(from: oldValue)
      diff.forEach {
        switch $0 {
        case .insert(let offset, _, _):
          tableView.insertRows(at: [IndexPath(row: offset, section: 0)], with: .automatic)
        case .remove(let offset, _, _):
          tableView.deleteRows(at: [IndexPath(row: offset, section: 0)], with: .automatic)
        }
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(tableView)
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                        target: self,
                                                        action: #selector(didTapAddButton))
  }
  
  @objc private func didTapAddButton() {
    numbers.append(numbers.count)
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numbers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "\(numbers[indexPath.row])"
    return cell
  }
}

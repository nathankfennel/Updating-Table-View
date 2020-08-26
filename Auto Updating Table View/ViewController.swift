//
//  ViewController.swift
//  Auto Updating Table View
//
//  Created by Nathan Fennel on 8/25/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let tableView: ReusableTableView = ReusableTableView(RTVParameters())
    private let modelController: ModelController = ModelController(.defaultModel)

    override func viewDidLoad() {
        super.viewDidLoad()
        modelController.delegate = self
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.setEdgesEqualToSuperview()
        tableView.model = modelController.rtvModel
    }
}

extension ViewController: ModelControllerDelegate {
    func modelUpdated(_ modelController: ModelController) {
        tableView.model = modelController.rtvModel
    }
}

private extension ParentModel {
    static var defaultModel: ParentModel {
        let randomTimeInterval = TimeInterval.random(in: 0...86400)
        let children = (0..<(Int.random(in: 30...1000))).compactMap { (number) -> ChildModel? in
            let timeInterval = TimeInterval(number) * randomTimeInterval
            let date = Date(timeIntervalSinceNow: timeInterval)
            let builder = ChildModelBuilder(date: date)
            return builder.build()
        }
        
        let builder = ParentModelBuilder(children: children)
        return builder.build()
    }
}

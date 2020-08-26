//
//  ReusableTableView.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/13/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

protocol RTVSelectionDelegate: class {
    func didSelectRow(at indexPath: IndexPath,
                      model: RTVRowModel?)
    func didSelectHeader(at indexPath: IndexPath,
                         model: RTVSectionHeaderFooterModel?)
    func didSelectFooter(at indexPath: IndexPath,
                         model: RTVSectionHeaderFooterModel?)
}

class ReusableTableView: UITableView {
    weak var selectionDelegate: RTVSelectionDelegate? = nil
    
    var model: RTVModel = RTVModelImplementation([RTVRowModel]()) {
        didSet {
            registerCells()
            guard let indexPaths = RTVDiff.updatedIndexPaths(before: oldValue,
                                                             after: model) else {
                                                                reloadData()
                                                                return
            }
            reloadRows(at: indexPaths,
                       with: .automatic)
        }
    }
    
    init(_ parameters: RTVParameters) {
        super.init(frame: parameters.frame,
                   style: parameters.style)
        
        backgroundColor = parameters.backgroundColor
        
        allowsSelection = parameters.allowsSelection
        allowsSelectionDuringEditing = parameters.allowsSelectionDuringEditing
        allowsMultipleSelection = parameters.allowsMultipleSelection
        allowsMultipleSelectionDuringEditing = parameters.allowsMultipleSelectionDuringEditing
        
        sectionIndexMinimumDisplayRowCount = parameters.sectionIndexMinimumDisplayRowCount
        sectionIndexColor = parameters.sectionIndexColor
        sectionIndexBackgroundColor = parameters.sectionIndexBackgroundColor
        sectionIndexTrackingBackgroundColor = parameters.sectionIndexTrackingBackgroundColor
        separatorStyle = parameters.separatorStyle
        separatorColor = parameters.separatorColor
        separatorEffect = parameters.separatorEffect
        cellLayoutMarginsFollowReadableWidth = parameters.cellLayoutMarginsFollowReadableWidth
        insetsContentViewsToSafeArea = parameters.insetsContentViewsToSafeArea
        
        dataSource = self
        delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerCells() {
        for (identifier, type) in model.allCellTypes() {
            register(type, forCellReuseIdentifier: identifier)
        }
        
        for (identifier, type) in model.allHeaderFooterTypes() {
            register(type, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
}

extension ReusableTableView: UITableViewDataSource,
UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.numberOfSections
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        model.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellModel = model.model(at: indexPath) else {
            return UITableViewCell()
        }
        
        let dequeuedCell = dequeueReusableCell(withIdentifier: cellModel.cellIdentifier,
                                               for: indexPath)
        guard let cell = dequeuedCell as? RTVCell else {
            assertionFailure("This cell is not an RTVCell \(dequeuedCell)")
            return dequeuedCell
        }
        cell.configure(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        guard let _ = model.headerModel(forSection: section) else { return 0 }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        headerView(forSection: section)
    }
    
    override func headerView(forSection section: Int) -> UITableViewHeaderFooterView? {
        guard let sectionModel = model.headerModel(forSection: section),
            let dequeuedHeader = dequeueReusableHeaderFooterView(withIdentifier: sectionModel.identifier) else {
                return nil
        }
        
        guard let header = dequeuedHeader as? RTVSectionHeaderFooterView else {
            assertionFailure("This cell is not an RTVSectionHeaderFooterView \(dequeuedHeader)")
            return dequeuedHeader
        }
        
        header.configure(with: sectionModel)
        return header
    }
    
    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        guard let _ = model.footerModel(forSection: section) else { return 0 }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        footerView(forSection: section)
    }
    
    override func footerView(forSection section: Int) -> UITableViewHeaderFooterView? {
        guard let sectionModel = model.footerModel(forSection: section),
            let dequeuedFooter = dequeueReusableHeaderFooterView(withIdentifier: sectionModel.identifier) else {
                return nil
        }
        
        guard let footer = dequeuedFooter as? RTVSectionHeaderFooterView else {
            assertionFailure("This cell is not an RTVSectionHeaderFooterView")
            return dequeuedFooter
        }
        
        footer.configure(with: sectionModel)
        return footer
    }
    
    func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let rowModel = model.model(at: indexPath),
            rowModel.isSelectable else {
                return nil
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath,
                                  animated: true)
        }
        selectionDelegate?.didSelectRow(at: indexPath,
                                        model: model.model(at: indexPath))
        guard let rowModel = model.model(at: indexPath) else {
            return
        }
        rowModel.didSelectBlock?()
    }
}

private extension RTVModel {
    func allCellTypes() -> [String : AnyClass] {
        var output = [String : AnyClass]()
        sections.forEach { (sectionModel) in
            sectionModel.rows.forEach { (rowModel) in
                output[rowModel.cellIdentifier] = rowModel.type
            }
        }
        return output
    }
    
    func allHeaderFooterTypes() -> [String : AnyClass] {
        var output = [String : AnyClass]()
        sections.forEach { (sectionModel) in
            if let headerModel = sectionModel.header {
                output[headerModel.identifier] = headerModel.type
            }
            if let footerModel = sectionModel.footer {
                output[footerModel.identifier] = footerModel.type
            }
        }
        return output
    }
}

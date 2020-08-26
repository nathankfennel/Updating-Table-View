//
//  ModelController.swift
//  Auto Updating Table View
//
//  Created by Nathan Fennel on 8/25/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import Foundation

protocol ModelControllerDelegate: class {
    func modelUpdated(_ modelController: ModelController)
}

class ModelController {
    weak var delegate: ModelControllerDelegate? = nil
    var rtvModel: RTVModel = RTVModelImplementation([RTVRowModel]()) {
        didSet {
            delegate?.modelUpdated(self)
        }
    }
    
    private var parentModel: ParentModel
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .long
        return dateFormatter
    }()
    
    init(_ parentModel: ParentModel) {
        self.parentModel = parentModel
        updateRTVModel()
    }
    
    private func updateRTVModel() {
        rtvModel = getRTVModel()
    }
    
    private func getRTVModel() -> RTVModel {
        return RTVModelImplementation([dateSection()])
    }
    
    private func updateModel(with newChildModel: ChildModel) {
        guard let index = (parentModel.children.firstIndex { (existingChildModel) -> Bool in
            existingChildModel.uuid == newChildModel.uuid
        }) else {
            updateRTVModel()
            return
        }
        
        let builder = parentModel.builder
        builder.children[index] = newChildModel
        
        parentModel = builder.build()
        
        updateRTVModel()
    }
    
    private func dateSection() -> RTVSectionModel {
        let rows = parentModel.children.compactMap { (childModel) -> RTVRowModel? in
            
            let selectionBlock: RTVSingleLineTextModel.RTVSelectionBlock = { [weak self] in
                // @Jon: This is where I'm generating a new model for only this row.
                // This data could be coming from the backend, it could be coming from ANYWHERE.
                // Currently, this update is happening whenever the user taps on a cell.
                let builder = childModel.builder
                builder.date = Date(timeInterval: TimeInterval.random(in: 3600...3153600),
                                    since: childModel.date)
                let newChildModel = builder.build()
                self?.updateModel(with: newChildModel)
            }
            
            let dateString = dateFormatter.string(from: childModel.date)
            return RTVSingleLineTextModel(didSelectBlock: selectionBlock,
                                          text: dateString)
        }
        
        return RTVSectionModelImplementation(rows)
    }
}

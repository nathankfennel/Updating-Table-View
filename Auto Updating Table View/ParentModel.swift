//
//  ParentModel.swift
//  Auto Updating Table View
//
//  Created by Nathan Fennel on 8/25/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import Foundation

class ParentModelBuilder {
    let uuid: UUID
    var children: [ChildModel]
    
    init(children: [ChildModel]) {
        self.uuid = UUID()
        self.children = children
    }
    
    init(_ parentModel: ParentModel) {
        self.uuid = parentModel.uuid
        self.children = parentModel.children
    }
    
    func build() -> ParentModel {
        return ParentModel(uuid: uuid,
                           children: children)
    }
}

struct ParentModel: Equatable {
    let uuid: UUID
    let children: [ChildModel]
    
    fileprivate init(uuid: UUID,
                     children: [ChildModel]) {
        self.uuid = uuid
        self.children = children
    }
    
    var builder: ParentModelBuilder {
        ParentModelBuilder(self)
    }
}

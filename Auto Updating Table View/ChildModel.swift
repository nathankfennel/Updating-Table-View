//
//  ChildModel.swift
//  Auto Updating Table View
//
//  Created by Nathan Fennel on 8/25/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import Foundation

class ChildModelBuilder {
    let uuid: UUID
    var date: Date
    
    init(date: Date) {
        self.uuid = UUID()
        self.date = date
    }
    
    init(_ childModel: ChildModel) {
        self.uuid = childModel.uuid
        self.date = childModel.date
    }
    
    func build() -> ChildModel {
        return ChildModel(uuid: uuid,
                          date: date)
    }
}

struct ChildModel: Equatable {
    let uuid: UUID
    let date: Date
    
    fileprivate init(uuid: UUID,
                     date: Date) {
        self.uuid = uuid
        self.date = date
    }
    
    var builder: ChildModelBuilder {
        ChildModelBuilder(self)
    }
}

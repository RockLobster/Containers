//
//  Container.swift
//  Containers
//
//  Created by Rainer Schlönvoigt on 19/10/15.
//
//

import Foundation

public protocol Container {
    func containerId() -> Int32
}

class SimpleContainer: Container {
    
    let id: Int32
    
    init(id: Int32) {
        self.id = id
    }
    
    func containerId() -> Int32 {
        return self.id
    }
}


extension NedlloydContainer: Container {

    public func containerId() -> Int32 {
        return self.label
    }
}

extension MaerskContainer: Container {
    
    public func containerId() -> Int32 {
        return self.id
    }
}

extension KLineContainer: Container {
    
    public func containerId() -> Int32 {
        return self.serialNumber
    }
}
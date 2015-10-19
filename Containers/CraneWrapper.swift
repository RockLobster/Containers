//
//  CraneWrapper.swift
//  Containers
//
//  Created by Rainer Schlönvoigt on 19/10/15.
//
//

import Foundation

public class CraneWrapper {
    
    func raise(containerId: Int32) {
        raise_container(containerId)
    }
    
    func lower(containerId: Int32) {
        lower_container(containerId)
    }
}
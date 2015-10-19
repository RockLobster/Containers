import Foundation

public class Stack {

    public var count = 0
    var containers = [Int32]()
    public var top: Int32? {
        return containers.last
    }
    
    public init() {

    }

    public func push(container_id: Int32) {
        count++
        containers.append(container_id)
        //raise_container(container_id)
    }
    
    public func contains(container_id: Int32) -> Bool {
        return containers.contains(container_id)
    }
}
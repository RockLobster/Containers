import Foundation

public class Stack {

    public var count = 0
    var containers = [Int]()
    public var top: Int? {
        return containers.last
    }
    
    public init() {

    }

    public func push(container_id: Int) {
        count++
        containers.append(container_id)
    }
    
    public func contains(container_id: Int) -> Bool {
        return containers.contains(container_id)
    }
}
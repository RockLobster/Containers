import Foundation

public class Stack {

    var containers = [Int32]()
    
    public var count: Int {
        return containers.count
    }
    public var top: Int32? {
        return containers.last
    }
    
    public init() {

    }

    public func push(container_id: Int32) {
        containers.append(container_id)
        //raise_container(container_id)
    }
    
    public func pop() -> Int32? {
        return containers.popLast()
    }
    
    public func contains(container_id: Int32) -> Bool {
        return containers.contains(container_id)
    }
}
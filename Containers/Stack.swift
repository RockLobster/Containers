import Foundation

public class Stack {

    var containers = [Int32]()
    let crane: CraneWrapper
    
    public var count: Int {
        return containers.count
    }
    public var top: Int32? {
        return containers.last
    }
    
    public init(crane: CraneWrapper) {
        self.crane = crane
    }

    public func push(container_id: Int32) {
        self.crane.raise(container_id)
        containers.append(container_id)
    }
    
    public func pop() -> Int32? {
        let poppedContainerId = containers.popLast()
        
        if let unwrappedContainerId = poppedContainerId {
            self.crane.lower(unwrappedContainerId)
        }
        
        return poppedContainerId
    }
    
    public func contains(container_id: Int32) -> Bool {
        return containers.contains(container_id)
    }
}
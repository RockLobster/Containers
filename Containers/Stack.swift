import Foundation

public class Stack {

    var containers = [Container]()
    let crane: CraneWrapper
    
    public var count: Int {
        return containers.count
    }
    public var top: Container? {
        return containers.last
    }
    
    public init(crane: CraneWrapper) {
        self.crane = crane
    }

    public func push(container: Container) {
        self.crane.raise(container.containerId())
        containers.append(container)
    }
    
    public func pop() -> Container? {
        let poppedContainer = containers.popLast()
        
        if let unwrappedContainer = poppedContainer {
            self.crane.lower(unwrappedContainer.containerId())
        }
        
        return poppedContainer
    }
    
    public func contains(container: Container) -> Bool {
        
        return containers.contains({ (otherContainer: Container) -> Bool in
            return otherContainer.containerId() == container.containerId()
        })
    }
}
import Foundation

public class Stack {

    public var count = 0
    public var top: Int?
    
    public init() {

    }

    public func push(container_id: Int) {
        count++
        top = container_id
    }
}
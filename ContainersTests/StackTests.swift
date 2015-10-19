import Quick
import Nimble
@testable import Containers

class CraneMock : CraneWrapper {
    
    var raisedContainers = [Int32]()
    var loweredContainers = [Int32]()
    
    override init() {
        super.init()
    }
    
    override func raise(containerId: Int32) {
        raisedContainers.append(containerId)
    }
    
    override func lower(containerId: Int32) {
        loweredContainers.append(containerId)
    }
}

class StackTests: QuickSpec {

    override func spec() {
        
        describe("stack") {
            
            var crane: CraneMock!
            var stack: Stack!
            
            beforeEach {
                crane = CraneMock()
                stack = Stack(crane: crane)
            }
            
            it("can be created") {
                expect(stack).toNot(beNil())
            }
            
            it("is empty after creation") {
                expect(stack.count).to(equal(0))
                expect(stack.top).to(beNil())
            }
            
            it("Returns null when popping a container") {
                expect(stack.pop()).to(beNil())
            }
            
            it("can add containers from all three brands") {
                stack.push(KLineContainer(serialNumber: 1))
                stack.push(MaerskContainer(id: 2))
                stack.push(NedlloydContainer(label: 3))
            }
            
            describe("after adding a container") {
                
                var singleContainer: Container!
                
                beforeEach {
                    singleContainer = SimpleContainer(id: 666)
                    stack.push(singleContainer)
                }
                
                it("has a container count of one") {
                    expect(stack.count).to(equal(1))
                }
                
                it("has the new container on top") {
                    expect(stack.top?.containerId()).to(equal(singleContainer.containerId()))
                }
                
                it("contains the added container") {
                    expect(stack.contains(singleContainer)).to(beTrue())
                }
                
                it("should tell the crane to raise the container") {
                    expect(crane.raisedContainers).to(contain(singleContainer.containerId()))
                }
                
                describe("and pop gets called") {
                    
                    var poppedContainer : Container?
                    
                    beforeEach({ () -> () in
                        poppedContainer = stack.pop()
                    })
                    
                    it("pop returns the id of the container") {
                        expect(poppedContainer?.containerId()).to(equal(singleContainer.containerId()))
                    }
                    
                    it("is empty afterwards") {
                        expect(stack.count).to(equal(0))
                    }
                    
                    it("does not contain the container anymore") {
                        expect(stack.contains(singleContainer)).to(beFalse())
                    }
                    
                    it("should tell the crane to lower the container") {
                        expect(crane.loweredContainers).to(contain(singleContainer.containerId()))
                    }
                }
            }
            
            describe("after adding multiple containers") {
                
                var container1: Container!
                var container2: Container!
                
                beforeEach {
                    container1 = SimpleContainer(id: 123)
                    container2 = SimpleContainer(id: 56789)
                    stack.push(container1)
                    stack.push(container2)
                }
                
                it("has a container count of two") {
                    expect(stack.count).to(equal(2))
                }
                
                it("has the last added container as top") {
                    expect(stack.top?.containerId()).to(equal(container2.containerId()))
                }
                
                it("contains the added containers") {
                    expect(stack.contains(container1)).to(beTrue())
                    expect(stack.contains(container2)).to(beTrue())
                }
                
                describe("and pop gets called") {
                    
                    var poppedContainer : Container?
                    
                    beforeEach {
                        poppedContainer = stack.pop()
                    }
                    
                    it("pop returns the id of the last added container") {
                        expect(poppedContainer?.containerId()).to(equal(container2.containerId()))
                    }
                    
                    it("contains only one container afterwards") {
                        expect(stack.count).to(equal(1))
                    }
                    
                    it("does not contain the last added container anymore") {
                        expect(stack.contains(container2)).to(beFalse())
                    }
                    
                    it("has the first container as top container") {
                        expect(stack.top?.containerId()).to(equal(container1.containerId()))
                    }
                }
            }
        }
    }
}
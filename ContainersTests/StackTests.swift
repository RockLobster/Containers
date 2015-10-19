import Quick
import Nimble
import Containers

class StackTests: QuickSpec {

    override func spec() {
        
        describe("stack") {
            
            var stack: Stack!
            
            beforeEach({ () -> () in
                stack = Stack()
            })
            
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
            
            describe("after adding a container") {
                
                beforeEach({ () -> () in
                    stack.push(666)
                })
                
                it("has a container count of one") {
                    expect(stack.count).to(equal(1))
                }
                
                it("has the new container on top") {
                    expect(stack.top).to(equal(666))
                }
                
                it("contains the added container") {
                    expect(stack.contains(666)).to(beTrue())
                }
                
                describe("and pop gets called") {
                    
                    var poppedContainerId : Int32?
                    
                    beforeEach({ () -> () in
                        poppedContainerId = stack.pop()
                    })
                    
                    it("pop returns the id of the container") {
                        expect(poppedContainerId).to(equal(666))
                    }
                }
            }
            
            describe("after adding multiple containers") {
                
                beforeEach({ () -> () in
                    stack.push(123)
                    stack.push(56789)
                })
                
                it("has a container count of two") {
                    expect(stack.count).to(equal(2))
                }
                
                it("has the last added container as top") {
                    expect(stack.top).to(equal(56789))
                }
                
                it("contains the added containers") {
                    expect(stack.contains(123)).to(beTrue())
                    expect(stack.contains(56789)).to(beTrue())
                }
            }
        }
    }
}
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
            }
            
            it("can put multiple containers on top") {
                stack.push(2)
                stack.push(3)
                expect(stack.count).to(equal(2))
            }
        }
    }
}
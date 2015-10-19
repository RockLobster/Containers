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
            }

            it("can put a container on top") {
                stack.push(0)
                expect(stack.count).to(equal(1))
            }
            
            it("can put multiple containers on top") {
                stack.push(2)
                stack.push(3)
                expect(stack.count).to(equal(2))
            }
        }
    }
}
import Quick
import Nimble
import Containers

class StackTests: QuickSpec {

    override func spec() {
        
        describe("stack") {
            
            let stack = Stack()
            
            it("can be created") {
                expect(stack).toNot(beNil())
            }

            it("can put a container on top") {
                stack.push(0)
                expect(stack.count).to(equal(1))
            }
        }
    }
}
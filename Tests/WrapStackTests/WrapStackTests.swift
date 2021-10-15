import XCTest
@testable import WrapStack

final class WrapStackTests: XCTestCase {
    func testView() throws {
        //Test runs to make sure the body can get built and displayed.
        let view = ExampleView().body
        XCTAssertNoThrow(view, "View setup")
    }
}

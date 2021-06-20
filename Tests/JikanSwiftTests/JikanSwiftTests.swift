import XCTest
@testable import JikanSwift

final class JikanSwiftTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(JikanSwift().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample)
    ]
}

import XCTest
@testable import Networking

final class NetworkingTests: XCTestCase {
    
    func testVersionExists() throws {
        XCTAssertFalse(Networking.version.isEmpty)
    }
    
    func testNetworkErrorDescriptions() throws {
        XCTAssertNotNil(NetworkError.invalidURL.errorDescription)
        XCTAssertNotNil(NetworkError.invalidResponse.errorDescription)
        XCTAssertNotNil(NetworkError.httpStatus(404).errorDescription)
    }
}

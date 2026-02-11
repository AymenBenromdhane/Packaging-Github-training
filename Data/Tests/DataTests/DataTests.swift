import XCTest
@testable import Data
@testable import Domain

final class DataTests: XCTestCase {
    
    func testUserMapperValid() throws {
        let dto = UserSummaryDTO(
            id: 1,
            login: "test",
            avatarUrl: "https://example.com/avatar.png"
        )
        
        let user = try UserMapper.toDomain(dto)
        
        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.login, "test")
    }
    
    func testUserMapperInvalidURL() throws {
        let dto = UserSummaryDTO(
            id: 1,
            login: "test",
            avatarUrl: "invalid-url"
        )
        
        XCTAssertThrowsError(try UserMapper.toDomain(dto))
    }
}

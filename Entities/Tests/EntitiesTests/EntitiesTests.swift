import XCTest
@testable import Entities

final class EntitiesTests: XCTestCase {
    
    func testVersionExists() throws {
        XCTAssertFalse(Entities.version.isEmpty)
    }
    
    func testUserSummaryDecoding() throws {
        let json = """
        {
            "id": 1,
            "login": "testuser",
            "avatar_url": "https://example.com/avatar.png"
        }
        """
        let data = json.data(using: .utf8)!
        let user = try JSONDecoder().decode(UserSummary.self, from: data)
        
        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.login, "testuser")
    }
    
    func testUserDetailsDecoding() throws {
        let json = """
        {
            "id": 1,
            "login": "testuser",
            "avatar_url": "https://example.com/avatar.png",
            "name": "Test User",
            "bio": "A test bio",
            "followers": 100,
            "following": 50
        }
        """
        let data = json.data(using: .utf8)!
        let user = try JSONDecoder().decode(UserDetails.self, from: data)
        
        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.login, "testuser")
        XCTAssertEqual(user.name, "Test User")
        XCTAssertEqual(user.followers, 100)
    }
    
    func testSearchResponseDecoding() throws {
        let json = """
        {
            "items": [
                {
                    "id": 1,
                    "login": "user1",
                    "avatar_url": "https://example.com/avatar1.png"
                },
                {
                    "id": 2,
                    "login": "user2",
                    "avatar_url": "https://example.com/avatar2.png"
                }
            ]
        }
        """
        let data = json.data(using: .utf8)!
        let response = try JSONDecoder().decode(SearchResponse.self, from: data)
        
        XCTAssertEqual(response.items.count, 2)
        XCTAssertEqual(response.items[0].login, "user1")
        XCTAssertEqual(response.items[1].login, "user2")
    }
}

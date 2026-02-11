import XCTest
@testable import Domain

final class DomainTests: XCTestCase {
    
    func testUserEquality() throws {
        let user1 = User(id: 1, login: "test", avatarUrl: URL(string: "https://example.com")!)
        let user2 = User(id: 1, login: "test", avatarUrl: URL(string: "https://example.com")!)
        
        XCTAssertEqual(user1, user2)
    }
    
    func testSearchUsersUseCaseValidation() async throws {
        // Mock repository
        final class MockRepository: UsersRepository {
            func searchUsers(query: String) async throws -> [User] {
                return []
            }
        }
        
        let useCase = SearchUsersUseCaseImpl(repository: MockRepository())
        
        // Test validation - query vide
        do {
            _ = try await useCase.execute(query: "")
            XCTFail("Devrait lancer une erreur")
        } catch {
            XCTAssertTrue(error is UseCaseError)
        }
        
        // Test validation - query trop courte
        do {
            _ = try await useCase.execute(query: "a")
            XCTFail("Devrait lancer une erreur")
        } catch {
            XCTAssertTrue(error is UseCaseError)
        }
    }
}

import XCTest
@testable import DesignSystem

final class DesignSystemTests: XCTestCase {
    func testVersionExists() throws {
        XCTAssertFalse(DesignSystem.version.isEmpty)
    }
    
    func testSpacingValues() throws {
        XCTAssertEqual(Spacing.xxs, 4)
        XCTAssertEqual(Spacing.xs, 8)
        XCTAssertEqual(Spacing.sm, 12)
        XCTAssertEqual(Spacing.md, 16)
        XCTAssertEqual(Spacing.lg, 24)
        XCTAssertEqual(Spacing.xl, 32)
        XCTAssertEqual(Spacing.xxl, 48)
    }
    
    func testCornerRadiusValues() throws {
        XCTAssertEqual(CornerRadius.small, 4)
        XCTAssertEqual(CornerRadius.medium, 8)
        XCTAssertEqual(CornerRadius.large, 12)
        XCTAssertEqual(CornerRadius.xLarge, 16)
    }
}

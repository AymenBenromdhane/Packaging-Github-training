import SwiftUI

/// Typographie du Design System
public extension Font {
    enum DS {
        // MARK: - Headings
        public static let largeTitle = Font.system(size: 34, weight: .bold, design: .default)
        public static let title1 = Font.system(size: 28, weight: .bold, design: .default)
        public static let title2 = Font.system(size: 22, weight: .bold, design: .default)
        public static let title3 = Font.system(size: 20, weight: .semibold, design: .default)
        
        // MARK: - Body
        public static let bodyLarge = Font.system(size: 17, weight: .regular, design: .default)
        public static let body = Font.system(size: 15, weight: .regular, design: .default)
        public static let bodySmall = Font.system(size: 13, weight: .regular, design: .default)
        
        // MARK: - Labels
        public static let label = Font.system(size: 12, weight: .medium, design: .default)
        public static let caption = Font.system(size: 11, weight: .regular, design: .default)
        
        // MARK: - Buttons
        public static let button = Font.system(size: 17, weight: .semibold, design: .default)
        public static let buttonSmall = Font.system(size: 14, weight: .semibold, design: .default)
    }
}

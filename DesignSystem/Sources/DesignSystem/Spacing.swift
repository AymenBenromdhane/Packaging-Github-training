import SwiftUI

/// Espacements du Design System
public enum Spacing {
    /// 4pt
    public static let xxs: CGFloat = 4
    /// 8pt
    public static let xs: CGFloat = 8
    /// 12pt
    public static let sm: CGFloat = 12
    /// 16pt
    public static let md: CGFloat = 16
    /// 24pt
    public static let lg: CGFloat = 24
    /// 32pt
    public static let xl: CGFloat = 32
    /// 48pt
    public static let xxl: CGFloat = 48
}

/// Rayons de bordure du Design System
public enum CornerRadius {
    /// 4pt
    public static let small: CGFloat = 4
    /// 8pt
    public static let medium: CGFloat = 8
    /// 12pt
    public static let large: CGFloat = 12
    /// 16pt
    public static let xLarge: CGFloat = 16
    /// Complètement arrondi
    public static let full: CGFloat = .infinity
}

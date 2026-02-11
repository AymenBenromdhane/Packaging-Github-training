import SwiftUI

/// Bouton principal du Design System
public struct DSButton: View {
    public enum Style {
        case primary
        case secondary
        case outline
        case ghost
    }
    
    public enum Size {
        case small
        case medium
        case large
        
        var verticalPadding: CGFloat {
            switch self {
            case .small: return Spacing.xs
            case .medium: return Spacing.sm
            case .large: return Spacing.md
            }
        }
        
        var horizontalPadding: CGFloat {
            switch self {
            case .small: return Spacing.sm
            case .medium: return Spacing.md
            case .large: return Spacing.lg
            }
        }
        
        var font: Font {
            switch self {
            case .small: return Font.DS.buttonSmall
            case .medium, .large: return Font.DS.button
            }
        }
    }
    
    private let title: String
    private let style: Style
    private let size: Size
    private let isFullWidth: Bool
    private let isLoading: Bool
    private let action: () -> Void
    
    public init(
        _ title: String,
        style: Style = .primary,
        size: Size = .medium,
        isFullWidth: Bool = false,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.size = size
        self.isFullWidth = isFullWidth
        self.isLoading = isLoading
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: Spacing.xs) {
                if isLoading {
                    ProgressView()
                        .tint(foregroundColor)
                }
                Text(title)
                    .font(size.font)
            }
            .padding(.vertical, size.verticalPadding)
            .padding(.horizontal, size.horizontalPadding)
            .frame(maxWidth: isFullWidth ? .infinity : nil)
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.medium))
            .overlay {
                if style == .outline {
                    RoundedRectangle(cornerRadius: CornerRadius.medium)
                        .stroke(BaseColor.primary, lineWidth: 1.5)
                }
            }
        }
        .disabled(isLoading)
    }
    
    private var foregroundColor: Color {
        switch style {
        case .primary:
            return TextColor.onPrimary
        case .secondary:
            return TextColor.primary
        case .outline, .ghost:
            return BaseColor.primary
        }
    }
    
    private var backgroundColor: Color {
        switch style {
        case .primary:
            return BaseColor.primary
        case .secondary:
            return BackgroundColor.secondary
        case .outline, .ghost:
            return .clear
        }
    }
}

#Preview {
    VStack(spacing: Spacing.md) {
        DSButton("Primary Button", style: .primary) { }
        DSButton("Secondary Button", style: .secondary) { }
        DSButton("Outline Button", style: .outline) { }
        DSButton("Ghost Button", style: .ghost) { }
        DSButton("Loading Button", isLoading: true) { }
        DSButton("Full Width", isFullWidth: true) { }
    }
    .padding()
}

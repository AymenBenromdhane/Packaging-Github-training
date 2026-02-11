import SwiftUI

// MARK: - Base Colors

/// Couleurs de base du Design System
public enum BaseColor {
    /// Couleur principale de la marque
    public static let primary = Color.blue
    
    /// Couleur secondaire de la marque
    public static let secondary = Color.purple
    
    /// Couleur d'accentuation
    public static let accent = Color.teal
    
    /// Nuances de gris
    public static let gray50 = Color(red: 0.98, green: 0.98, blue: 0.98)
    public static let gray100 = Color(red: 0.96, green: 0.96, blue: 0.96)
    public static let gray200 = Color(red: 0.93, green: 0.93, blue: 0.93)
    public static let gray300 = Color(red: 0.87, green: 0.87, blue: 0.87)
    public static let gray400 = Color(red: 0.74, green: 0.74, blue: 0.74)
    public static let gray500 = Color(red: 0.62, green: 0.62, blue: 0.62)
    public static let gray600 = Color(red: 0.46, green: 0.46, blue: 0.46)
    public static let gray700 = Color(red: 0.38, green: 0.38, blue: 0.38)
    public static let gray800 = Color(red: 0.26, green: 0.26, blue: 0.26)
    public static let gray900 = Color(red: 0.13, green: 0.13, blue: 0.13)
}

// MARK: - Text Colors

/// Couleurs pour le texte
public enum TextColor {
    /// Texte principal (haute lisibilité)
    public static let primary = Color(.label)
    
    /// Texte secondaire (moyenne lisibilité)
    public static let secondary = Color(.secondaryLabel)
    
    /// Texte tertiaire (faible lisibilité)
    public static let tertiary = Color(.tertiaryLabel)
    
    /// Texte désactivé
    public static let disabled = BaseColor.gray400
    
    /// Texte inversé (sur fond sombre)
    public static let inverse = Color.white
    
    /// Texte sur couleur principale
    public static let onPrimary = Color.white
    
    /// Texte de description
    public static let description = Color(.secondaryLabel)
    
    /// Texte de titre/header
    public static let header = Color(.label)
}

// MARK: - Background Colors

/// Couleurs pour les arrière-plans
public enum BackgroundColor {
    /// Arrière-plan principal de l'app
    public static let primary = Color(.systemBackground)
    
    /// Arrière-plan secondaire (cartes, sections)
    public static let secondary = Color(.secondarySystemBackground)
    
    /// Arrière-plan tertiaire (groupes)
    public static let tertiary = Color(.tertiarySystemBackground)
    
    /// Arrière-plan d'une surface élevée
    public static let elevated = Color(.secondarySystemBackground)
    
    /// Arrière-plan d'overlay/modal
    public static let overlay = Color.black.opacity(0.5)
    
    /// Arrière-plan désactivé
    public static let disabled = BaseColor.gray100
}

// MARK: - Status Colors

/// Couleurs pour les statuts et feedback
public enum StatusColor {
    /// Succès, confirmation positive
    public static let success = Color.green
    
    /// Erreur, action destructive
    public static let error = Color.red
    
    /// Avertissement
    public static let warning = Color.orange
    
    /// Information
    public static let info = Color.blue
    
    // Variantes claires pour les backgrounds
    public static let successLight = Color.green.opacity(0.1)
    public static let errorLight = Color.red.opacity(0.1)
    public static let warningLight = Color.orange.opacity(0.1)
    public static let infoLight = Color.blue.opacity(0.1)
}

// MARK: - Border Colors

/// Couleurs pour les bordures et séparateurs
public enum BorderColor {
    /// Bordure standard
    public static let primary = Color(.separator)
    
    /// Bordure secondaire (plus subtile)
    public static let secondary = Color(.separator).opacity(0.5)
    
    /// Bordure pour focus/active
    public static let focus = BaseColor.primary
    
    /// Bordure pour erreur
    public static let error = StatusColor.error
    
    /// Séparateur
    public static let separator = Color(.separator)
}

// MARK: - Interactive Colors

/// Couleurs pour les éléments interactifs
public enum InteractiveColor {
    /// État normal d'un élément
    public static let `default` = BaseColor.primary
    
    /// État hover/pressé
    public static let hover = BaseColor.primary.opacity(0.8)
    
    /// État actif/sélectionné
    public static let active = BaseColor.primary
    
    /// État désactivé
    public static let disabled = BaseColor.gray300
    
    /// Lien hypertexte
    public static let link = Color.blue
}

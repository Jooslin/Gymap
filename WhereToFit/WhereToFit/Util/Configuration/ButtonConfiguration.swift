//
//  ButtonConfiguration.swift
//  WhereToFit
//
//  Created by 변예린 on 5/28/26.
//

import UIKit

struct ButtonConfiguration {
    let size: ButtonSize
    let style: ButtonStyle
    let color: UIColor
    
    enum ButtonStyle {
        case fill
        case border
        
        var borderWidth: CGFloat { return 1 }
    }
    
    enum ButtonSize {
        case small
        case medium
        case large
        
        var padding: UIEdgeInsets {
            switch self {
            case .small:
                    .init(top: 10, left: 24, bottom: 10, right: 24)
            case .medium, .large:
                    .init(top: 14, left: 0, bottom: 14, right: 0)
            }
        }
        
        var radius: CGFloat {
            switch self {
            case .small: return 99
            case .medium: return 99
            case .large: return 99
            }
        }
        
        var labelConfig: LabelConfiguration {
            switch self {
            case .small: return .body12Medium
            case .medium, .large: return .body14Semibold
            }
        }
    }
}

extension ButtonConfiguration {
    private static func make(
        size: ButtonSize,
        style: ButtonStyle,
        color: UIColor,
    ) -> ButtonConfiguration {
        ButtonConfiguration(
            size: size,
            style: style,
            color: color
        )
    }
    
    //TODO: 색상 수정 필요
    //MARK: Filled
    static let smallFilledBlue = make(size: .small, style: .fill, color: .systemBlue)
    static let mediumFilledBlue = make(size: .medium, style: .fill, color: .systemBlue)
    static let largeFilledBlue = make(size: .large, style: .fill, color: .systemBlue)
    
    static let smallFilledGray = make(size: .small, style: .fill, color: .gray200)
    static let mediumFilledGray = make(size: .medium, style: .fill, color: .gray200)
    static let largeFilledGray = make(size: .large, style: .fill, color: .gray200)
    
    //MARK: Border
    static let smallBorderBlue = make(size: .small, style: .border, color: .systemBlue)
    static let mediumBorderBlue = make(size: .medium, style: .border, color: .systemBlue)
    static let largeBorderBlue = make(size: .large, style: .border, color: .systemBlue)
    
    static let smallBorderGray = make(size: .small, style: .border, color: .gray200)
    static let mediumBorderGray = make(size: .medium, style: .border, color: .gray200)
    static let largeBorderGray = make(size: .large, style: .border, color: .gray200)
}

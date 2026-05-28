//
//  Button.swift
//  WhereToFit
//
//  Created by 변예린 on 5/28/26.
//

import UIKit
import Then

class Button: UIControl {
    private let background: UIView
    private let titleLabel: UILabel
    private let padding: UIEdgeInsets
    
    var title: String?  {
        get { titleLabel.text }
        set { titleLabel.text = newValue}
    }
    
    
    
    init(config: ButtonConfiguration) {
        background = switch config.style {
        case .fill:
            ButtonBackgroundView(color: config.color, radius: config.size.radius)
        case .border:
            ButtonBackgroundView(color: config.color, radius: config.size.radius, borderWidth: config.style.borderWidth)
        }
        
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Button {
    private class ButtonBackgroundView: UIView {
        let color: UIColor
        let radius: CGFloat
        let borderWidth: CGFloat?
        
        init(color: UIColor, radius: CGFloat, borderWidth: CGFloat? = nil) {
            self.color = color
            self.radius = radius
            self.borderWidth = borderWidth
            super.init()
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func willMove(toSuperview newSuperview: UIView?) {
            super.willMove(toSuperview: newSuperview)
            isUserInteractionEnabled = false
            backgroundColor = color
            layer.cornerRadius = radius
            
            if let borderWidth {
                layer.borderWidth = borderWidth
                layer.borderColor = color.cgColor
            }
        }
    }
}

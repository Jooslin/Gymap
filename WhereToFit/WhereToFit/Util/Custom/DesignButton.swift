//
//  Button.swift
//  WhereToFit
//
//  Created by 변예린 on 5/28/26.
//

import UIKit
import Then
import RxSwift
import RxCocoa

/**
 ButtonConfiguration을 통해 디자인 시스템에 기반한 Button을 생성합니다.

 아래와 같이 사용할 수 있습니다.
 ```swift
 let mediumBlueButton = DesignButton(config: .mediumFilledBlue) // 색상 버튼 사용시 + 타이틀 x
 let largeBorderButton = DesignButton(config: .largeBorderBlue).then {
     $0.title = "large border blue"
 } // 테두리 버튼 사용시 + 타이틀 적용
 
 func bind(reactor: TempReactor) {
    largeBorderButton.rx.tap
        .subscribe(onNext: {
            print("largeBorderButtonTapped")
        })
        .disposed(by: disposeBag)
 } // Reactive 확장으로 기존 UIButton처럼 이벤트를 구독할 수 있습니다.
 ```
 
 - Parameters:
   - config: ButtonConfiguration(기존에 정의된 것을 사용하거나 필요 시 생성하여 사용)
*/
class DesignButton: UIControl {
    private let background: UIView
    private let titleLabel: UILabel
    private let padding: UIEdgeInsets
    
    var title: String?  {
        get { titleLabel.text }
        set { titleLabel.text = newValue}
    }
    
    override var intrinsicContentSize: CGSize {
        let textSize = titleLabel.intrinsicContentSize
        return CGSize(
            width: textSize.width + padding.left + padding.right,
            height: textSize.height + padding.top + padding.bottom
        )
    }
    
    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.5 : 1
        }
    }
    
    init(config: ButtonConfiguration) {
        background = switch config.style {
        case .fill:
            ButtonBackgroundView(config: config)
        case .border:
            ButtonBackgroundView(config: config)
        }
        
        titleLabel = UILabel(config: config.size.labelConfig, color: config.titleColor).then {
            $0.textAlignment = .center
        }
        padding = config.size.padding
        super.init(frame: .zero)
        
        addSubview(background)
        addSubview(titleLabel)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        background.frame = bounds
        titleLabel.frame = bounds.inset(by: padding)
    }
}

extension DesignButton {
    private class ButtonBackgroundView: UIView {
        let color: UIColor
        let radius: CGFloat
        let borderWidth: CGFloat
        let borderColor: UIColor
        
        init(config: ButtonConfiguration) {
            self.color = config.color
            self.radius = config.size.radius
            self.borderWidth = config.style.borderWidth
            self.borderColor = config.titleColor
            super.init(frame: .zero)
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // addsubview가 되기 직전 호출되는 함수
        override func willMove(toSuperview newSuperview: UIView?) {
            super.willMove(toSuperview: newSuperview)
            isUserInteractionEnabled = false
            
            backgroundColor = color
            layer.cornerRadius = radius
            
            if borderWidth > 0 {
                layer.borderWidth = borderWidth
                layer.borderColor = borderColor.cgColor
            }
        }
    }
}

extension Reactive where Base: DesignButton {
    var tap: ControlEvent<Void> {
        controlEvent(.touchUpInside)
    }
}

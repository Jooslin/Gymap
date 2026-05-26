//
//  LabelConfiguration.swift
//  WhereToFit
//
//  Created by 변예린 on 5/26/26.
//

import UIKit

struct LabelConfiguration {
    let font: UIFont
//    let textStyle: UIFont.TextStyle
    let color: UIColor
    let lines: Int
}

/*
 현재는 정해진 폰트 굵기와 크기 외에 변경은 막아두지 않았습니다.
 
 생성으로 사용시
 let titleLabel = UILabel(text: "제목", config: .headline24)
 let bodyLabel = UILabel(text: "본문", config: .body16)

 이미 있는 label 적용
 label.apply(.body16)
 label.apply(.body16, color: .secondaryLabel)
 label.apply(.body16, lines: 0)
 label.apply(.body16, color: .systemRed, lines: 2)
 */

extension LabelConfiguration {
    private static func make(
        size: CGFloat,
        weight: UIFont.Weight,
//        textStyle: UIFont.TextStyle,
        color: UIColor = .label,
        lines: Int = 0
    ) -> LabelConfiguration {
        LabelConfiguration(
            font: .systemFont(ofSize: size, weight: weight),
            //            textStyle: textStyle,
            color: color,
            lines: lines
        )
    }
    
    //MARK: Title
    static let title28 = make(size: 28, weight: .bold)
    static let title24 = make(size: 24, weight: .bold)
    static let title20Bold = make(size: 20, weight: .bold)
    static let title20Semibold = make(size: 20, weight: .semibold)
    static let title18 = make(size: 18, weight: .semibold)
    static let title16 = make(size: 26, weight: .semibold)
    
    //MARK: Body
    static let body15 = make(size: 15, weight: .semibold)
    static let body14Semibold = make(size: 14, weight: .semibold)
    static let body14Medium = make(size: 14, weight: .medium)
    static let body13Medium = make(size: 13, weight: .medium)
    static let body12Medium = make(size: 12, weight: .medium)
    static let body14Regular = make(size: 14, weight: .regular)
    static let body13Regular = make(size: 13, weight: .regular)
    static let body12Regular = make(size: 12, weight: .regular)
}

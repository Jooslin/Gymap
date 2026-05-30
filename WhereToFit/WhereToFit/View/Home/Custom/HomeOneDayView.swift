//
//  HomeWeeklyDateView.swift
//  WhereToFit
//
//  Created by 변예린 on 5/30/26.
//

import UIKit
import SnapKit
import Then


class OneDayView: UIStackView {
    let weekdayLabel = UILabel(config: .body12Regular)
    let dateImageView = RoundImageView(image: nil, type: .circle)
    let dateLabel = UILabel(config: .body14Regular)
    
    
    init() {
        super.init(frame: .zero)
        addArrangedSubview(weekdayLabel)
        addArrangedSubview(dateImageView)

        axis = .vertical
        spacing = 8
        alignment = .center
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        dateImageView.addSubview(dateLabel)
        
        dateImageView.snp.makeConstraints {
            $0.width.height.equalTo(32)
        }
        
        dateLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(18)
            $0.height.equalTo(20)
        }
    }
}

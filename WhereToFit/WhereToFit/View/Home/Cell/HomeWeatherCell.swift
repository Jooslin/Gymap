//
//  HomeWeatherCell.swift
//  WhereToFit
//
//  Created by 변예린 on 5/30/26.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

final class HomeWeatherCell: UICollectionViewCell {
    private(set) var disposeBag = DisposeBag()
    
    private lazy var weeklyDateView = generateWeeklyDateView()
    private let weatherImageView = UIImageView()
    private let weatherLabel = UILabel(config: .body14Medium)
    private let weatherDescriptionLabel = UILabel(config: .title24)
    private let reservationLabel = UILabel(config: .body16Medium)
    let registrationButton = DesignButton(config: .smallBorderBlue).then {
        $0.title = "프로그램 등록"
    }
    let recordButton = DesignButton(config: .smallFilledBlue).then {
        $0.title = "운동 기록"
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}

extension HomeWeatherCell {
    private func generateWeeklyDateView() -> UIStackView {
        let dates = (0..<7).reduce([UIView]()) { array, _ in
            let view = OneDayView()
            return array + [view]
        }
        
        let stackView = UIStackView(arrangedSubviews: dates).then {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.alignment = .center
        }
        
        return stackView
    }
}

extension HomeWeatherCell {
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

}

extension Reactive where Base: HomeWeatherCell {
    var registerButtonTap: ControlEvent<Void> {
        base.registrationButton.rx.tap
    }
    
    var recordButtonTap: ControlEvent<Void> {
        base.recordButton.rx.tap
    }
}

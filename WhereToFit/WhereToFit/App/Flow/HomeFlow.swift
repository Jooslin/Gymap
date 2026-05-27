//
//  HomeFlow.swift
//  WhereToFit
//
//  Created by 변예린 on 5/27/26.
//

import UIKit
import RxFlow
import RxSwift
import ReactorKit

final class HomeFlow: Flow {
    private let navigationController = UINavigationController()
    var root: any RxFlow.Presentable { navigationController }
    
    func navigate(to step: any RxFlow.Step) -> RxFlow.FlowContributors {
        // 정의한 AppStep일 때만 동작
        guard let step = step as? AppStep else {
            return .none
        }
        
        switch step {
            //TODO: 추후 수정 필요
        case .splash:
            let vc = TempViewController(reactor: TempReactor())

            return .one(
                flowContributor: .contribute(
                    withNextPresentable: vc,
                    withNextStepper: vc
                ))

        case .main:
            return .none

        case let .updateRequired(message, storeURL):
            return .none
            
        default:
            return .none
        }
    }
}

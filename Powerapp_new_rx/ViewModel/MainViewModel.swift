//
//  MainViewModel.swift
//  Powerapp_new_rx
//
//  Created by KJS on 2022/01/06.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

class MainViewModel: ViewModel {
    
    let bag: DisposeBag = DisposeBag()
    
    struct Input {
        var tapSideMenuBtn: Observable<Void>
    }
    
    struct Output {
        var isSideMenuOpen: Driver<Bool>
    }
    
    func transform(input: Input) -> Output {
        let isSideMenuOpen = BehaviorRelay<Bool>(value: false)
        
        input.tapSideMenuBtn.bind(onNext: { _ in
            print(isSideMenuOpen.value)
            isSideMenuOpen.accept(!isSideMenuOpen.value)
        }).disposed(by: bag)
        
        return Output(isSideMenuOpen: isSideMenuOpen.asDriver(onErrorJustReturn: false))
    }
    
}

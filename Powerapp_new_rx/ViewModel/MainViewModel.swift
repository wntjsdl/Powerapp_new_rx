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

protocol MainViewModelType {
    associatedtype Dependency
    associatedtype Input
    associatedtype Output
    
    var dependency: Dependency { get }
    var disposeBag: DisposeBag { get set }
    
    var input: Input { get }
    var output: Output { get }
    
    init(dependency: Dependency)
}

final class MainViewModel: MainViewModelType {
    
    struct Dependency {
        var collectionViewArray: [String]?
    }
    
    struct Input {
        var sideMenuToggle: AnyObserver<Bool>
    }
    
    struct Output {
        var isSideMenuOpen: Driver<Bool>
    }
    
    let dependency: Dependency
    var disposeBag: DisposeBag = DisposeBag()
    let input: Input
    let output: Output
    
    private let sideMenuToggle$: Observable<Bool>
    
    init(dependency: Dependency = Dependency(collectionViewArray: nil)) {
        self.dependency = dependency
        
        let collectionViewArray$ = BehaviorSubject<[String]?>(value: nil)
        let sideMenuToggle$ = Observable<Bool>
        let isSideMenuOpen$ = Observable.just(sideMenuToggle$)
            .asDriver(onErrorRecover: false)
        
        self.input = Input(sideMenuToggle: sideMenuToggle$.asObserver())
        self.output = Output(isSideMenuOpen: isSideMenuOpen$)
        
        self.sideMenuToggle$ = sideMenuToggle$
    }
    
}

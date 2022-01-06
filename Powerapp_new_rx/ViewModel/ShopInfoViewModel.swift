//
//  ShopInfoViewModel.swift
//  Powerapp_new_rx
//
//  Created by KJS on 2022/01/06.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

protocol ShopInfoViewModelInputs {
}

protocol ShopInfoViewModelOutputs {
}

protocol ShopInfoViewModelType {
    var inputs: ShopInfoViewModelInputs { get }
    var outputs: ShopInfoViewModelOutputs { get }
}

final class ShopInfoViewModel: ShopInfoViewModelType, ShopInfoViewModelInputs, ShopInfoViewModelOutputs {
    
    var inputs: ShopInfoViewModelInputs { return self }
    var outputs: ShopInfoViewModelOutputs { return self }
    
}

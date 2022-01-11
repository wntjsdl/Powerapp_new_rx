//
//  ViewModel.swift
//  Powerapp_new_rx
//
//  Created by KJS on 2022/01/11.
//

import Foundation
import RxCocoa

protocol ViewModel: class {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

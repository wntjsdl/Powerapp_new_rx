//
//  MainViewController.swift
//  Powerapp_new_rx
//
//  Created by KJS on 2022/01/05.
//

import UIKit
import WebKit
import RxSwift
import RxCocoa
import RxWebKit
import SnapKit

class MainViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    var webView: WKWebView!
//    var url: String = "http://www.naver.com/"
    
    var testView: UIView!
    var testLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: self.view.bounds)
        view.addSubview(webView)
        
        webView.rx.title
            .subscribe(onNext: {
                let title = $0 ?? ""
                super.navigationController?.navigationBar.topItem?.title = title
                #if DEBUG
                print("""
----------------------------------------------------------------------------
File: \(#file.components(separatedBy: "/").last ?? ""), Function: \(#function), Line: \(#line)
title: \(title)
----------------------------------------------------------------------------
""")
                #endif
            })
            .disposed(by: disposeBag)
        
        webView.rx.url
            .subscribe(onNext: {
                #if DEBUG
                print("""
----------------------------------------------------------------------------
File: \(#file.components(separatedBy: "/").last ?? ""), Function: \(#function), Line: \(#line)
url: \($0)
----------------------------------------------------------------------------
""")
                #endif
            })
            .disposed(by: disposeBag)
        
        let url = URL(string: "http://www.naver.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
//        testView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
//        testView.backgroundColor = .white
        
//        testLabel = UILabel(frame: CGRect(x: 200, y: 200, width: 100, height: 30))
//        testLabel.text = "test"
        
//        view.addSubview(testView)
//        view.addSubview(testLabel)

        // Do any additional setup after loading the view.
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

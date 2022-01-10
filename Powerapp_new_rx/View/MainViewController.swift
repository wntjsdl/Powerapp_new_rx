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
import Moya

class MainViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    var webView: WKWebView!
//    var url: String = "http://www.naver.com/"
    
    var testView: UIView!
    var testLabel: UILabel!
    
    var shopInfo: ShopInfoModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: self.view.bounds)
        webView.allowsBackForwardNavigationGestures = true
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
        
        
        let shopURL = Bundle.main.object(forInfoDictionaryKey: "ShopURL") as! String
        let url = URL(string: "http://\(shopURL)")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        
        let provider = MoyaProvider<PowerApp>()
        provider.request(.getShopInfo(admin_id: "cocenstore", type: "get_Setting_data", user_id: "OTk5OQ==")) { result in
            switch result {
            case let .success(moyaResponse):
                let statusCode = moyaResponse.statusCode
                print("statusCode: \(statusCode)")
                do {
//                    print("moyaResponse.mapString(): \(try moyaResponse.mapString())")
                    self.shopInfo = try moyaResponse.map(ShopInfoModel.self)
                    print("self.shopInfo: \(self.shopInfo)")
                } catch (let err) {
                    print(err.localizedDescription)
                }
                
            case let .failure(error):
                print("error")
            }
        }
        
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

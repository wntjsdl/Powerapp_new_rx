//
//  SlideMenuViewController.swift
//  Powerapp_new_rx
//
//  Created by KJS on 2022/01/11.
//

import UIKit
import SnapKit

class SlideMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading).offset(100)
        }
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

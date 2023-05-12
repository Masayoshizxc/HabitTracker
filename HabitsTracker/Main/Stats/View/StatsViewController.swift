//
//  StatsViewController.swift
//  HabitsTracker
//
//  Created by Adilet on 11/5/23.
//

import UIKit
import SnapKit



class StatsViewController: BaseViewController{
    
    var coordinator: StatsCoordinator?
    
    private lazy var logoTitle: TitleLogo = {
        let l = TitleLogo()
        
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }
    
}

extension StatsViewController{
    func setupSubviews(){
        view.addSubview(logoTitle)
    }
    func setupConstraints(){
        logoTitle.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(20)
        }
    }
}

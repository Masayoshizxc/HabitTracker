//
//  AuthViewController.swift
//  HabitsTracker
//
//  Created by Adilet on 10/5/23.
//

import UIKit
import SnapKit
import Firebase
import GoogleSignIn


class AuthViewController: BaseViewController {
    
    weak var coordinator: MainCoordinator?
    
    private lazy var logoTitle: TitleLogo = {
        let l = TitleLogo()
        return l
    }()
    private lazy var google: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "social"), for: .normal)
//        b.frame.size = CGSize(width: 20, height: 20)
        b.backgroundColor = .white
        b.layer.cornerRadius = 10
        return b
    }()
    private lazy var emailField: UITextField = {
        let t = UITextField()
        t.layer.cornerRadius = 14
        t.backgroundColor = .white
        t.textAlignment = .center
        t.placeholder = "Email"
        t.autocapitalizationType = .none
        return t
    }()
    private lazy var passwordField: UITextField = {
        let t = UITextField()
        t.layer.cornerRadius = 14
        t.backgroundColor = .white
        t.textAlignment = .center
        t.placeholder = "Password"
        t.autocapitalizationType = .none
        return t
    }()
    private lazy var loginButton: UIButton = {
        let b = UIButton()
        b.contentMode = .center
        b.setTitle("Login", for: .normal)
        b.setTitleColor(.darkGray, for: .normal)
        b.backgroundColor = .white
        b.layer.cornerRadius = 14
        b.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return b
    }()
    private lazy var registerButton: UIButton = {
        let b = UIButton()
        b.setTitle("Register", for: .normal)
        b.contentMode = .center
        b.backgroundColor = .none
        b.setTitleColor(.white, for: .normal)
        b.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        
    }
    
    func setupGoogleSignIn(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
          guard error == nil else {
            return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)

          // ...
        }
//        GIDSignIn.sharedInstance.presentingViewController = self
//        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    @objc func registerTapped(){
        
        coordinator?.register()

    }
    @objc func loginTapped(){
        
        
        coordinator?.goTabBar()
        
    }
    

}

extension AuthViewController {
    func setupSubviews(){
        view.addSubview(logoTitle)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.addSubview(google)
    }
    
    func setupConstraints(){
        logoTitle.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            
        }
        emailField.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoTitle.snp.bottom).offset(325)
            make.height.equalTo(52)
            make.left.right.equalToSuperview().inset(75)
        }
        passwordField.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailField.snp.bottom).offset(14)
            make.height.equalTo(52)
            make.left.right.equalToSuperview().inset(75)
            
        }
        loginButton.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordField.snp.bottom).offset(64)
            make.height.equalTo(52)
            make.left.equalToSuperview().inset(75)
            make.right.equalToSuperview().inset(132)
        }
        registerButton.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(50)
        }
        google.snp.makeConstraints{make in
            
            make.centerY.equalTo(loginButton)
            make.left.equalTo(loginButton.snp.right).offset(5)
            make.width.height.equalTo(52)
        }
    }
}

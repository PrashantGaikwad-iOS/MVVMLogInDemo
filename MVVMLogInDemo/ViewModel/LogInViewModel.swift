//
//  LogInViewModel.swift
//  MVVMLogInDemo
//
//  Created by Prashant Gaikwad on 21/05/21.
//

import Foundation

class LogInViewModel: NSObject {
    //MARK:- Properties
    var user: User!
    var usernameString: String {
        return user.userName
    }
    var emailString: String {
        return user.email
    }
    
    typealias loginVMCompletion = (_ status: Bool, _ message: String) -> Void
    var loginCallBack:loginVMCompletion?
    
    //MARK:- Actions
    func loginUser(_ userName: String?, password: String?) {
        guard let username = userName, let password = password else {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if username.count == 0 || password.count == 0 {
                self?.loginCallBack?(false, "username / password should not be empty")
            } else {
                self?.loginApiCall(username: username, password: password)
            }
        }
    }
    
    fileprivate func loginApiCall(username: String, password: String) {
        if username == "prashant" && password == "12345" {
            user = User(userName: username, email: "\(username)@gmail.com")
            self.loginCallBack?(true, "logged in with user: \(user.userName) and email: \(user.email)")
        } else {
            // invalid credentials
            self.loginCallBack?(false, "invalid credentials")
        }
    }
    
    func loginCompletionHandler(completionHandler: @escaping loginVMCompletion) {
        self.loginCallBack = completionHandler
    }
}

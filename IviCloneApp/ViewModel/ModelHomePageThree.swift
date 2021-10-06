//
//  ModelHomePageThree.swift
//  IviCloneApp
//
//  Created by Denis on 29.09.2021.
//

import SwiftUI
import Firebase

class SignUpModel: ObservableObject{
    
    @Published var Viewregist = false
    @Published var textReg = ""
    @Published var passReg = ""
    @Published var repassReg = ""
    
    @Published var loginSign = ""
    @Published var passwordSign = ""
    @Published var ViewSignUp = false
    
    @Published var alerMsg = ""
    @Published var alerBool = false
    @Published var alerBoolRes = false
    
    @Published var Profile = false
    @Published var showRegButt = true
    
    @Published var ShowPasswordOne = false
    @Published var ShowPasswordTwo = false
    @Published var NewProfile = false
    
    
    // Picker Control
   @Published var IMGSHOW = false
    @Published var showImage = false
    @Published var ImageData = Data.init(count: 0)
    
    // Alert Pay

    func ResetPassword(){
       
        let alerBoolRes = UIAlertController(title: "Сброс пароля", message: "Введите ваш E-mail, чтобы сбросить пароль", preferredStyle: .alert)
        alerBoolRes.addTextField{(password) in
            password.placeholder = "Email"
        }
        
        let proceedReset = UIAlertAction(title: "Сброс", style: .default){ (_) in
            if alerBoolRes.textFields![0].text! != ""{
                Auth.auth().sendPasswordReset(withEmail: alerBoolRes.textFields![0].text!){(err) in
                    if err != nil{
                        self.alerMsg = err!.localizedDescription
                        self.alerBoolRes.toggle()
                        return
                    }
                    
                    self.alerMsg = "Ссылка отправлена на Email"
                    self.alerBoolRes.toggle()
                    
                    
                    
                }
            
            }
            
            
        }
        
        let cancelButt = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        
        alerBoolRes.addAction(cancelButt)
        alerBoolRes.addAction(proceedReset)
        
        
        
        UIApplication.shared.windows.first?.rootViewController?.present(alerBoolRes, animated: true)
       
    }
    
    func RegistrView(){
        
        if textReg == "" || passReg == "" || repassReg == "" {
            self.alerMsg = "Не заполнены все строки"
            self.alerBool.toggle()
            self.Profile.toggle()
            return
        }
        
        if passReg != repassReg{
            self.alerMsg = "Введенные пароли не совпадают"
            self.alerBool.toggle()
            self.Profile.toggle()
            return
        }
        
        
        Auth.auth().createUser(withEmail: textReg, password: passReg){(UserCreat, err) in
            
            if err != nil {
                self.alerMsg = err!.localizedDescription
                self.alerBool.toggle()
                self.Profile.toggle()
                return
            }
            
            UserCreat?.user.sendEmailVerification(completion: {(err) in
                if err != nil {
                    self.alerMsg = err!.localizedDescription
                    self.alerBool.toggle()
                    self.Profile.toggle()
                    return
                }
                
                self.alerMsg = "Сообщение отправлено на почту"
                self.alerBool.toggle()
                self.Profile.toggle()
                
            })
            
        }
    }
    
    func LoginSignUP(){
        
        if loginSign == "" || passwordSign == "" {
            self.alerMsg = "Не заполнены все поля"
            self.alerBool.toggle()
           
            return
        }
        
        Auth.auth().signIn(withEmail: loginSign, password: passwordSign){(userSign, err) in
            
            if err != nil {
                self.alerMsg = err!.localizedDescription
                self.alerBool.toggle()
               
                return
            }
            
            let user = Auth.auth().currentUser
            
            if !user!.isEmailVerified {
                self.alerMsg = "Пожалуйста подтвердите почту"
                self.alerBool.toggle()
               
                
                try! Auth.auth().signOut()
                
                return
                
                
            }
            self.NewProfile.toggle()
            self.Profile.toggle()
           
        }
    }
    
    func LogOut(){
        
        try! Auth.auth().signOut()
            
       textReg = ""
      passReg = ""
      repassReg = ""
        loginSign = ""
        passwordSign = ""
        
    }
}

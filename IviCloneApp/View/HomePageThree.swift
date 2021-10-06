//
//  HomePageThree.swift
//  IviCloneApp
//
//  Created by Denis on 29.09.2021.
//

import SwiftUI
import Firebase

struct HomePageThree: View {
    @StateObject var model = SignUpModel()
    @StateObject var modelHome = ModelView()
    var body: some View {
        VStack{
            SignUpPage(model: model, modelHome: modelHome)
           
        }
            
        .fullScreenCover(isPresented: $model.showImage) {ImagePick(showImage: self.$model.showImage, ImageData: self.$model.ImageData)
        }
           
    }
    }


struct HomePageThree_Previews: PreviewProvider {
    static var previews: some View {
        HomePageThree()
    }
}

struct SignUpPage: View {
    @ObservedObject var model: SignUpModel
    @ObservedObject var modelHome: ModelView
    var body: some View{
        
        ZStack{
        ScrollView{
        VStack{
            
            VStack(alignment: .leading){
                if model.NewProfile == false{
                HStack{
                    Button(action: {self.model.Profile.toggle()}, label: {
                    Text("Войти или зарегистрироваться")
                        .foregroundColor(Color.white.opacity(0.70))
                        .padding()
                        .background(Color.red)
                        .cornerRadius(20)
                    }).disabled(model.Profile == false ? false : true)
                    Spacer()
                }.padding(.leading, 15)
                }else {
                    ProfilSign(model: model)
                }
            }
 
            HStack{
                VStack(alignment: .leading, spacing: 45){
                            Text("Подписки")
                                .foregroundColor(Color.white.opacity(0.70))
                                .padding(.leading, 15)
                    Text("Перейти к подключению")
                        .foregroundColor(Color.white.opacity(0.70))
                        .padding(.leading, 15)
               
                }.padding([.bottom, .top], 10)
                     Spacer()

            }.background(Color.blue)
            .cornerRadius(15)
            .padding([.leading, .trailing], 15)
            
            HStack{
                VStack(alignment: .leading, spacing: 45){
                    HStack{
                            Text("Мой счет ivi")
                                .foregroundColor(Color.white.opacity(0.70))
                                .padding(.leading, 15)
                        Spacer()
                        Button(action: {self.modelHome.alertPay.toggle()}, label: {
                            Text("Пополнить")
                                .foregroundColor(Color.white.opacity(0.70))
                        })
                    }
                    Text(String(format:"P \(modelHome.updateSum)"))
                        .foregroundColor(Color.white.opacity(0.70))
                        .padding(.leading, 15)
               
                }.padding([.bottom, .top], 10)
                     Spacer()

            }.background(Color.blue)
            .cornerRadius(15)
            .padding([.leading, .trailing], 15)
            
            VStack(alignment: .center){
                HStack(){
                    Image(systemName: "network")
                    Text("Пригласить друзей")

                }.frame(maxWidth: .infinity)
                .foregroundColor(Color.white.opacity(0.70))
                .padding(.vertical, 25)
                .background(Color.blue)
                .cornerRadius(15)
                .padding([.leading, .trailing], 15)
                HStack{
                    Image(systemName: "bell")
                Text("Уведомления")
                   
                }.frame(maxWidth: .infinity)
                .foregroundColor(Color.white.opacity(0.70))
                .padding(.vertical, 25).background(Color.blue)
                .cornerRadius(15)
                .padding([.leading, .trailing], 15)
                HStack{
                    Image(systemName: "rosette")
                Text("Активация сертификата")
                 
                }.frame(maxWidth: .infinity)
                .foregroundColor(Color.white.opacity(0.70))
                .padding(.vertical, 25)
                .background(Color.blue)
                .cornerRadius(15)
                .padding([.leading, .trailing], 15)
             
            }
            
            HStack{
                VStack{
                Image(systemName: "bag")
                Text("Покупки")
                }.frame(maxWidth: .infinity)
                .foregroundColor(Color.white.opacity(0.70))
                .padding(.vertical, 25)
                .background(Color.blue)
                .cornerRadius(15)
                .padding(.leading, 15)
                VStack{
                    Image(systemName: "tag")
                Text("Чеки")
                }.frame(maxWidth: .infinity)
                .foregroundColor(Color.white.opacity(0.70))
                .padding(.vertical, 25)
                .background(Color.blue)
                .cornerRadius(15)
                .padding(.trailing, 15)
                
            }
        
            HStack{
                VStack{
                Image(systemName: "bookmark")
                    Text("Смотреть позже")
                }.frame(maxWidth: .infinity)
                .foregroundColor(Color.white.opacity(0.70))
                .padding(.vertical, 25)
                .background(Color.blue)
                .cornerRadius(15)
                .padding(.leading, 15)
                VStack{
                    Image(systemName: "clock.arrow.circlepath")
                    Text("Просмотры")
                }.frame(maxWidth: .infinity)
                .foregroundColor(Color.white.opacity(0.70))
                .padding(.vertical, 25)
                .background(Color.blue)
                .cornerRadius(15)
                .padding(.trailing, 15)
                
            }
            
            HStack{
                VStack{
                Image(systemName: "play.tv")
                    Text("Вход по коду")
                }.frame(maxWidth: .infinity)
                .foregroundColor(Color.white.opacity(0.70))
                .padding(.vertical, 25)
                .background(Color.blue)
                .cornerRadius(15)
                .padding(.leading, 15)
                VStack{
                    Image(systemName: "gearshape")
                    Text("Настройки")
                }.frame(maxWidth: .infinity)
                .foregroundColor(Color.white.opacity(0.70))
                .padding(.vertical, 25)
                .background(Color.blue)
                .cornerRadius(15)
                .padding(.trailing, 15)
                
            }
            
            HStack{
                VStack{
                Image(systemName: "person.crop.circle.badge.questionmark")
                    Text("Помощь")
                }.frame(maxWidth: .infinity)
                .foregroundColor(Color.white.opacity(0.70))
                .padding(.vertical, 25)
                .background(Color.blue)
                .cornerRadius(15)
                .padding(.leading, 15)
                VStack{
                    Image(systemName: "info.circle.fill")
                    Text("О сервисе")
                }.frame(maxWidth: .infinity)
                .foregroundColor(Color.white.opacity(0.70))
                .padding(.vertical, 25)
                .background(Color.blue)
                .cornerRadius(15)
                .padding(.trailing, 15)
                
            }
        }
        }.background(Color.black.opacity(0.80)
                        .edgesIgnoringSafeArea(.all))
        .fullScreenCover(isPresented: $model.Viewregist, content: {
            ViewRegistCust(model: model)
        })
        
            if modelHome.alertPay == true{
                PayPaments(model: model, modelHome: modelHome)
            }
            if model.Profile == true{
                MiniViewSign(model: model)
            }
            if model.Viewregist == true {
                ViewRegistCust(model: model)
            }
            
        }
    }
}

struct ViewRegistCust: View {
    @ObservedObject var model: SignUpModel
    
    var body: some View{
        NavigationView{
            VStack{
            VStack(alignment: .leading){
                Text("Зарегистрируйтесь")
                    .font(.system(size: 22))
                    .foregroundColor(Color.white.opacity(0.80))
                Text("чтобы пользоваться сервисом на любом устройстве")
                    .foregroundColor(Color.white.opacity(0.80))
            }.padding(.all, 10)
            .background(Color.blue)
            .cornerRadius(15)
            .padding([.leading, .trailing], 15)
                HStack{
                    Image("vk")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                    Image("facebook")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                }
                VStack{
                    TextField("Введите Email или телефон", text: $model.textReg)
                        .padding(.vertical, 10)
                        .padding(.leading, 10)
                        .background(Color.black.opacity(0.20))
                        .shadow(radius: 3)
                        .cornerRadius(20)
                    HStack{
                        if model.ShowPasswordOne == true{
                    TextField("Введите пароль", text: $model.passReg)
                        .padding(.vertical, 10)
                        .padding(.leading, 10)
                        .background(Color.black.opacity(0.20))
                        .shadow(radius: 3)
                        .cornerRadius(20)
                        } else {
                            SecureField("Введите пароль", text: $model.passReg)
                                .padding(.vertical, 8)
                                .padding(.leading, 10)
                                .background(Color.black.opacity(0.20))
                                .shadow(radius: 3)
                                .cornerRadius(20)
                        }
                        Button(action: {model.ShowPasswordOne.toggle()}, label: {
                            Image(systemName: model.ShowPasswordOne == false ? "eye.slash" : "eye")
                        })
                    }.padding(.bottom, 1)
                    HStack{
                        if model.ShowPasswordTwo == true{
                    TextField("Введите пароль", text: $model.repassReg)
                        .padding(.vertical, 10)
                        .padding(.leading, 10)
                        .background(Color.black.opacity(0.20))
                        .shadow(radius: 3)
                        .cornerRadius(20)
                        } else {
                            SecureField("Введите пароль", text: $model.repassReg)
                                .padding(.vertical, 8)
                                .padding(.leading, 10)
                                .background(Color.black.opacity(0.20))
                                .shadow(radius: 3)
                                .cornerRadius(20)
                        }
                        Button(action: {model.ShowPasswordTwo.toggle()}, label: {
                            Image(systemName: model.ShowPasswordTwo == false ? "eye.slash" : "eye")
                        })
                    }
                    
                }.padding(.horizontal, 15)
                HStack{
                    Button(action: model.RegistrView, label: {
                    Text("Зарегистрироваться")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.semibold)
                })
                }.frame(maxWidth: .infinity)
                .padding(.vertical, 5)
                .background(model.textReg == "" ? Color.blue.opacity(0.30) : Color.blue.opacity(0.70))
                .cornerRadius(20)
                .padding(.horizontal, 15)
                Spacer()
            }
            .padding(.top, 15)
            
            .navigationBarItems(leading: Button(action: {self.model.Viewregist.toggle()
                self.model.Profile.toggle()
            }, label: {
                Image(systemName: "arrowshape.turn.up.left")
                    .resizable()
                    .frame(width: 30, height: 30)
                   
            })).padding(.trailing, 15)
            .navigationBarTitle("Войти или зарегистрироваться")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .fullScreenCover(isPresented: $model.ViewSignUp, content: {
            ViewLoginSignUpCust(model: model)
        })
        
        .alert(isPresented: $model.alerBool, content: {
            Alert(title: Text("Сообщение"), message: Text(model.alerMsg), dismissButton: .destructive(Text("Ok"), action: {
                if model.alerMsg == "Сообщение отправлено на почту" {
                    model.Viewregist.toggle()
                    model.textReg = ""
                    model.passReg = ""
                    model.repassReg = ""
                    
                }
            }))
        })
        
    }
}

struct ViewLoginSignUpCust: View {
    @ObservedObject var model: SignUpModel
    var body: some View{
      
        NavigationView{
            VStack{
                VStack{
                    TextField("Введите Email или телефон", text: $model.loginSign)
                        .padding(.vertical, 10)
                        .padding(.leading, 10)
                        .background(Color.black.opacity(0.20))
                        .shadow(radius: 3)
                        .cornerRadius(20)
                    SecureField("Введите пароль", text: $model.passwordSign)
                        .padding(.vertical, 10)
                        .padding(.leading, 10)
                        .background(Color.black.opacity(0.20))
                        .shadow(radius: 3)
                        .cornerRadius(20)
                }.padding(.horizontal, 15)
                HStack{
                    Button(action: {
                        model.LoginSignUP()
                    }, label: {
                    Text("Войти")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.semibold)
                })
                }.frame(maxWidth: .infinity)
                .padding(.vertical, 5)
                .background(model.loginSign == "" || model.passwordSign == "" ? Color.blue.opacity(0.30) : Color.blue.opacity(0.70))
                .cornerRadius(20)
                .padding(.horizontal, 15)
                
              
            }
            
            .navigationBarItems(leading: Button(action: {self.model.ViewSignUp.toggle()}, label: {
                Image(systemName: "arrowshape.turn.up.left")
                    .resizable()
                    .frame(width: 30, height: 30)
                   
            }))
            .navigationBarTitle("Войти")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
       
    }
}


struct MiniViewSign: View{
    @ObservedObject var model: SignUpModel
    var body: some View{
        
        VStack(spacing: 15){
            HStack{
                if model.showRegButt == false{
                Button(action: {model.showRegButt.toggle()}, label: {
                    Image(systemName: "chevron.backward.square")
                })
                }
                Spacer()
                Button(action: {self.model.Profile.toggle()
                    self.model.showRegButt = true
                }, label: {
                    Image(systemName: "xmark.seal")
                })
            }
            if model.showRegButt == true{
            Button(action: {self.model.Viewregist.toggle()}, label: {
                Text("Зарегистрироваться")
            })
            } else {
                VStack{
                TextField("Введите Email или телефон", text: $model.loginSign)
                    .padding(.vertical, 10)
                    .padding(.leading, 10)
                    .background(Color.black.opacity(0.20))
                    .shadow(radius: 3)
                    .cornerRadius(20)
                SecureField("Введите пароль", text: $model.passwordSign)
                    .padding(.vertical, 10)
                    .padding(.leading, 10)
                    .background(Color.black.opacity(0.20))
                    .shadow(radius: 3)
                    .cornerRadius(20)
            }.padding(.horizontal, 15)
            }
            if model.showRegButt == true{
            Button(action: {model.showRegButt.toggle()}, label: {
                Text("Войти")
            })
            } else {
                Button(action: {
                    model.LoginSignUP()
                }, label: {
                    Text("Вход в аккаунт")
                })
            }
            Button(action: model.ResetPassword, label: {
                Text("Забыл пароль")
            })
        }.padding(.all, 30)
        .background(Color.orange)
        .cornerRadius(15)
        .padding(.horizontal, 15)
        
        .alert(isPresented: $model.alerBoolRes, content: {
            Alert(title: Text("Сообщение"), message: Text(model.alerMsg), dismissButton: .destructive(Text("Ok")))
        })
        
        .alert(isPresented: $model.alerBool, content: {
            Alert(title: Text("Сообщение"), message: Text(model.alerMsg), dismissButton: .destructive(Text("Ok"), action: {
                if model.alerMsg == "Сообщение отправлено на почту" {
                    model.Viewregist.toggle()
                    model.textReg = ""
                    model.passReg = ""
                    model.repassReg = ""
                    
                }
            }))
        })
    }
}


struct ProfilSign: View{
    @ObservedObject var model: SignUpModel
    var body: some View{
        
        HStack{
            HStack{
            if model.ImageData.count == 0 {
                Button(action: {self.model.showImage.toggle()}, label: {
                    Text("+")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                })
               
            } else {
                Button(action: {self.model.showImage.toggle()}, label: {
                    Image(uiImage: UIImage(data: model.ImageData)!)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(50)
                })
            }
            }.padding(.leading, 15)
         
            HStack{
            
        VStack(alignment: .leading, spacing: 45){
                  
            Text("Имя \(Auth.auth().currentUser?.email ?? "")")
            Button(action: {model.LogOut()
                self.model.NewProfile.toggle()
            }, label: {
                Text("LoggOut")
            })
       
        }
            }.padding(.leading, 15)
        Spacer()
    }.padding([.bottom, .top], 10)
        .frame(maxWidth: .infinity)
        .foregroundColor(Color.white.opacity(0.70))
        .padding(.vertical, 25)
        .background(Color.blue)
        .cornerRadius(15)
        .padding(.leading, 15)
        .padding(.trailing, 15)
        
    }
}


struct ImagePick: UIViewControllerRepresentable {
    
    @Binding var showImage: Bool
    @Binding var ImageData: Data
    
    
    func makeCoordinator() -> ImagePick.Coordin {
        return Coordin(ImageData1: $ImageData, ImageShow1: $showImage)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePick>) -> UIImagePickerController {
        let Controlproceed = UIImagePickerController()
        Controlproceed.sourceType = .photoLibrary
        Controlproceed.delegate = context.coordinator
        return Controlproceed
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePick>) {
        
    }
    
    
    class Coordin: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        @Binding var showImage: Bool
        @Binding var ImageData: Data
        
        init(ImageData1: Binding<Data>, ImageShow1: Binding<Bool>){
            _ImageData = ImageData1
            _showImage = ImageShow1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            showImage.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let img = info[.originalImage] as! UIImage
            ImageData = img.jpegData(compressionQuality: 80)!
            showImage.toggle()

        }
        
    }
    
}

struct PayPaments: View {
    @ObservedObject var model: SignUpModel
    @ObservedObject var modelHome: ModelView
    var body: some View{
        VStack{
            VStack{
                Text("Пополнить баланс")
                    .padding(.top, 10)
                    .font(.system(size: 18))
                    .foregroundColor(Color.black.opacity(0.70))
                TextField("Введите сумму", text: $modelHome.textPay)
                    .keyboardType(.numberPad)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal, 10)
                   
                Divider()
                HStack{
                    Button(action: {self.modelHome.alertPay.toggle()}, label: {
                        Text("Отмена")
                            .foregroundColor(.red)
                            .font(.system(size: 20))
                    }).padding(.horizontal,15)
                    Divider()
                    Button(action: {

                        modelHome.Payment()
                    }, label: {
                        Text("Пополнить")
                            .foregroundColor(.red)
                            .font(.system(size: 20))
                    }).padding(.horizontal,15)
                }
            }
            
            
        }.frame(width: 300, height: 150)
        .background(Color.white)
        .cornerRadius(15)
       
    }
}

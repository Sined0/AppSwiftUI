//
//  HomePage.swift
//  IviCloneApp
//
//  Created by Denis on 29.09.2021.
//

import SwiftUI

struct HomePage: View {
    @StateObject var modelHome = ModelView()
    @StateObject var model = SignUpModel()
    
    init(){
        UITabBar.appearance().barTintColor = UIColor.darkGray
    }
    var body: some View {
        ZStack{
            HomePageOne(modelHome: modelHome, model: model)
                .blur(radius:modelHome.showAlert ? 10 : 0)
            
            if modelHome.showAlert == true{
                AlertView(modelHome: modelHome, model: model)
            }
        } .fullScreenCover(isPresented: $modelHome.showFilmView0, content: {
            MoreFilm(modelHome: modelHome)
        })
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}


struct HomePageOne: View{
    
    @ObservedObject var modelHome: ModelView
    @ObservedObject var model: SignUpModel
    var body: some View{

        TabView{
            MyIvi(modelHome: modelHome).tabItem {
                VStack{
                    Image(systemName: "house.fill")
                    Text("Мой ivi")
                }
            }
            
            HomePageTwo().tabItem {
                VStack{
                    Image(systemName: "doc.text.magnifyingglass")
                    Text("Каталог")
                }
            }
            
            HomePageThree(model: model, modelHome: modelHome).tabItem {
                VStack{
                    Image(systemName: "person")
                    Text("Профиль")
                }
            }
        }
    }
}

struct HorScrolFilm: View {
    
    @ObservedObject var modelHome: ModelView
    @State var filmPost: LentaID
  
    var body: some View{
        VStack{
            Image(filmPost.image)
                .resizable()
                .frame(width: 170, height: 270)
                .cornerRadius(15)
                .padding([.trailing, .leading], 10)
            
            Text("\(filmPost.nameFilm)")
                .fontWeight(.bold)
                .frame(width: 150, alignment: .leading)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .lineLimit(1)
                .padding(.leading, 15)
            
            Text("Бесплатно")
                .frame(width: 150, alignment: .leading)
                .font(.system(size: 18))
                .foregroundColor(Color.black.opacity(0.20))
                .lineLimit(1)
                .padding(.leading, 15)
        }
    }
}

struct MyIvi: View {
    @ObservedObject var modelHome = ModelView()

    var body: some View{
        
        NavigationView{
            ScrollView{
                LazyVStack{
                    VStack{
                        HStack{
                            Image("ivi")
                                .resizable()
                                .frame(width: 80, height: 50)
                                .cornerRadius(10)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        Spacer()
                    }
                    
                    TabView(selection: $modelHome.tag){
                        ForEach(1...4, id: \.self){tag in
                            Image("p\(tag)")
                                .resizable()
                                .frame(width: 360)
                                .frame(height: self.modelHome.tag == tag ? 230 : 180)
                                .cornerRadius(15)
                                .tag(tag)
                                .padding(5)
                        }
                    }.tabViewStyle(PageTabViewStyle())
                    
                    VStack{
                        HStack{
                            Button(action: {
                                self.modelHome.showAlert.toggle()
                            }, label: {
                                Image("rub")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(100)
                                    
                                    .foregroundColor(Color.yellow)
                                    .background(Color.yellow)
                                    .clipShape(Circle())
                                
                                Text("14 дней подписки бесплатно ")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                            })
                        }
                        .padding(15)
                        .foregroundColor(Color.white)
                        .background(Color.blue.opacity(0.70))
                        .cornerRadius(15)
                    }
                    
                    VStack{
                        HStack{
                            VStack(alignment: .leading) {
                                Text("Рекомендуем вам посмотреть")
                                    .foregroundColor(.white)
                                    .font(.system(size: 21))
                                    .fontWeight(.bold)
                                
                                Text("Обновляется после каждого просмотра или оценки ")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13))
                            }.padding(.leading, 20)
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 10, height: 30)
                                .foregroundColor(.white)
                                .padding(.trailing, 15)
                        }
                        
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            VStack{
                                ForEach(modelHome.film){ ifilm in
                                    HStack{
                                        ForEach(ifilm.posterFilmNav){FilmPost in
                                            VStack{
                                                Button(action: {
                                                    modelHome.idSelf = FilmPost.id
                                                        self.modelHome.showFilmView0.toggle()
                                                }, label: {
                                                    Image(FilmPost.image)
                                                        .resizable()
                                                        .frame(width: 200, height: 300)
                                                        .cornerRadius(20)
                                                        .padding([.leading,.trailing], 15)
                                                })
                                                VStack{
                                                    Text(FilmPost.nameFilm)
                                                        .font(.system(size: 23))
                                                        .foregroundColor(Color.white)
                                                        .lineLimit(1)
                                                        .frame(width: 200, height: 30, alignment: .leading)
//                                                    HStack{
//                                                        Text("Бесплатно")
//                                                            .frame(alignment: .leading)
//                                                            .padding(.leading, 15)
//                                                            .font(.system(size: 23))
//                                                            .foregroundColor(Color.blue.opacity(0.70))
//
//                                                        Spacer()
//                                                    }
                                                }
                                            }
                                        }
                                        
                                    }
                                }
                                
                            }
                        }
                    } .padding(.top, 15)
                }
            }
            .background(Color.black.opacity(0.80).edgesIgnoringSafeArea(.all))
            .hiddenNavigationBarStyle()
        }
    }
}

struct AlertView: View {
    @ObservedObject var modelHome: ModelView
    @ObservedObject var model: SignUpModel
 
    var body: some View{
        ZStack{
            VStack{
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Button(action: {self.modelHome.showAlert.toggle()}, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding(.trailing, 25)
                            .padding(.top, 20)
                    })
                }
                Text("Подписка ivi")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                HStack{
                    Image(systemName: "play.fill")
                        .padding(.trailing, 10)
                        .foregroundColor(.red)
                Text("Подключить от 399Р")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                }
                HStack{
                    Image(systemName: "play.fill")
                        .padding(.trailing, 10)
                        .foregroundColor(.red)
                Text("Доступ к фильмам")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                }
                    HStack{
                        Image(systemName: "play.fill")
                            .padding(.trailing, 10)
                            .foregroundColor(.red)
                Text("Отсутствие рекламы")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    }
            }.padding(.horizontal, 15)
            .padding(.vertical, 15)
                Spacer()
                VStack{
                    Button(action: {
                     
                        modelHome.payPay()
                        

                }, label: {
                    Text("Приобрести за 399Р")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                
                }).padding(.all, 10)
                .background(Color.blue)
                .cornerRadius(15)
                }.padding(.bottom, 40)
        }
            .frame(width: 390, height: 860)
            .cornerRadius(20)
        } .background(Color.blue.opacity(0.24))
        
        
    }
}

struct MoreFilm: View{
    @ObservedObject var modelHome: ModelView
    
    var body: some View{

        NavigationView{
        ZStack{
            ZStack{
                Color.black.opacity(0.80).edgesIgnoringSafeArea(.all)
            }
                ZStack{
            VStack{
                    Image("f\(modelHome.idSelf)")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .cornerRadius(20)
                        .padding(.horizontal, 1)
                        .padding(.top, 10)
                    Spacer()
            }
            }
            ZStack{
                VStack{
                    let New = modelHome.filmS[modelHome.idSelf]
                    Text("\(modelHome.filmInfo[New ?? ""] ?? "")")
                        .padding(.top, 10)
                        .padding(.horizontal, 5)

                    Spacer()
                    Button(action: {
                        modelHome.payFilm()
                    }, label: {
                        Text(String(format:"Купить за %.0f", modelHome.filmCost[modelHome.idSelf] ?? 0))
                            .foregroundColor(.white)
                            .font(.title)
                            .padding(.bottom, 10)
                    })
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                .cornerRadius(20)
                .padding(.horizontal, 1)
                .edgesIgnoringSafeArea(.bottom)
                .padding(.top, 230)
        }
        }
        .navigationBarTitle(modelHome.filmS[modelHome.idSelf] ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: { self.modelHome.showFilmView0.toggle()}, label: {
            Text("< Back")
                .foregroundColor(.black)
        }))
        }
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier(HiddenNavigationBar() )
    }
}

struct ScrollFilmView: Identifiable {
    var id: Int
    var posterFilmNav: [LentaID]
}

struct LentaID: Identifiable {
    
    var id: Int
    var nameFilm: String
    var image: String
    
}

struct PosterID: Identifiable {
    var id: Int
    var name: String
    
}

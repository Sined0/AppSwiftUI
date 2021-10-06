//
//  HomePageTwo.swift
//  IviCloneApp
//
//  Created by Denis on 29.09.2021.
//

import SwiftUI

struct HomePageTwo: View {
    @StateObject var modelHome = ModelView()
    @StateObject var modelHomeTwo = ModelViewTwo()
    var body: some View {
        VStack{
            TextFieldCust(modelHome: modelHome, modelHomeTwo: modelHomeTwo)
            
        } .fullScreenCover(isPresented: $modelHome.showFilmView0, content: {
            MoreFilm(modelHome: modelHome)
        })
    }
}

struct HomePageTwo_Previews: PreviewProvider {
    static var previews: some View {
        HomePageTwo()
    }
}


struct TextFieldCust: View {
    
    @State private var filmSearch = ["First player", "Fire", "Ice", "FireBoll", "Dzhon Yik", "Avengers", "Dzhons Walker", "Malificenta"]
    @ObservedObject var modelHome: ModelView
    @ObservedObject var modelHomeTwo: ModelViewTwo
    
    var body: some View{
    
        VStack{
            HStack{
                HStack{
                    TextField("", text: $modelHomeTwo.searchBar)
                        .padding(.leading, 10)
                        .padding(.top, modelHomeTwo.searchBar.isEmpty == false ? 20 : 0)
                        .accentColor(modelHomeTwo.CancelButt == true ? Color.blue : Color.clear)
                        .placeHold(when: modelHomeTwo.searchBar.isEmpty){
                            Text("Фильмы, персоны, жанры")
                                .foregroundColor(.gray)
                                .padding(.bottom, modelHomeTwo.searchBar.isEmpty == false ? 20 : 0)
                                .padding(.vertical, modelHomeTwo.searchBar.isEmpty == false ? 0 : 11)
                        }
                        .keyboardType(.URL)
                        .onTapGesture {
                            if modelHomeTwo.CancelButt == false {
                                modelHomeTwo.CancelButt.toggle()
                            }
                        }
                    Button(action: {
                        if modelHomeTwo.searchBar.isEmpty == false {
                            self.modelHomeTwo.searchBar = ""
                        }
                    }, label: {
                        Image(systemName: modelHomeTwo.searchBar.isEmpty == true ? "magnifyingglass" : "xmark.circle")
                            .foregroundColor(Color.gray)
                            .padding(.top, modelHomeTwo.searchBar.isEmpty == false ? 20 : 0)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                    })
                }
                .padding(.vertical, 15)
                .background(Color.white.opacity(0.80))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.leading,10)
                .padding(.trailing, 10)
                .animation(.spring())
                
                if modelHomeTwo.CancelButt == true {
                    HStack{
                        Button(action: {
                            self.modelHomeTwo.CancelButt.toggle()
                            self.modelHomeTwo.searchBar = ""
                            self.modelHomeTwo.textActiv = false
                        }, label: {
                            Text("Отмена")
                                .padding(.horizontal, 5)
                        })
                    }
                    .padding(.vertical, 15)
                    .padding(.trailing, 10)
                    .animation(.spring())
                    
                }
            }
            
            ZStack{
                
                VStack{
                    DashSelect(modelHomeTwo: modelHomeTwo)
                        .padding(.top, 10)

                    ScrollView{
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    HStack{
                                        Image(systemName: "slider.horizontal.3")
                                        Text("Фильтры")
                                    }.padding(.all, 10)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                                    Text("Семейные комедии")
                                        .padding(.all, 10)
                                        .background(Color.blue)
                                        .cornerRadius(20)
                                    Text("Комедии 2020")
                                        .padding(.all, 10)
                                        .background(Color.blue)
                                        .cornerRadius(20)
                                    Text("На языке оригинала")
                                        .padding(.all, 10)
                                        .background(Color.blue)
                                        .cornerRadius(20)
                                } .padding(.top, 10)
                                .padding(.leading, 15)
                            }
                        FilmBlock(modelHome: modelHome, modelHomeTwo: modelHomeTwo)
                    }
                    .background(Color.black.opacity(0.30)
                                    .edgesIgnoringSafeArea(.all))
                }
                VStack{
                    if modelHomeTwo.CancelButt == true{
                        VStack{
                            if modelHomeTwo.searchBar.isEmpty == true{
                                HStack{
                                    VStack(alignment: .leading){
                                        
                                        Text("Премьера фильмов")
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .padding(.vertical, 10)
                                        Text("Новинки подписки")
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .padding(.vertical, 10)
                                        Text("Сериалы Amediateka")
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .padding(.vertical, 10)
                                        Text("Высокий рейтинг")
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .padding(.vertical, 10)
                                    }
                                    .padding(.leading, 15)
                                    
                                    Spacer()
                                }
                                .background(Color.black.opacity(1)
                                                .edgesIgnoringSafeArea(.all))
                                
                            } else {
                                HStack{
                                    VStack(alignment: .leading){
                                        ForEach(modelHomeTwo.searchBar == "" ? filmSearch: filmSearch.filter{$0.contains(modelHomeTwo.searchBar)}, id: \.self){ifif in
                                            Text("\(ifif)")
                                                .font(.system(size: 20))
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                                .padding(.vertical, 10)
                                        }
                                    }
                                    .padding(.leading, 15)
                                    Spacer()
                                }
                                .background(Color.black.opacity(1)
                                                .edgesIgnoringSafeArea(.all))
                            }
                        }
                        
                    }
                    Spacer()
                    
                }
            }
        } .background(Color.black.opacity(0.80)
                        .edgesIgnoringSafeArea(.all))
    }
}

struct ModifTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.blue)
            .background(Color.gray)
            .cornerRadius(20)
    }
}

extension View{
    func placeHold<Content: View>(
        when Show: Bool,
        @ViewBuilder placeHold: () -> Content) -> some View{
        ZStack(alignment: .leading){
            
            placeHold().keyboardType(.URL)
                .padding(.leading, 10).padding(.vertical, 5)
            self
        }
    }
}

struct DashSelect: View {
        @ObservedObject var modelHomeTwo: ModelViewTwo
    
    var body: some View{
 
        ScrollView(.horizontal, showsIndicators: false){
            VStack{
                
                HStack(spacing: 20){
                    Text("Фильмы")
                        .font(.system(size: 22)).tag(0)
                        .onTapGesture {
                            self.modelHomeTwo.tag = 0
                        }
                    Text("Сериалы")
                        .font(.system(size: 22)).tag(1)
                        .onTapGesture {
                            self.modelHomeTwo.tag = 1
                        }
                    Text("Мультфильмы")
                        .font(.system(size: 22)).tag(2)
                        .onTapGesture {
                            self.modelHomeTwo.tag = 2
                        }
                    Text("ТВ-каналы")
                        .font(.system(size: 22)).tag(3)
                        .onTapGesture {
                            self.modelHomeTwo.tag = 3
                        }
                }.padding(.trailing, 15)
                .padding(.leading,20)
                ZStack{
                    
                    HStack{
                        RoundedRectangle(cornerRadius: 0)
                            .foregroundColor(.gray)
                            .frame(height: 10)
                    }.padding(.leading,20)
                    .padding(.trailing,15)
                    VStack{
                        HStack{
                            RoundedRectangle(cornerRadius: 0)
                                .frame(width: 85, height: 10)
                                .foregroundColor(modelHomeTwo.tag == 0 ? Color.blue : Color.gray)
                                .tag(0)
                            
                            RoundedRectangle(cornerRadius: 0)
                                .frame(width: 91, height: 10)
                                .foregroundColor(modelHomeTwo.tag == 1 ? Color.blue : Color.gray)
                                .padding(.leading, 10)
                                .tag(1)
                            
                            RoundedRectangle(cornerRadius: 0)
                                .frame(width: 145, height: 10)
                                .foregroundColor(modelHomeTwo.tag == 2 ? Color.blue : Color.gray)
                                .padding(.leading, 10)
                                .tag(2)
                            
                            RoundedRectangle(cornerRadius: 0)
                                .frame(width: 110, height: 10)
                                .foregroundColor(modelHomeTwo.tag == 3 ? Color.blue : Color.gray)
                                .padding(.leading, 10)
                                .tag(3)
                            
                            Spacer()
                            
                            
                        } .padding(.leading,20)
                    }  .padding(.vertical, 5)
                }
            }
        }
    }
}

struct FilmBlock: View {
    
    var ZhanriFilm: [ZhanrFilmBlock] = [
    ZhanrFilmBlock(id: 0, Image: "z1", name: "Музыка"),
        ZhanrFilmBlock(id: 1, Image: "z2", name: "Спорт"),
        ZhanrFilmBlock(id: 2, Image: "z3", name: "Драма"),
        ZhanrFilmBlock(id: 3, Image: "z4", name: "Боевик"),
        ZhanrFilmBlock(id: 4, Image: "z5", name: "История"),
    ]
    
    @ObservedObject var modelHome: ModelView
    @ObservedObject var modelHomeTwo: ModelViewTwo
    var body: some View{
  
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Text("Фильмы - новинки")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.leading, 15)
                .padding(.top, 10)
            
            
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing: 15){
                VStack{
        HStack{
            
            Image("T0")
                .resizable()
                .frame(width: 80, height: 125)
                .cornerRadius(20)
            VStack{
                Image("T1")
                    .resizable()
                    .frame(width: 60, height: 55)
                    .cornerRadius(20)
                Image("T2")
                    .resizable()
                    .frame(width: 60, height: 55)
                    .cornerRadius(20)
            }
        }.padding(.all, 5)
        .background(Color.black.opacity(0.50))
        .cornerRadius(20)
                    HStack {
                        Text("Премьеры на ivi")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }.padding(.leading, 5)
                    
                }
                VStack{
        HStack{
            
            Image("T3")
                .resizable()
                .frame(width: 80, height: 125)
                .cornerRadius(20)
            VStack{
                Image("T4")
                    .resizable()
                    .frame(width: 60, height: 55)
                    .cornerRadius(20)
                Image("T5")
                    .resizable()
                    .frame(width: 60, height: 55)
                    .cornerRadius(20)
            }
        }.padding(.all, 5)
        .background(Color.black.opacity(0.50))
        .cornerRadius(20)
                    HStack {
                    Text("По подписке")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        Spacer()
                    }.padding(.leading, 5)
                }
                VStack{
                HStack{
                    Image("T0")
                        .resizable()
                        .frame(width: 80, height: 125)
                        .cornerRadius(20)
                    VStack{
                        Image("T1")
                            .resizable()
                            .frame(width: 60, height: 55)
                            .cornerRadius(20)
                        Image("T2")
                            .resizable()
                            .frame(width: 60, height: 55)
                            .cornerRadius(20)
                    }
                }.padding(.all, 5)
                .background(Color.black.opacity(0.50))
                .cornerRadius(20)
                    HStack {
                    Text("Российские")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        Spacer()
                    }.padding(.leading, 5)
                }
                
                VStack{
                HStack{
                    
                    Image("T3")
                        .resizable()
                        .frame(width: 80, height: 125)
                        .cornerRadius(20)
                    VStack{
                        Image("T4")
                            .resizable()
                            .frame(width: 60, height: 55)
                            .cornerRadius(20)
                        Image("T5")
                            .resizable()
                            .frame(width: 60, height: 55)
                            .cornerRadius(20)
                    }
                }.padding(.all, 5)
                .background(Color.black.opacity(0.50))
                .cornerRadius(20)
                    HStack {
                    Text("Зарубужные").font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        Spacer()
                    }.padding(.leading, 5)
                }
                
            }.padding(.leading, 15)
            .padding(.top, 10)
               
            
            }
            }
            
            HStack{
                Text("Жанры").font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }.padding([.leading, .trailing], 15)
            .padding(.top, 10)
            ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 15){
                ForEach(ZhanriFilm){value in
                    VStack{
                    Image(value.Image)
                        .resizable()
                        .frame(width: 50, height: 50)
                        Text(value.name)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    }.frame(width: 150, height: 100)
                    .background(Color.white)
                    .cornerRadius(20)
                    
                }
            }.padding([.leading, .trailing], 15)
            }
            
            HStack{
                Text("Фильмы по подписке")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "chevron.right").resizable()
                    .frame(width: 10, height: 15, alignment: .center)
                    .foregroundColor(.white)
            }.padding([.leading, .trailing], 15)
            
            ScrollView(.horizontal, showsIndicators: false){
                VStack{
                    ForEach(modelHomeTwo.film1){ ifilm in
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
                                        HStack{
                                            Text("Бесплатно")
                                                .frame(alignment: .leading)
                                                .padding(.leading, 15)
                                                .font(.system(size: 23))
                                                .foregroundColor(Color.blue.opacity(0.70))
                                            
                                            Spacer()
                                            
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                    
                }
            }
    
        }
        
    }
}




struct TextFilmBlock1: Identifiable {
    var id: Int
    var name: String
    var image: String
    var show: Bool
}

struct ZhanrFilmBlock: Identifiable {
    var id: Int
    var Image: String
    var name: String
}

struct ScrollFilmView1: Identifiable {
    var id: Int
    var posterFilmNav: [LentaID1]
}

struct LentaID1: Identifiable {
    
    
    var id: Int
    var nameFilm: String
    var image: String
    
}



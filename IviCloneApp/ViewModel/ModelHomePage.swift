//
//  ModelHomePage.swift
//  IviCloneApp
//
//  Created by Denis on 29.09.2021.
//

import SwiftUI

class ModelView: ObservableObject{
    
    @Published var film  = [
        ScrollFilmView(id: 0, posterFilmNav: [
            LentaID(id: 0, nameFilm: "Первому игроку приготовиться", image: "f0"),
            LentaID(id: 1, nameFilm: "Огонь", image: "f1"),
            LentaID(id: 2, nameFilm: "Лед", image: "f2"),
            
            LentaID(id: 3, nameFilm: "Джон Уик", image: "f3"),
            LentaID(id: 4, nameFilm: "Мстители", image: "f4"),
         
            LentaID(id: 5, nameFilm: "Малифисента", image: "f5")
        ])
    ]
    
    @Published var updateSum: Double {
        didSet {
                UserDefaults.standard.set(updateSum, forKey: "Sum")
                }
            }
            
            init() {
                self.updateSum = UserDefaults.standard.object(forKey: "Sum") as? Double ?? 0
            }
    
    func Payment() {
        
        self.updateSum = updateSum + Double(textPay)!
        self.alertPay.toggle()
    }
    
    @Published var textPay = ""
    @Published var alertPay = false
    @Published var PushSucc = false
    func payPay(){
     
        if updateSum >= 399.0 && PushSucc == false{
            self.updateSum = updateSum - Double(399)
            let alertPayPay = UIAlertController(title: "Покупка", message: "Покупка совершена", preferredStyle: .alert)
            alertPayPay.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            UIApplication.shared.windows.first?.rootViewController?.present(alertPayPay, animated: true)
            self.PushSucc.toggle()
                                } else {
            let alertPayPay = UIAlertController(title: "Покупка", message: "Недостаточно средств или подписка куплена", preferredStyle: .alert)
            alertPayPay.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            UIApplication.shared.windows.first?.rootViewController?.present(alertPayPay, animated: true)
        }
    }
    
    func payFilm(){
        if updateSum >= filmCost[idSelf]!{
            self.updateSum = updateSum - filmCost[idSelf]!
        }
    }
    
    @Published var showAlert = false
    
    @Published var posterFor: [PosterID] = [
        PosterID(id: 0, name: "p1"),
        PosterID(id: 1, name: "p2"),
        PosterID(id: 2, name: "p3"),
        PosterID(id: 3, name: "p4")
    ]
    
    @Published var tag = 0
    
    @Published var showFilmView0 = false

    @Published var filNav = ""
    
    @Published var idSelf = 0
    
    
   @Published var filmS: [Int: String]  = [0: "Первому игроку приготовиться", 1: "Огонь", 2: "Лед", 3: "Джон Уик", 4: "Мстители", 5: "Малифисента"]
    
    @Published var filmCost: [Int: Double] = [0: 199, 1: 149, 2:99, 3: 129, 4: 249, 5: 49]
    
   @Published var filmInfo: [String: String]  = ["Первому игроку приготовиться": "Действие фильма происходит в 2045 году, мир погружается в хаос и находится на грани коллапса. Люди ищут спасения в игре OASIS – огромной вселенной виртуальной реальности. Ее создатель, гениальный и эксцентричный Джеймс Холлидэй, оставляет уникальное завещание. Все его колоссальное состояние получит игрок, первым обнаруживший цифровое «пасхальное яйцо», которое миллиардер спрятал где-то на просторах OASISа. Запущенный им квест охватывает весь мир. Совершенно негероический парень по имени Уэйд Уоттс решает принять участие в состязании, с головой бросаясь в головокружительную, искажающую реальность погоню за сокровищами по фантастической вселенной, полной загадок, открытий и опасностей.", "Огонь": "После гибели подчинённого бывалый инструктор бригады пожарных Алексей Соколов хотел было уволиться, но лето в России — жаркая пора. Взяв в команду шестым нахального новичка, парня своей дочери, Соколов отправляется на очередное задание в Карелию. И это задание будет гораздо сложнее, чем он мог себе представить.", "Лед": "С самого детства Надя верила в чудеса. Она представляла себе, как выходит на лёд под овации публики и танцует свой самый красивый танец. И вот, благодаря вере и упорству, Надя становится знаменитой фигуристкой. Но когда ее мечты о громких победах, красивой жизни и прекрасном принце уже, кажется, готовы исполниться, судьба преподносит ей настоящее испытание. И чтобы его пройти, нужно будет снова, как в детстве, поверить в мечту. Ведь, может быть, победа не всегда должна быть громкой, а прекрасный принц не обязательно передвигается на белом коне?..", "Джон Уик": "Джон Уик - на первый взгляд, самый обычный среднестатистический американец, который ведет спокойную мирную жизнь. Однако мало кто знает, что он был наёмным убийцей, причём одним из лучших профессионалов в своём деле. После того как сынок главы бандитской группы со своими приятелями угоняет его любимый «Мустанг» 1969 года выпуска, при этом убив его собаку Дейзи, которая была подарком недавно почившей супруги, Джон вынужден вернуться к своему прошлому. Теперь Уик начинает охоту за теми, кто имел неосторожность перейти ему дорогу, и он готов на всё, чтобы отомстить.", "Мстители": "Пока Мстители и их союзники продолжают защищать мир от различных опасностей, с которыми не смог бы справиться один супергерой, новая угроза возникает из космоса: Танос. Межгалактический тиран преследует цель собрать все шесть Камней Бесконечности - артефакты невероятной силы, с помощью которых можно менять реальность по своему желанию. Всё, с чем Мстители сталкивались ранее, вело к этому моменту – судьба Земли никогда ещё не была столь неопределённой.", "Малифисента": "Юная волшебница Малефисента вела уединенную жизнь в зачарованном лесу, окруженная сказочными существами, но однажды все изменилось… В её мир вторглись люди, которые принесли с собой разрушение и хаос, и Малефисенте пришлось встать на защиту своих подданных, призвав на помощь могущественные тёмные силы."]

    
    
}

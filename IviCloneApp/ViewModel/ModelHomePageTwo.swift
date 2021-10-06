//
//  ModelHomePageTwo.swift
//  IviCloneApp
//
//  Created by Denis on 29.09.2021.
//

import SwiftUI

class ModelViewTwo: ObservableObject{
    @Published var searchBar = ""
    @Published var CancelButt = false
    @Published var textActiv = true
    @Published var tag = 0
    @Published var showFilmView1 = false
    
    @Published var TextFilm1 = [
        TextFilmBlock1(id: 1, name: "Джулия и Джим", image: "T0", show: false),
        TextFilmBlock1(id: 2, name: "Тор", image: "T1", show: false),
        TextFilmBlock1(id: 4, name: "Веном", image: "T3", show: false),
        TextFilmBlock1(id: 5, name: "Убить Била", image: "T4", show: false),
        TextFilmBlock1(id: 3, name: "Терминатор", image: "T2", show: true),
        TextFilmBlock1(id: 6, name: "Джокер", image: "T5", show: true )
    ]

    @Published var ZhanriFilm = [
    ZhanrFilmBlock(id: 0, Image: "z1", name: "Музыка"),
        ZhanrFilmBlock(id: 1, Image: "z2", name: "Спорт"),
        ZhanrFilmBlock(id: 2, Image: "z3", name: "Драма"),
        ZhanrFilmBlock(id: 3, Image: "z4", name: "Боевик"),
        ZhanrFilmBlock(id: 4, Image: "z5", name: "История"),
    ]
    
    @Published var film1  = [
        ScrollFilmView1(id: 0, posterFilmNav: [
            LentaID1(id: 0, nameFilm: "Первому игроку приготовиться", image: "f0"),
            LentaID1(id: 1, nameFilm: "Огонь", image: "f1"),
            LentaID1(id: 2, nameFilm: "Лед", image: "f2"),
            
            LentaID1(id: 3, nameFilm: "Джон Уик", image: "f3"),
            LentaID1(id: 4, nameFilm: "Мстители", image: "f4"),
           
            LentaID1(id: 5, nameFilm: "Малифисента", image: "f5")
        ])
    ]
}

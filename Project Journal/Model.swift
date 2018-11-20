//
//  Model.swift
//  Project Journal
//
//  Created by Тимур Аглиев on 20.11.2018.
//  Copyright © 2018 Тимур Аглиев. All rights reserved.
//

import Foundation
//Структура - ученик
struct Pupil {
    var name: String
    var secondName: String
    var mark: String
}
//Массив учеников
var pupils: [Pupil] = []

//Добавление ученика
func addPupil(secondName: String, name: String, mark: String) {
    pupils.append(Pupil(name: name, secondName: secondName, mark: mark))
}
//Удаление ученика
func removePupil(at index: Int){
    pupils.remove(at: index)
}


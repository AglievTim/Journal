//
//  AddViewController.swift
//  Project Journal
//
//  Created by Тимур Аглиев on 20.11.2018.
//  Copyright © 2018 Тимур Аглиев. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var secondNameTextField: UITextField!
    
    @IBOutlet weak var markTextFiled: UITextField!
    
    var name: String = ""
    var secondName: String = ""
    var mark: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.secondNameTextField.delegate = self
        self.markTextFiled.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationItem.hidesBackButton = true
        navigationItem.title = "Добавление/Редактирование ученика"
        nameTextField.becomeFirstResponder()
        nameTextField.text = name
        secondNameTextField.text = secondName
        markTextFiled.text = mark
    }
    //Кнопка сохранить
    @IBAction func saveButton(_ sender: UIButton) {
        //Проверка написанного
        let alertForAll = UIAlertController(title: "Внимание", message: "Введите все данные об ученике", preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertForAll.addAction(okAlertAction)
        let markAttention = UIAlertController(title: "Внимание", message: "Введите в поле оценки цифру от 1 до 5", preferredStyle: .alert)
        let markAttentionAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        markAttention.addAction(markAttentionAction)
        let doubleAlert = UIAlertController(title: "Внимание", message: "В строках Имя и Фамилия используйте только буквы русского или английского алфавита (возмонжо вы поставили пробел)", preferredStyle: .alert)
        let doubleAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        doubleAlert.addAction(doubleAlertAction)
     guard let nameToCount = nameTextField.text, let secondNameToCount = secondNameTextField.text else {return}
        var nameCount = nameToCount.count
        var secondNameCount = secondNameToCount.count

//    guard let nameEmpty = nameTextField.text, let secondNameEmpty = secondNameTextField.text, let markEmpty = markTextFiled.text else {return}
//        guard nameEmpty.isEmpty == false && secondNameEmpty.isEmpty == false && markEmpty.isEmpty == false else {return present(alertForAll, animated: true, completion: nil) }
//        
//        //Проверка написания имени
//        while nameCount != 0 {
//            guard let nameToCount = nameTextField.text else { return}
//            for one in nameToCount{
//                let ruCharacters = "йцукенгшщзхъфывапролджэёячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЁЯЧСМИТЬБЮ"
//                let engCharacters = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"
//                guard ruCharacters.contains(one) || engCharacters.contains(one) else {return present(doubleAlert, animated: true, completion: nil)}
//                nameCount -= 1
//            }
//        }
//        //Проверка написания фамилии
//        while secondNameCount != 0 {
//            guard let secondNameToCount = secondNameTextField.text else {return}
//            for one in secondNameToCount{
//                let ruCharacters = "йцукенгшщзхъфывапролджэёячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЁЯЧСМИТЬБЮ"
//                let engCharacters = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"
//                guard ruCharacters.contains(one) || engCharacters.contains(one) else {return present(doubleAlert, animated: true, completion: nil)}
//                secondNameCount -= 1
//            }
//        }
//        //Проверка написания оценки
//        if let mark = UInt(markTextFiled.text!) {
//            var markRange = 5
//            while markRange != 0 {
//                if mark == markRange {
//                    performSegue(withIdentifier: "BackSave", sender: nil)
//                    break
//                } else {
//                    markRange -= 1
//                }
//            }
//            guard markRange != 0 else {return present(markAttention, animated: true, completion: nil)}
//        } else {
//            present(markAttention, animated: true, completion: nil)
//        }
}
    // Кнопка Отменить
    @IBAction func cancelButton(_ sender: UIButton) {
        if pupils.last?.name == "" {
            performSegue(withIdentifier: "BackCancel", sender: nil)
        } else {
            performSegue(withIdentifier: "JustBack", sender: nil)
        }
    }
    //Убираем клавиатуру
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        secondNameTextField.resignFirstResponder()
        markTextFiled.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

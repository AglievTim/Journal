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
        
        guard let firstName = nameTextField.text else {return}
        
        let nameIsEmpty = UIAlertController(title: "Внимание", message: "Введите имя", preferredStyle: .alert)
        let nameIsEmptyAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        nameIsEmpty.addAction(nameIsEmptyAction)
        
        guard !firstName.isEmpty else {return present(nameIsEmpty, animated: true, completion: nil)}
        
        for char in firstName {
            
            let ruCharacters = "йцукенгшщзхъфывапролджэёячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЁЯЧСМИТЬБЮ"
            let engCharacters = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"
            
            let nameCheck = UIAlertController(title: "Внимание", message: "В написании имени используйте только русские или английские буквы", preferredStyle: .alert)
            let nameCheckAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            nameCheck.addAction(nameCheckAction)
            
            guard ruCharacters.contains(char) || engCharacters.contains(char) else {return present(nameCheck, animated: true, completion: nil)}
    
        }
        
        guard let lastName = secondNameTextField.text else {return}
        
        let secondNameIsEmpty = UIAlertController(title: "Внимание", message: "Введите фамилию", preferredStyle: .alert)
        let secondNameIsEmptyAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        secondNameIsEmpty.addAction(secondNameIsEmptyAction)
        
        guard !lastName.isEmpty else {return present(secondNameIsEmpty, animated: true, completion: nil)}
        
        for char in lastName {
            
            let ruCharacters = "йцукенгшщзхъфывапролджэёячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЁЯЧСМИТЬБЮ"
            let engCharacters = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"
            
            let secondNameCheck = UIAlertController(title: "Внимание", message: "В написании фамилии используйте только русские или английские буквы", preferredStyle: .alert)
            let secondNameCheckAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            secondNameCheck.addAction(secondNameCheckAction)
            
            guard ruCharacters.contains(char) || engCharacters.contains(char) else {return present(secondNameCheck, animated: true, completion: nil)}
            
        }
        
        guard let markOfPupil = markTextFiled.text else {return}
        
        let markIsEmpty = UIAlertController(title: "Внимание", message: "Укажите оценку", preferredStyle: .alert)
        let markIsEmptyAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        markIsEmpty.addAction(markIsEmptyAction)
        
        guard !markOfPupil.isEmpty else {return present(markIsEmpty, animated: true, completion: nil)}
        
        let numCharacter = "12345"
        
        let markCheck = UIAlertController(title: "Внимание", message: "Введите цифру от 1 до 5", preferredStyle: .alert)
        let markCheckAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        markCheck.addAction(markCheckAction)
        
        guard numCharacter.contains(markOfPupil) && markOfPupil.count == 1 else {return present(markCheck, animated: true, completion: nil)}
        performSegue(withIdentifier: "BackSave", sender: nil)
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

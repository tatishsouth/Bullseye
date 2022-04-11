//
//  ViewController.swift
//  Bullseye
//
//  Created by Makerspace Dushanbe  on 14/03/22.
//

import UIKit

class MainBoardViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
 
    // Число, которое человек должен угадать.
    var guessingNumber: Int = Int.random(in: 1...100)
    // Очки юзера.
    var score: Int = 0
    // Раунды.
    var round: Int = 1
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalThumbImage = UIImage (named: "SliderThumb-Normal")
        let highlightedThumbImage = UIImage (named: "SliderThumb-Highlighted")
        
        slider.setThumbImage(normalThumbImage, for: .normal)
        slider.setThumbImage(highlightedThumbImage, for: .highlighted)
        
        setUp()
      
    }
    
    @IBAction func didTapSelectButton (_ sender: Any ) {
        
        
        // Задача
        // 1. Прочитать число из слайдера (sliderValue)

        let sliderValue: Float  = slider.value


        // 2. Перевести это число в Int(sliderValueInt), чтобы можно было сравнить два целых числа

        let sliderValueInt: Int = Int(sliderValue)


        // 3. Сравнить два числа, и если они совпадают то начислить 1 очко игроку иначе ничего не делать

        let isValueEquals: Bool = sliderValueInt == guessingNumber
        if isValueEquals {
            print ("Вы угадали число")
            score = score + 1
            scoreLabel.text = "Очки: " + String(score)
        } else {
            print ("Вы выбрали число \(sliderValueInt)")

        }

        updateGuessingNumber()
        updateRound()
        updateScore()
            
    }
    
    @IBAction func didTryTapAgainButton(_ sender: Any) {
        slider.value = 50
        print ("Слайдер обновился")
        taskLabel.text = "Попробуй угадать число: \(Int.random(in: 1...100))"
        setUp()
        
    }
        
    func setUp() {
        // Настройки начала игры
        
        // Устанавливаем значение слайдера на 50.
        slider.value = 50
        
        //  Задать число, которое будут угадывать.
        updateGuessingNumber()
        
        // Обнулить очки.
        score = 0
        scoreLabel.text = "Очки: " + String (score)
        
    }
    
    func updateGuessingNumber() {
        guessingNumber = Int.random(in: 1...100)
        taskLabel.text = "Попробуй угадать число: "
        + String (guessingNumber)
        
    }
    
    func showResults() {
        
        // Создаем всплывающее окно/алерт.
        let alert = UIAlertController(title: "Итоги игры", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        
        // Создали кнопку для всплывающего окна/алерта.
        let okButton: UIAlertAction = UIAlertAction(title: "Начать сначала", style: .default, handler: { _ in
            
            // Действия при нажатии на кнопку
            
            print ("Начали новую игру")
            
            self.setUp()
    
        })
        
        // Добавили кнопку в алерт.
        alert.addAction(okButton)
        
        // Отобразили всплывающее окно/алерт на экране
        present(alert, animated: true)
    }
    
    // Функция для обнуления раундов.
    func updateRound() {
        
        if round >= 10 {
            round = 1
            score = 0
            print ("Игра окончена")
            showResults()
        } else {
            round = round + 1
            
        }
            roundLabel.text = "Раунд: " + String(round)
    }
    
    // Функция для обновления очков.
    func updateScore() {
        let sliderValue = Int(slider.value)
        if guessingNumber == sliderValue {
            score = score + 1
        } else {
        print ("Попробуй ещё раз!")
        
      }
   }
}


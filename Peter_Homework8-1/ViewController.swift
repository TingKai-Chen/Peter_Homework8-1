//
//  ViewController.swift
//  Peter_Homework8-1
//
//  Created by 陳庭楷 on 2018/11/11.
//  Copyright © 2018年 陳庭楷. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = [ "swift" , "glorious" , "buccaneer" , "incandescent" , "bug" , "program" ]    //答案
    
    let incorrectMovesAllowed = 7  //猜7次
    
    var totalWins = 0 {            //總贏數，贏了就下一題
        
        didSet {
            
            newRound()
            
        }
        
    }
    
    var totalLesses = 0 {         //總輸數 ，輸了就下一題
        
        didSet {
            
            newRound()
            
        }
        
    }
    
    var currentGame : Game!        //不知道物件實體內容所以先給值


    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        sender.isEnabled = false   //是否啟用
        
        let letterString = sender.title(for: .normal)!   //標題正常顯示(大寫)
        
        let letter = Character(letterString.lowercased())  //轉成小寫
        
        self.currentGame.playerguessed(letter: letter)          //猜的玩家 猜一個變一個小寫
        
        updateGameState()                                       //更新畫面輸幾分，贏幾分
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newRound()                                        //重新開始
       
    }
    
    func newRound () {                                   //是否空的 如果是空的的相反 就是有值 就啟用
        
        if !self.listOfWords.isEmpty {
            
            let newWord = self.listOfWords.removeFirst()
        
            self.currentGame = Game.init(word: newWord, incorrectMovesRemaining: self.incorrectMovesAllowed, guessedLetters: [])
            
            enableLetterButtons(true)
            
            updateUI()
            
        }
        
        else {
            
            enableLetterButtons(false)
            
        }
        
    }
    
    func updateUI () {
        
        var letters : [String] = [""]
        
        for letter in self.currentGame.formattedWord {                                 //轉型成String
            
            letters.append(String(letter))
            
        }
        
        let wordWithSpacing = letters.joined(separator: " ")                    //再加空格
        
        self.correctLabel.text = wordWithSpacing
        
        self.scoreLabel.text = "Wins: \(self.totalWins) Lesses: \(self.totalLesses) "              //顯示輸贏
        
        self.treeImageView.image = UIImage(named: "Tree \(self.currentGame.incorrectMovesRemaining)")            //顯示剩幾次機會
        
    }
    
    func updateGameState() {
        
        if self.currentGame.incorrectMovesRemaining == 0 {
            
            self.totalLesses += 1
            
        }
        
        else if self.currentGame.word == self.currentGame.formattedWord {
            
            self.totalWins += 1
            
        }
        
        else {
            
            updateUI()
            
        }
        
    }
    
    func enableLetterButtons ( _ enable: Bool ) {                           //把isEnabled 寫在同一個方法比較清楚
        
        for button in self.letterButtons {
            
            button.isEnabled = enable
            
        }
        
    }
    
}


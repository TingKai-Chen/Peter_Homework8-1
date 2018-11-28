//
//  Game.swift
//  Peter_Homework8-1
//
//  Created by 陳庭楷 on 2018/11/12.
//  Copyright © 2018年 陳庭楷. All rights reserved.
//

import Foundation

struct Game {
    
    var word : String                                                    //答案題目
    
    var incorrectMovesRemaining : Int                                    //幾次機會
    
    var guessedLetters : [ Character ]                                   //猜的字母
    
    mutating func playerguessed ( letter : Character ) {                //玩家猜的字母轉成小寫
      
       self.guessedLetters.append(letter)                                   //依序放進猜字母裡面
        
        if !self.word.contains(letter) {                                     //如果題目裡面沒有包含猜的字母就減一
            
            self.incorrectMovesRemaining -= 1
           
        }
        
    }
    
    var formattedWord : String {                             //正確顯示，錯誤空格
        
        var guessedWord = ""
        
        for letter in self.word {
            
            if self.guessedLetters.contains(letter) {
                
                guessedWord += "\(letter)"
                
            }
            
            else {
                
                guessedWord += "_"
                
            }
            
        }
        
        return guessedWord
        
    }

}

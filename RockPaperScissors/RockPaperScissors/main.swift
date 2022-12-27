//
//  RockPaperScissors - main.swift
//  Created by Harry, Andrew. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0>", terminator: ": ")
}

func readUserInput() -> String? {
    guard let userInput = readLine() else {
        return nil
    }
    
    return userInput
}

func validationUserInput(userInput: String?) -> Result<Int, InputError> {
    guard let userInput = userInput else {
        return .failure(.invalidInput)
    }
    guard let number = Int(userInput) else {
        return .failure(.invalidInput)
    }
    guard number > 0, number <= 3 else {
        return .failure(.invalidInput)
    }

    return .success(number)
}

//let a = readUserInput()
//let b = validationUserInput(userInput: a)
//print(a)
//print(b)

func generateComputerHand() -> RockPaperScissors? {
    let computerNumber = Int.random(in: 1...3)
    guard let computerHand = RockPaperScissors.init(rawValue: computerNumber) else {
        return nil
    }
    
    return computerHand
}

func generateUserHand(validationResult: Result<Int, InputError>) -> RockPaperScissors? {
    let result = validationResult
    var userNumber = 0
    
    switch result {
    case .success(let number):
        userNumber = number
    case .failure(.invalidInput):
        print("잘못된 입력입니다. 다시 시도해주세요")
    }
    
    guard let userHand = RockPaperScissors.init(rawValue: userNumber) else {
        return nil
    }
    
    return userHand
}

func compareHand(computerHand: RockPaperScissors?, userHand: RockPaperScissors?) -> MatchResult? {
    guard let computerHand = computerHand, let userHand = userHand else {
        return nil
    }
    var matchResult: MatchResult? = nil
    
    if computerHand.rawValue == 1 && userHand.rawValue == 3 || computerHand.rawValue == 2 && userHand.rawValue == 1 || computerHand.rawValue == 3 && userHand.rawValue == 2  {
        matchResult = MatchResult.lose
    } else if computerHand.rawValue == userHand.rawValue {
        matchResult = MatchResult.draw
    } else {
        matchResult = MatchResult.win
    }
    
    return matchResult
}

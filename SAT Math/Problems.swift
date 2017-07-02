//
//  Problems.swift
//  SAT Math
//
//  Created by Adam Buys on 6/19/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import Foundation



struct Problem {
    
    let part1 : String
    let part2 : String
    let mcA : (str : String, correct: Bool)?
    let mcB : (str : String, correct: Bool)?
    let mcC : (str : String, correct: Bool)?
    let mcD : (str : String, correct: Bool)?
    let mcE : (str : String, correct: Bool)?
    let solution : Int
    let partsCount : Int
    let choicesCount : Int
    let problemType : Int
    let numInSet : String
    
}



let part1 = "${x}^{2} - 4 = 0$"
let part2 = "$What are the solutions to the equations above?$"
let mcA = "$n$"
let mcB = "$4$"
let mcC = "$x = 3"
let mcD = "$x = 4"
let solution = 1
let partsCount = 2
let choicesCount = 4
let problemType = 0

let problem1 = Problem(part1: part1, part2: part2, mcA: (mcA, true), mcB: (mcB, false), mcC: (mcC, false), mcD: (mcD, false), mcE: nil, solution: solution, partsCount: partsCount, choicesCount: choicesCount, problemType: problemType, numInSet: "1/20")




let problem2 = Problem(part1: "${x}^{2} - 9 = 0$", part2: "$What are the solutions to the equations above?$", mcA: (str: "$3, -3$", correct: true), mcB: (str: "$-3, -3$", correct: false), mcC: (str: "${x}^{2} - 4 = 0$", correct: false), mcD: (str: "$x^3$", correct: false), mcE: nil, solution: 1, partsCount: 2, choicesCount: 4, problemType: 0, numInSet: "2/20")

let problem3 = Problem(part1: "${x}^{5} - 9 = 0$", part2: "$What are the solutions to the equations above?$", mcA: (str: "${x}^{5}$", correct: true), mcB: (str: "$23, -343$", correct: false), mcC: (str: "${x}^{2} - 4 = 0$", correct: false), mcD: (str: "$x^3$", correct: false), mcE: nil, solution: 1, partsCount: 2, choicesCount: 4, problemType: 0, numInSet: "3/20")

let problemSet = [problem1, problem2, problem3]


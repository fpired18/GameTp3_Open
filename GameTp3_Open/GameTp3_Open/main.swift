//  main.swift
//  Game
//
//  Created by Frédéric on 18/01/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import Foundation

class Fight {
    let name: String
    var numberPointsOfLive = 100 {
        willSet {
            print("Je suis touché")
        }
        didSet {
            if oldValue < numberPointsOfLive {
                print("Merci Mage de m'avoir soigné")
            } else {
                print("Aie heu.. Je viens d'en prendre une sévère !!!")
            }
        }
    }
    var numberPointsOfAttack = 10
    init(name: String) {
        self.name = name
    }
}

class Magus {
    let name: String
    var numberPointsOfLive = 500 {
        willSet {
            print("Je suis touché")
        }
        didSet {
            if oldValue < numberPointsOfLive {
            } else {
                print("Aie heu.. Je viens d'en prendre une sévère !!!")
            }
        }
    }
    var numberPointsOfAttack = 1
    init(name: String) {
        self.name = name
    }
}

class Colossus {
    let name: String
    var numberPointsOfLive = 150 {
        willSet {
            print("Je suis touché")
        }
        didSet {
            if oldValue < numberPointsOfLive {
                print("Merci Mage de m'avoir soigné")
            } else {
                print("Aie heu.. Je viens d'en prendre une sévère !!!")
            }
        }
    }
    var numberPointsOfAttack = 20
    init(name: String) {
        self.name = name
    }
}

class Dwarf {
    let name: String
    var numberPointsOfLive = 200 {
        willSet {
            print("Je suis touché")
        }
        didSet {
            if oldValue < numberPointsOfLive {
                print("Merci Mage de m'avoir soigné")
            } else {
                print("Aie heu.. Je viens d'en prendre une sévère !!!")
            }
        }
    }
    var numberPointsOfAttack = 10
    init(name: String) {
        self.name = name
    }
}

func gameMenu(){
    var numberGamer = 1
    var numberCharacterType = 0
    var numberTime = 1
    var gamer1 = [String:String]()
    var gamer2 = [String:String]()
    //var answer = 0
    var typeWarrior = ""
    
    func selectionType(choice: String, numberGamer: Int, numberTime: Int) {
        
        print("Comment veux-tu l'appeler ?")
        let name = readLine()
        switch choice {
        case "1": do {
            if let nameF = name {
                _ = Fight(name: nameF)
                constitutionTeam(numberGamer: numberGamer, name: nameF, typeWarrior: "Combattant", numberTime: numberTime)
            }
            }
        case "2": do {
            if let nameM = name {
                _ = Magus(name: nameM)
                constitutionTeam(numberGamer: numberGamer, name: nameM, typeWarrior: "Mage", numberTime: numberTime)
            }
            }
        case "3": do {
            if let nameC = name {
                _ = Colossus(name: nameC)
                constitutionTeam(numberGamer: numberGamer, name: nameC, typeWarrior: "Colosse", numberTime: numberTime)
            }
            }
        case "4": do {
            if let nameD = name {
                _ = Dwarf(name: nameD)
                constitutionTeam(numberGamer: numberGamer, name: nameD, typeWarrior: "Nain", numberTime: numberTime)
            }
            }
        default:
            print("Je ne comprends pas.")
        }
    }
    
    func constitutionTeam (numberGamer: Int, name: String, typeWarrior: String ,numberTime: Int) {
        
        if numberGamer == 1 {
            gamer1[name] = typeWarrior
            //gamere1[name] = typeWarrior
            if numberTime == 3 {
                teamPosting(NumberGamer: gamer1)
            }
        } else {
            gamer2[name] = typeWarrior
            if numberTime == 3 {
                teamPosting(NumberGamer: gamer2)
            }
        }
    }
    
    func teamPosting (NumberGamer: [String:String]){
        print("\nVoici l'équipe que tu viens de constituer :")
        for (name, warrior2) in NumberGamer {
            print("\(name) un \(warrior2)")
        }
        
    }
    for _ in 0...1 {
        numberTime = 1
        print("\nBonjour Gamer n° \(numberGamer)\n")
        for _ in 0...2 {
            //repeat {
            print("Quel personnage numéro \(numberTime) veux-tu dans ton équipe :"
                + "\n1.  Un Combattant ? "
                + "\n2.  Un Mage ?"
                + "\n3.  Un Colosse ? "
                + "\n4.  Un Nain ?")
            //                if let choice = readLine(){
            //                    answer = Int(choice) ?? 0
            //                }
            //                print("Voici la valeur de answer \(String(describing: answer))" )
            //            } while (answer >= 4)
            if let choice = readLine() {
                switch choice {
                case "1":
                    print("Tu viens de choisir un Combattant")
                    selectionType(choice: "1", numberGamer: numberGamer, numberTime: numberTime)
                case "2":
                    print("Tu viens de choisir un Mage")
                    selectionType(choice: "2", numberGamer: numberGamer, numberTime: numberTime)
                case "3":
                    print("Tu viens de choisir un Colosse")
                    selectionType(choice: "3", numberGamer: numberGamer, numberTime: numberTime)
                case "4":
                    print("Tu viens de choisir un Nain")
                    selectionType(choice: "4", numberGamer: numberGamer, numberTime: numberTime)
                default:
                    print("Je ne comprends pas.")
                }
            }
            numberTime += 1
        }
        
        numberGamer += 1
    }
    
}

// La boucle du programme
//while true {
gameMenu()
//}

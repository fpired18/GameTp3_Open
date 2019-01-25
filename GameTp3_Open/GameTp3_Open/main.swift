//  main.swift
//  Game
//
//  Created by Frédéric on 18/01/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import Foundation

class Soldier {
    var nameSoldier = ""
    var type = ""
    var numberPointsOfLive = 100 //{
    //        willSet {
    //            print("Je suis touché")
    //        }
    //        didSet {
    //            if oldValue < numberPointsOfLive {
    //                print("Merci Mage de m'avoir soigné")
    //            } else {
    //                print("Aie heu.. Je viens d'en prendre une sévère !!!")
    //            }
    //        }
    //    }
    var numberPointsOfAttack = 10
}

var fight = Soldier()

func gameMenu() {
    var numberGamer = 1
    var numberTime = 0
    var team1 = [0 :Soldier(), 1: Soldier(), 2: Soldier()]
    var team2 = [0 :Soldier(), 1: Soldier(), 2: Soldier()]
    var oneTime = 1
    var check = true
    var validation = true
    var warriorName = ""
    var numberPointOfLiveGame = ["Combattant" : 100, "Mage": 500, "Colosse": 150, "Nain": 200]
    
    func checkName(name: String) -> Bool {
        let nameInit = name
            for i in 0...2 {
                if team1[i]?.nameSoldier == nameInit || team2[i]?.nameSoldier == nameInit {
                    print("\n LE NOM EST DEJA UTILISE. RECOMMENCE TON CHOIX...")
                    numberTime -= 1
                    check = true
                } else {
                    check = false
                }
            }
        return check
    }
    
    func viewTeam(team: [Int : Soldier], numberGamer: Int) {
        var team = team
        var oneTime = 1
        for _ in 0...2 {
            if oneTime == 1 {
                print("\nVoici les membres de l'équipe \(numberGamer): ")
                for i in 0..<team.count {
                    print(i+1, team[i]?.nameSoldier ?? "Il n'y a rien", "est un", team[i]?.type ?? "SoldatHelp", "qui a",team[i]?.numberPointsOfLive ?? 100,"points de vie et", team[i]?.numberPointsOfAttack ?? 10, "d'attaque")
                    oneTime += 1
                }
            }
        }
    }
    
    func recordName (numberGamer: Int, name: String, typeWarrior: String ,numberTime: Int, numberPointsOfLive: Int, numberPointsOfAttack: Int, check: Bool) {
        var team = [0 :Soldier(), 1: Soldier(), 2: Soldier()]
        if numberGamer == 1 {
            team = team1
        } else {
            team = team2
        }
            if team[numberTime]?.nameSoldier == "" {
                team[numberTime]?.nameSoldier = name
                team[numberTime]?.type = typeWarrior
                team[numberTime]?.numberPointsOfLive = numberPointsOfLive
                team[numberTime]?.numberPointsOfAttack = numberPointsOfAttack
            }
            
            if numberTime == 2 {
                viewTeam(team: team, numberGamer: numberGamer)
            }
    }
    func game() {
        var soldier1 = Soldier()
        var soldier2 = Soldier()
        var gamer = 1
        var turnNumber = 0
        print("\nVoici les équipes")
        viewTeam(team: team1, numberGamer: 1)
        viewTeam(team: team2, numberGamer: 2)
        
        func displayMenu(team: [Int : Soldier]) -> Soldier {
            
            validation = true
            var team = team
            var soldier = Soldier()
            if let choice = readLine() {
                switch choice {
                case "1":
                    soldier = team[0]!
                case "2":
                    soldier = team[1]!
                case "3":
                    soldier = team[2]!
                default:
                    print("Je ne comprends pas dans displayMenu ")
                    validation = false
                }
            }
            return soldier
        }
        
        func choiceSoldier(choice: String, numberGamer: Int, team1: [Int : Soldier], team2: [Int : Soldier]){
            var team11 = team1
            var team21 = team2
            var maxNumberOfLive = 0
            if numberGamer == 1 {
                team11 = team1
                team21 = team2
            } else {
                team11 = team2
                team21 = team1
            }
            if choice == "1" {

                repeat {
                    print("Choisi un personnage de ton équipe ")
                    soldier1 = displayMenu(team: team11)
                } while validation == false
                
                repeat {
                    print("Choisi un personnage de l'autre équipe ")
                    soldier2 = displayMenu(team: team21)
                } while validation == false
                
                print("Tu viens de sélectionner \(soldier1.nameSoldier)")
                print("Tu viens de sélectionner \(soldier2.nameSoldier)")
        
                soldier2.numberPointsOfLive -= soldier1.numberPointsOfAttack
                print("Voici le résultat de ton attaque \(soldier2.numberPointsOfLive)")

            }
            
            if choice == "2" {
                repeat {
                    print("Choisi le personnage à soignier ")
                    soldier1 = displayMenu(team: team11)
                    
                } while validation == false
                
                for (typeSoldier, numberPointOfLive) in numberPointOfLiveGame {
                    if typeSoldier == soldier1.type {
                         maxNumberOfLive = numberPointOfLive
                    }
                }
                if maxNumberOfLive <= 0 {
                    print("Tu arrives trop tard ton soldat est H.S. ")
                }
                
                if soldier1.numberPointsOfLive == maxNumberOfLive {
                    print("Voici le nombre de point de \(soldier1.numberPointsOfLive)")
                    print("Inutile de le soignier il est en pleine forme ")
                } else {
                    for i in 0...2 {
                        if team11[i]?.type == "Mage" {
                            soldier2 = team11[i]!
                        }
                    }
                    soldier1.numberPointsOfLive += soldier2.numberPointsOfAttack
                    print("Voici le résultat de ton soin \(soldier2.numberPointsOfAttack)")
                    print("Voici le résultat de ton soin \(soldier1.numberPointsOfLive)")
                }
            }
        }
        repeat {
            var controle = true
            print("\nGAMER\(gamer) VEUX-TU COMBATTRE OU SOIGNIER ? "
                + "\n1.  Combattre"
                + "\n2.  Soignier")
            if let choice = readLine() {
                switch choice {
                case "1":
                    choiceSoldier(choice: choice, numberGamer: gamer, team1: team1, team2: team2)
                    
                case "2":
                    choiceSoldier(choice: choice, numberGamer: gamer, team1: team1, team2: team2)
                    
                default:
                    print("Je ne comprends pas.")
                    controle = false
                    turnNumber -= 1
                }
                
            }
             turnNumber += 1
            if gamer == 1 && controle == true{
                gamer = 2
            } else {
                gamer = 1
            }
        } while turnNumber < 12
    }
    
    //========================================
    //              MENU DE DEMARRAGE
    //========================================
    
    for _ in 0...1 {
        print("\n              BONJOUR GAMER n° \(numberGamer)")
        if numberGamer == 2 {
            numberTime = 0
        }
        repeat {
            print("\nQuel personnage numéro \(numberTime+1) veux-tu dans ton équipe :"
                + "\n1.  Un Combattant avec 100 points de vie et 10 de force"
                + "\n2.  Un   Mage     avec 500 points de vie et  1 de force"
                + "\n3.  Un  Colosse   avec 150 points de vie et 20 de force"
                + "\n4.  Un   Nain     avec 200 points de vie et  5 de force\n")
            
            if let choice = readLine() {
                repeat {
                    print("\nComment veux-tu l'appeler ?")
                    if let name = readLine() {
                        check = false
                        warriorName = name
                        check = checkName(name: warriorName)
                    }
                } while check == true
                
                switch choice {
                case "1":
                    if check == false {
                        recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Combattant", numberTime: numberTime, numberPointsOfLive: 100, numberPointsOfAttack: 10, check: check)
                    }
                case "2":
                    if check == false {
                        recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Mage", numberTime: numberTime, numberPointsOfLive: 500, numberPointsOfAttack: 1, check: check)
                    }
                case "3":
                    if check == false {
                        recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Colosse", numberTime: numberTime, numberPointsOfLive: 150, numberPointsOfAttack: 20, check: check)
                    }
                case "4":
                    if check == false {
                        recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Nain", numberTime: numberTime, numberPointsOfLive: 200, numberPointsOfAttack: 5, check: check)
                    }
                default:
                    print("Je ne comprends pas.")
                    numberTime -= 1
                }
            }
            numberTime += 1
        } while numberTime < 3
        numberGamer += 1
    }
    game()
}

gameMenu()



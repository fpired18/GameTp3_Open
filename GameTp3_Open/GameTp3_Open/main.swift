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
    var numberPointsOfLive = 100
    var numberPointsOfAttack = 10
}

var fight = Soldier()

func gameMenu() {
    var numberGamer = 1
    var numberTime = 0
    var team1 = [0 :Soldier(), 1: Soldier(), 2: Soldier(), 3: Soldier()]
    var team2 = [0 :Soldier(), 1: Soldier(), 2: Soldier(), 3: Soldier()]
    var oneTime = 1
    var check = true
    var validation = true
    var warriorName = ""
    var numberPointOfLiveGame = ["Fight" : 100, "Magus": 80, "Colossus": 120, "Dwarf": 60, "Rider": 200]
    var maxPointOfLiveTeam1 = 0
    var maxPointOfLiveTeam2 = 0
    var maxPointOfLiveTeam = 0
    var numberTurn = 0
    let banner = """
          
                 |  |  _          _              _
                 |--| (_ | |  _  (   _  |  _| ° (_ /)  _ ° |
                 |  |_(__|_|_(_)__)_(_)_|_(_|_|_(_/(_ | )__|
                          
                         
        """
    let banner1 = """

                 |  |  _          _              _        ,__
                 |--| (_ | |  _  (   _  |  _| ° (_ /)  _ °| /
                 |  |_(__|_|_(_)__)_(_)_|_(_|_|_(_/(_ | )__/__


        """
    
    let banner2 = """
          __
         |  )
         |--  /) _  | / _       |||
         |__)/(_(_(_|/_(_)      |||
                           °°°  °°°
                    
        """
    let banner3 = """
        ,_____,
              
             ) )  _   , ,   | /| / _   _      |||
            (_(__(_|_(_(_  _|/_|/_(_)_| )     |||
             /)                          °°°  °°°
            (/
                   
        """
    func checkName(name: String) -> Bool {
// This function controls the name
        let nameInit = name
            for i in 0...4 {
                if team1[i]?.nameSoldier == nameInit || team2[i]?.nameSoldier == nameInit {
                    print("\n            =========================================="
                        + "\n                      THE NAME IS ALREADY USED."
                        + "\n                       REPEAT YOUR CHOICE..."
                        + "\n            ==========================================")
                    numberTime -= 1
                    check = true
                }
            }
        return check
    }
    
    func displayBattleResul() {
        print("\n========================================================")
        print("Here is the number of life points of the team 1 : \(maxPointOfLiveTeam1)\n"
            + "   and the number of life points of the team 2 : \(maxPointOfLiveTeam2)\n"
            + "=======================================================")
    }
    
    func viewTeam(team: [Int : Soldier], numberGamer: Int) {
// This function display the teams
        var team = team
        var oneTime = 1
        if numberTime == 4 {
            for _ in 0...4 {
                if oneTime == 1 {
                    print("\nHere are the team members \(numberGamer): ")
                    print("--------------------------------")
                    for i in 0..<team.count {
                        print("Step :", i+1, "to have", team[i]?.nameSoldier ?? "They are nothing", "is a", team[i]?.type ?? "SoldierHelp", "who has",team[i]?.numberPointsOfLive ?? 100,"life and", team[i]?.numberPointsOfAttack ?? 10, "attack")
                        oneTime += 1
                    }
                    if numberGamer == 1 {
                        maxPointOfLiveTeam = maxPointOfLiveTeam1
                    }
                    if numberGamer == 2 {
                        maxPointOfLiveTeam = maxPointOfLiveTeam2
                    }
                    print("\nHere is the number of life points of team \(numberGamer) : \(maxPointOfLiveTeam)")
                }
            }
        }
    }
    
    func recordName (numberGamer: Int, name: String, typeWarrior: String ,numberTime: Int, numberPointsOfLive: Int, numberPointsOfAttack: Int, check: Bool) {
        var team = [0 :Soldier(), 1: Soldier(), 2: Soldier(), 3: Soldier()]
// This function reverses the team when player number 2 arrives
        if numberGamer == 1 && !check {
            team = team1
            maxPointOfLiveTeam1 += numberPointsOfLive
        }
        if numberGamer == 2 && !check {
            team = team2
            maxPointOfLiveTeam2 += numberPointsOfLive
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
        
        print("\n              ============================================")
        print("\n                           TEAMS REMINDER")
        print("\n              ============================================")
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
                case "4":
                    soldier = team[3]!
                default:
                    print("I don't understand")
                    validation = false
                }
            }
            return soldier
        }
        
        func openingTrunk(soldier: Soldier, choice: String) -> Soldier {
            // Step 3 : We change the strength of the weapon in this function
            var chest = ["Club","Crossbow","Drugs","Injection","Doping"]
            let randomIndex = Int(arc4random_uniform(UInt32(chest.count)))
            let newWeapon = chest[randomIndex]
            var controle = 1
            print("\n===================================================================================")
            print("                        WATCH THE CHEST OPEN !!!!!!!")
            print("===================================================================================")
            
            print("\nHere is what came out of the chest: \(newWeapon)")
            switch soldier.type {
            case "Magus":
                if choice == "2" {
                    if newWeapon == "Drugs" || newWeapon == "Injection" {
                        soldier.numberPointsOfAttack *= 2
                    }
                }
                else {
                    controle += 1
                }
            case "Rider":
                if newWeapon == "Doping" {
                    soldier.numberPointsOfAttack *= 2
                }
            case "Fight":
                if newWeapon == "Club" || newWeapon == "Crossbow" {
                    soldier.numberPointsOfAttack *= 2
                }
            case "Colossus":
                if newWeapon == "Club" || newWeapon == "Crossbow" {
                    soldier.numberPointsOfAttack *= 2
                }
            case "Dwarf":
                if newWeapon == "Club" || newWeapon == "Crossbow" {
                    soldier.numberPointsOfAttack *= 2
                }
            default:
                print("They are nothing ")
            }
            if controle == 1 {
                print("\nThis is the new soldier's strike force \(soldier.numberPointsOfAttack)"
                    + "\n----------------------------------------------")
            }
            return soldier
        }
        
        func choiceSoldier(choice: String, numberGamer: Int, team1: [Int : Soldier], team2: [Int : Soldier]){
// fonction de sélection du soldat, elle inverse la team selon le numéro du joueur dans le if
            var teamSwap1 = team1
            var teamSwap2 = team2
            var maxNumberOfLive = 0
            var initialForce = 0
            
            if numberGamer == 1 {
                teamSwap1 = team1
                teamSwap2 = team2
                maxPointOfLiveTeam = maxPointOfLiveTeam1
            } else {
                teamSwap1 = team2
                teamSwap2 = team1
                maxPointOfLiveTeam = maxPointOfLiveTeam2
            }
            
            if choice == "1" {
                var validationMage = true
                var numberMage = 0
// This loop has the mission to count how much there is magus in the team
                for i in 0...4 {
                    if teamSwap1[i]?.type == "Magus" {
                        numberMage += 1
                        soldier2 = teamSwap1[i]!
                    }
                }
                if numberMage == 4 {
                    print("You only have mages in your team, you can't attack ! ")
                    validationMage = false
                } else {
                
                    repeat {
                        print("\nCHOOSE A MEMBER OF YOUR TEAM... ")
                        if numberGamer == 1 {
                            viewTeam(team: team1, numberGamer: 1)
                        }
                        if numberGamer == 2 {
                            viewTeam(team: team2, numberGamer: 2)
                        }
                        
                        soldier1 = displayMenu(team: teamSwap1)
    //Here we capture the initial value of the attack of the soldier
                        initialForce = soldier1.numberPointsOfAttack
                        
                        if soldier1.numberPointsOfLive <= 0 {
                            print("Can't select it is dead")
                            validation = false
                        }
                        if soldier1.type == "Magus" {
                            print("CAN NOT SELECT HIM TO FIGHT, HE CAN ONLY CARE \n")
                            validationMage = false
                        }
                    } while !validation
               
    // on affecte le résultat de openingTrunk à la propriété "force_d'attaque" du Soldier1 préalablement envoyé
                    if validationMage {
                        soldier1 = openingTrunk(soldier: soldier1, choice: choice)
                    }
                    
                    repeat {
                        if validationMage == true {
                            print("\nCHOOSE A MEMBER OF THE OTHER TEAM...... ")
                            if numberGamer == 1 {
                                viewTeam(team: team2, numberGamer: 2)
                            } else {
                                viewTeam(team: team1, numberGamer: 1)
                            }
                            soldier2 = displayMenu(team: teamSwap2)
                            if soldier2.numberPointsOfLive <= 0 {
                                print("Can't select it is dead")
                                validation = false
                            }
                        }
                    } while !validation
                    
                    if validationMage {
                        print("==============================")
                        print("You just selected \(soldier1.nameSoldier)")
                        print("You just selected \(soldier2.nameSoldier)")
                        print("=============================\n")
                        }
                    if validationMage {
                        if soldier1.numberPointsOfAttack > soldier2.numberPointsOfLive {
                            if numberGamer == 1 && validation && validationMage {
                                maxPointOfLiveTeam2 -= soldier2.numberPointsOfLive
                            }
                            if numberGamer == 2 && validation && validationMage {
                                maxPointOfLiveTeam1 -= soldier2.numberPointsOfLive
                            }
                            soldier2.numberPointsOfLive = 0
                        }
                        else {
                            soldier2.numberPointsOfLive -= soldier1.numberPointsOfAttack
                            
                            if numberGamer == 1 && validation && validationMage {
                                maxPointOfLiveTeam2 -= soldier1.numberPointsOfAttack
                            }
                            if numberGamer == 2 && validation && validationMage {
                                maxPointOfLiveTeam1 -= soldier1.numberPointsOfAttack
                            }
                        }
                        displayBattleResul()
                    }
                    // Return of the initial strike force
                    soldier1.numberPointsOfAttack = initialForce
                }
            }
            
            if choice == "2" {
                var validChoiceMage = false
                validation = true
// This function has the mission to control the presence of a mage in the team and if is is still alive
                for i in 0...4 {
                    if teamSwap1[i]?.type == "Magus" {
                        soldier2 = teamSwap1[i]!
                        validChoiceMage = true
                        if soldier2.numberPointsOfLive == 0 {
                            validChoiceMage = false
                        }
                    }
                }
               if !validChoiceMage {
                    print("You don't have a magus in your team able to act ")
                    validation = false
                } else {
//Here we capture the initial value of the attack of the soldier
                initialForce = soldier2.numberPointsOfAttack
                soldier2 = openingTrunk(soldier: soldier2, choice: choice)

                print("Choose the person to look after ")
                if numberGamer == 1 {
                    viewTeam(team: team1, numberGamer: 1)
                }
                if numberGamer == 2 {
                    viewTeam(team: team2, numberGamer: 2)
                }
        
                soldier1 = displayMenu(team: teamSwap1)
                
                for (typeSoldier, numberPointOfLive) in numberPointOfLiveGame {
                    if typeSoldier == soldier1.type {
// Recovery of the maximum number of life points of the soldier type
                        maxNumberOfLive = numberPointOfLive
                    }
                }
                if soldier1.numberPointsOfLive == maxNumberOfLive {
                    print("Here is the number of points of \(soldier1.numberPointsOfLive)")
                    print("No need to treat him he is in great shape ! ")
                    validation = false
                }
                if soldier1.numberPointsOfLive <= 0 {
                    print("You arrive too late, your soldier is dead \n")
                    validation = false
                } else {
                    soldier1.numberPointsOfLive += soldier2.numberPointsOfAttack
                }
                if numberGamer == 1 && validation {
                    maxPointOfLiveTeam1 += soldier2.numberPointsOfAttack
                }
                if numberGamer == 2 && validation {
                    maxPointOfLiveTeam2 += soldier2.numberPointsOfAttack
                }
                
                if validation {
                    print("Here is the result of the treatment \(soldier2.type) he added \(soldier2.numberPointsOfAttack) life ")
                    displayBattleResul()
                }
                
// Return of the initial strike force
                 soldier2.numberPointsOfAttack = initialForce
                }
            }
        }
        
        repeat {
// numberTurn comptabilise le nombre de tour pour informer le gagnant en fin de partie
            numberTurn += 1
// turnNumber maintient trois cycles
            var controle = true
            print("\n======================================"
                + "\nPLAYER\(gamer) WANT TO FIGHT OR CARE ? "
                + "\n======================================"
                + "\nStape : 1 to fight "
                + "\nStape : 2 to care ")
            if let choice = readLine() {
                switch choice {
                case "1":
                    choiceSoldier(choice: choice, numberGamer: gamer, team1: team1, team2: team2)
                    
                case "2":
                    choiceSoldier(choice: choice, numberGamer: gamer, team1: team1, team2: team2)
                default:
                    print("I don't understand.")
                    controle = false
                }
            }
            
            if gamer == 1 && controle {
                gamer = 2
            } else {
                gamer = 1
            }
            
        } while maxPointOfLiveTeam1 != 0 && maxPointOfLiveTeam2 != 0
        
        if maxPointOfLiveTeam1 <= 0 {
            print(banner2)
            print("Bravo team two won !!!")
            print("It took \(numberTurn) laps to win the fight...")
            print(banner3)
        }
        if maxPointOfLiveTeam2 <= 0 {
            print(banner2)
            print("Bravo team two won !!!")
            print("It took \(numberTurn) laps to win the fight...")
            print(banner3)
        }
    }
    
    //========================================
    //              START MENU
    //========================================
    
    for _ in 0...1 {
        if numberGamer == 1
        {
            print("\n"
                + "        " + banner)
        }
        else {
            print("\n"
                + "        " + banner1)
        }
        
        print("\nSELECT 4 SOLDIERS FROM THE ONES LISTED BELOW...")
        if numberGamer == 2 {
            numberTime = 0
        }
        repeat {
            
            print("\nWhat character number \(numberTime+1) do you want in your team :"
                + "\n--------------------------------------------------"
                + "\nStep : 1 to have a   fight  with 100 health and 10 strength"
                + "\nStep : 2 to have a   magus  with  80 health and 10 strength"
                + "\nStep : 3 to have a colossus with 120 health and  7 strength"
                + "\nStep : 4 to have a   dwarf  with  60 health and 15 strength"
                + "\nStep : 5 to have a   rider  with 200 health and 25 strength")
            
            if let choice = readLine() {
                var choiceSoldierTeam = 0
                if Int(choice) != nil {
                 choiceSoldierTeam = Int(choice)!
                }
                if choiceSoldierTeam <= 5 && choiceSoldierTeam > 0 {
                    print("\nHow do you want to call it ?")
                    repeat {
                        
                        if let name = readLine() {
                            check = false
                            warriorName = name
                            check = checkName(name: warriorName)
                        }
                    } while check == true && check == false
                
                    switch choice {
                    case "1":
                        if check == false {
                            recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Fight", numberTime: numberTime, numberPointsOfLive: 100, numberPointsOfAttack: 10, check: check)
                        }
                    case "2":
                        if check == false {
                            recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Magus", numberTime: numberTime, numberPointsOfLive: 80, numberPointsOfAttack: 10, check: check)
                        }
                        
                    case "3":
                        if check == false {
                            recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Colossus", numberTime: numberTime, numberPointsOfLive: 120, numberPointsOfAttack: 7, check: check)
                        }
                    case "4":
                        if check == false {
                            recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Dwarf", numberTime: numberTime, numberPointsOfLive: 60, numberPointsOfAttack: 15, check: check)
                        }
                    case "5":
                        if check == false {
                            recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Rider", numberTime: numberTime, numberPointsOfLive: 200, numberPointsOfAttack: 25, check: check)
                        }
                    default:
                        print("I don't understand.")
                        numberTime -= 1
                }

            }
                else {
                    print("The value must be between 1 and 5 ")
                   numberTime -= 1
                }
            numberTime += 1
            }
        } while numberTime < 4
        numberGamer += 1
    }
    game()
}

gameMenu()

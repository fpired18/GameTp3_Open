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
    var numberPointOfLiveGame = ["Combattant" : 100, "Mage": 80, "Colosse": 120, "Nain": 60, "Cavalier": 200]
    var maxPointOfLiveTeam1 = 0
    var maxPointOfLiveTeam2 = 0
    var maxPointOfLiveTeam = 0
    var numberTurn = 0
    let banner = """
          __
                 |  )                   _
                 |--  _  _  ° _  , ,/) (  _ | _| _ |-   _ ° |
                 |__)(_)| )/_(_)(_(/(_ _)(_)|(_|(_||_  | )__|
                          /)
                         (/
        """
    let banner1 = """
          __
                 |  )                   _                   ,__
                 |--  _  _  ° _  , ,/) (  _ | _| _ |-   _ ° | /
                 |__)(_)| )/_(_)(_(/(_ _)(_)|(_|(_||_  | )__ /__,
                          /)
                         (/
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
           |                         _,
           | , ,  _ (    _  _  _  _ (_      |||
           |(_(__(_|_)_ (_)(_|(_|| |(_      |||
                         /)    /)      °°°  °°°
                        (/    (/
                   
        """
    func checkName(name: String) -> Bool {
// fonction de control du nom
        let nameInit = name
            for i in 0...4 {
                if team1[i]?.nameSoldier == nameInit || team2[i]?.nameSoldier == nameInit {
                    print("\n            =========================================="
                        + "\n                      LE NOM EST DEJA UTILISE."
                        + "\n                       RECOMMENCE TON CHOIX..."
                        + "\n            ==========================================")
                    numberTime -= 1
                    check = true
                }
            }
        return check
    }
    
    func viewTeam(team: [Int : Soldier], numberGamer: Int) {
// fonction d'affichage des équipes
        var team = team
        var oneTime = 1
        if numberTime == 4 {
            for _ in 0...4 {
                if oneTime == 1 {
                    print("\nVoici les membres de l'équipe \(numberGamer): ")
                    print("--------------------------------")
                    for i in 0..<team.count {
                        print("Tape :", i+1, "pour avoir", team[i]?.nameSoldier ?? "Il n'y a rien", "est un", team[i]?.type ?? "SoldatHelp", "qui a",team[i]?.numberPointsOfLive ?? 100,"points de vie et", team[i]?.numberPointsOfAttack ?? 10, "d'attaque")
                        oneTime += 1
                    }
                    if numberGamer == 1 {
                        print("\nVoici le nombre de points de vie de l'équipe 1 ligne 86 : \(maxPointOfLiveTeam1)")
                    }
                    if numberGamer == 2 {
                        print("\nVoici le nombre de points de vie de l'équipe 2 : \(maxPointOfLiveTeam2)")
                    }
                }
            }
        }
    }
    
    func recordName (numberGamer: Int, name: String, typeWarrior: String ,numberTime: Int, numberPointsOfLive: Int, numberPointsOfAttack: Int, check: Bool) {
        var team = [0 :Soldier(), 1: Soldier(), 2: Soldier(), 3: Soldier()]
//fonction d'enregistrement qui inverse juste le team lorsque c'est le tour du joueur 2
        if numberGamer == 1 && check == false {
            team = team1
            maxPointOfLiveTeam1 += numberPointsOfLive
        }
        if numberGamer == 2 && check == false {
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
        print("\n                           RAPPEL DES EQUIPES")
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
                    print("Je ne comprends")
                    validation = false
                }
            }
            return soldier
        }
        
        func openingTrunk(soldier: Soldier) -> Soldier {
            // // Etape 3 : Changeons d'armes, cette fonction prend en charge le BONUS
            var chest = ["Massue","Arbalette","Medicaments","Injection","Dopage"]
            let randomIndex = Int(arc4random_uniform(UInt32(chest.count)))
            let newWeapon = chest[randomIndex]
            
            print("Voici le Soldat reçu à openingTrunk \(soldier.type) ligne 171")
            
            print("\n===================================================================================")
            print("                        ATTENTION LE COFFRE S'OUVRE !!!!!!!")
            print("===================================================================================")
            
            print("\nVoici ce qui est sortie du coffre \(newWeapon)")
            switch soldier.type {
            case "Mage":
                print("Je rentre ici parce que je suis un Mage \(soldier.type)")
                if newWeapon == "Medicaments" || newWeapon == "Injection" {
                    soldier.numberPointsOfAttack *= 2
                }
            case "Cavalier":
                print("Je rentre ici parce que je suis un Cavalier \(soldier.type)")
                if newWeapon == "Dopage" {
                    soldier.numberPointsOfAttack *= 2
                }
            case "Combattant":
                print("Je rentre ici parce que je suis un Combattant \(soldier.type)")
                if newWeapon == "Massue" || newWeapon == "Arbalette" {
                    soldier.numberPointsOfAttack *= 2
                }
            case "Colosse":
                print("Je rentre ici parce que je suis un Colosse \(soldier.type)")
                if newWeapon == "Massue" || newWeapon == "Arbalette" {
                    soldier.numberPointsOfAttack *= 2
                }
            case "Nain":
                print("Je rentre ici parce que je suis un Nain \(soldier.type)")
                if newWeapon == "Massue" || newWeapon == "Arbalette" {
                    soldier.numberPointsOfAttack *= 2
                }
            default:
                print("Je rentre ici parce que je ne suis rien ")
            }
            
            print("\nVoici la nouvelle force de frappe du soldat \(soldier.numberPointsOfAttack)"
                + "\n----------------------------------------------")
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
// Cette boucle a pour mission de controler le nombre de Mage dans l'équipe
                for i in 0...4 {
                    if teamSwap1[i]?.type == "Mage" {
                        numberMage += 1
                        soldier2 = teamSwap1[i]!
                    }
                }
                if numberMage == 4 {
                    print("Tu n'as que des Mages dans ton équipe, tu ne peux pas attaquer. ")
                } else {
                
                    repeat {
                        print("\nCHOISI UN PERSONNAGE DE TON EQUIPE... ")
                        if numberGamer == 1 {
                            viewTeam(team: team1, numberGamer: 1)
                        }
                        if numberGamer == 2 {
                            viewTeam(team: team2, numberGamer: 2)
                        }
                        
                        soldier1 = displayMenu(team: teamSwap1)
    //Capter la valeur initial du soldat sélectionné
                        initialForce = soldier1.numberPointsOfAttack
                        
                        if soldier1.numberPointsOfLive <= 0 {
                            print("Impossible de le sélectionner, il est HS")
                            validation = false
                        }
                        if soldier1.type == "Mage" {
                            print("IMPOSSIBLE DE LE SELECTIONNER POUR COMBATTRE, IL NE PEUT QUE SOIGNIER\n")
                            validationMage = false
                        }
                    } while validation == false
               
    // on affecte le résultat de openingTrunk à la propriété "force_d'attaque" du Soldier1 préalablement envoyé
                    soldier1 = openingTrunk(soldier: soldier1)

                    
                    repeat {
                        if validationMage == true {
                            print("\nCHOISI UN PERSONNAGE DE L'AUTRE EQUIPE... ")
                            if numberGamer == 1 {
                                viewTeam(team: team2, numberGamer: 2)
                            } else {
                                viewTeam(team: team1, numberGamer: 1)
                            }
                            soldier2 = displayMenu(team: teamSwap2)
                            if soldier2.numberPointsOfLive <= 0 {
                                print("Impossible de le sélectionner, il est HS")
                                validation = false
                            }
                        }
                    } while validation == false
                    
                    if validationMage == true {
                        print("====================================")
                        print("Tu viens de sélectionner \(soldier1.nameSoldier)")
                        print("Tu viens de sélectionner \(soldier2.nameSoldier)")
                        print("====================================\n")
                        }
            
                    soldier2.numberPointsOfLive -= soldier1.numberPointsOfAttack
                    if soldier2.numberPointsOfLive < 0 {
                        soldier2.numberPointsOfLive = 0
                    }
                    if numberGamer == 1 && validation == true && validationMage == true {
                        maxPointOfLiveTeam2 -= soldier1.numberPointsOfAttack
                    }
                    if numberGamer == 2 && validation == true && validationMage == true {
                        maxPointOfLiveTeam1 -= soldier1.numberPointsOfAttack
                    }
                    
                    // Retour de la force de frappe initiale
                    soldier1.numberPointsOfAttack = initialForce
                
                    
                    
                    if validationMage == true {
                        if maxPointOfLiveTeam1 < 0 {
                            maxPointOfLiveTeam1 = 0
                            print("\n========================================================")
                            print("Voici le nombre de points de vie de l'équipe 1 : \(maxPointOfLiveTeam1)\n"
                                + "   et le nombre de points de vie de l'équipe 2 : \(maxPointOfLiveTeam2)\n"
                                + "=======================================================")
                        } else {
                          
                            print("Voici le nombre de points de vie de l'équipe 1 : \(maxPointOfLiveTeam1) \nVoici le nombre de points de vie de l'équipe 2 : \(maxPointOfLiveTeam2)\n")
                        }
                        if maxPointOfLiveTeam2 < 0 {
                            maxPointOfLiveTeam2 = 0
                            print("======================================================================")
                            print("Voici le nombre de points de vie de l'équipe 1 : \(maxPointOfLiveTeam1)\n"
                                + "   et le nombre de points de vie de l'équipe 2 : \(maxPointOfLiveTeam2)\n"
                                + "=======================================================")
                        }
                        
                    }
                }
            }
            
            if choice == "2" {
                var validChoiceMage = false
// Cette boucle a pour mission de controler la présence de Mage dans l'équipe et si celui-ci est encore en vie
                for i in 0...4 {
                    if teamSwap1[i]?.type == "Mage" {
                        soldier2 = teamSwap1[i]!
                        validChoiceMage = true
                        if soldier2.numberPointsOfLive == 0 {
                            validChoiceMage = false
                        }
                    }
                }
               if validChoiceMage == false {
                    print("Tu n'as pas de Mage dans ton équipe en état d'agir. ")
                } else {
                
                //Capter la valeur initial du soldat sélectionné
                initialForce = soldier2.numberPointsOfAttack

                print("Voici le Mage envoyé à openingTrunk\(soldier2.type) ligne 332")
                
                        soldier2 = openingTrunk(soldier: soldier2)

                
                        print("Choisi le personnage à soignier ")
                        if numberGamer == 1 {
                            viewTeam(team: team1, numberGamer: 1)
                        }
                        if numberGamer == 2 {
                            viewTeam(team: team2, numberGamer: 2)
                        }
                
                        soldier1 = displayMenu(team: teamSwap1)
            
                
                
                        for (typeSoldier, numberPointOfLive) in numberPointOfLiveGame {
                            if typeSoldier == soldier1.type {
            // récupération du nombre maxi de point de vie selon le type de soldat
                                maxNumberOfLive = numberPointOfLive
                            }
                        }
                        if soldier1.numberPointsOfLive == maxNumberOfLive {
                            print("Voici le nombre de point de \(soldier1.numberPointsOfLive)")
                            print("Inutile de le soignier il est en pleine forme ")
                            validation = false
                        }
                        if soldier1.numberPointsOfLive <= 0 {
                            print("Tu arrives trop tard le soldat est H.S. \n")
                            validation = false
                        } else {
                            soldier1.numberPointsOfLive += soldier2.numberPointsOfAttack
                        }
                        if numberGamer == 1 && validation == true {
                            maxPointOfLiveTeam1 += soldier2.numberPointsOfAttack
                        }
                        if numberGamer == 2 && validation == true {
                            maxPointOfLiveTeam2 += soldier2.numberPointsOfAttack
                        }
                 
            // Retour de la force de frappe initiale
                         soldier2.numberPointsOfAttack = initialForce
                
                    if validation == false {
                        print("Voici le résultat du soin du \(soldier2.type) il a ajouté \(soldier2.numberPointsOfAttack) points de vie ")
                        if maxPointOfLiveTeam1 < 0 {
                            maxPointOfLiveTeam1 = 0
                            print("Voici le nombre de points de vie de l'équipe 1 : \(maxPointOfLiveTeam1)\n"
                                + "   et le nombre de points de vie de l'équipe 2 : \(maxPointOfLiveTeam2)")
                        }
                        if maxPointOfLiveTeam2 < 0 {
                            maxPointOfLiveTeam2 = 0
                            print("Voici le nombre de points de vie de l'équipe 1 : \(maxPointOfLiveTeam1)\n"
                                + "   et le nombre de points de vie de l'équipe 2 : \(maxPointOfLiveTeam2)")
                        }
                    }
                }
            }
        }
        
        repeat {
            // numberTurn comptabilise le nombre de tour pour informer le gagnant en fin de partie
            numberTurn += 1
            // turnNumber maintient trois cycles
            var controle = true
            print("\n======================================"
                + "\nGAMER\(gamer) VEUX-TU COMBATTRE OU SOIGNIER ? "
                + "\n======================================"
                + "\nTape : 1 pour combattre"
                + "\nTape : 2 pour soignier")
            if let choice = readLine() {
                switch choice {
                case "1":
                    choiceSoldier(choice: choice, numberGamer: gamer, team1: team1, team2: team2)
                    
                case "2":
                    choiceSoldier(choice: choice, numberGamer: gamer, team1: team1, team2: team2)
                default:
                    print("Je ne comprends pas.")
                    controle = false
                }
            }
             //turnNumber += 1
            if gamer == 1 && controle == true {
                gamer = 2
            } else {
                gamer = 1
            }
            
        } while maxPointOfLiveTeam1 != 0 && maxPointOfLiveTeam2 != 0
        
        if maxPointOfLiveTeam1 <= 0 {
            print(banner2)
            print("Bravo l'équipe deux as gagné !!!")
            print("Il aura fallut \(numberTurn) tours pour remporter le combat...")
            print(banner3)
        }
        if maxPointOfLiveTeam2 <= 0 {
            print(banner2)
            print("Bravo l'équipe une as gagné !!!")
            print("Il aura fallut \(numberTurn) tours pour remporter le combat...")
            print(banner3)
        }
    }
    
    //========================================
    //              MENU DE DEMARRAGE
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
        
        print("\nSELECTIONNE 4 SOLDATS PARMI CEUX LISTÉS CI-DESSOUS...")
        if numberGamer == 2 {
            numberTime = 0
        }
        repeat {
            
            print("\nQuel personnage numéro \(numberTime+1) veux-tu dans ton équipe :"
                + "\n--------------------------------------------------"
                + "\nTape : 1 pour avoir un Combattant avec 100 points de vie et 10 de force "
                + "\nTape : 2 pour avoir un   Mage     avec  80 points de vie et 10 de force "
                + "\nTape : 3 pour avoir un  Colosse   avec 120 points de vie et  7 de force "
                + "\nTape : 4 pour avoir un   Nain     avec  60 points de vie et 15 de force (40 pour les testes)"
                + "\nTape : 5 pour avoir un Cavalier   avec 200 points de vie et 25 de force")
            
            if let choice = readLine() {
                var choiceSoldierTeam = 0
                if Int(choice) != nil {
                 choiceSoldierTeam = Int(choice)!
                }
                if choiceSoldierTeam <= 5 && choiceSoldierTeam > 0 {
                    print("\nComment veux-tu l'appeler ?")
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
                            recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Combattant", numberTime: numberTime, numberPointsOfLive: 100, numberPointsOfAttack: 10, check: check)
                        }
                    case "2":
                        if check == false {
                            recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Mage", numberTime: numberTime, numberPointsOfLive: 80, numberPointsOfAttack: 10, check: check)
                        }
                        
                    case "3":
                        if check == false {
                            recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Colosse", numberTime: numberTime, numberPointsOfLive: 120, numberPointsOfAttack: 7, check: check)
                        }
                    case "4":
                        if check == false {
                            recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Nain", numberTime: numberTime, numberPointsOfLive: 60, numberPointsOfAttack: 40, check: check)
                        }
                    case "5":
                        if check == false {
                            recordName(numberGamer: numberGamer, name: warriorName, typeWarrior: "Cavalier", numberTime: numberTime, numberPointsOfLive: 200, numberPointsOfAttack: 25, check: check)
                        }
                    default:
                        print("Je ne comprends pas.")
                        numberTime -= 1
                }

            }
                else {
                    print("La valeur doit être comprise entre 1 et 5 ")
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

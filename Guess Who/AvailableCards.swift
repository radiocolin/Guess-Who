//
//  AvailableCards.swift
//  Guess Who
//
//  Created by Colin Weir on 6/30/22.
//

import Foundation
import UIKit

let availableCards = [
                 "image-1":Card(image: UIImage(named: "image-1"), gender:  "Woman", noseSize: "Medium", eyes: "Brown", hair: "Brown", glasses: true),
                 "image-2":Card(image: UIImage(named: "image-2"), gender:  "Man", noseSize: "Medium", eyes: "Hidden", hair: "Blonde", glasses: true),
                 "image-3":Card(image: UIImage(named: "image-3"), gender:  "Woman", noseSize: "Small", eyes: "Blue", hair: "Brown", glasses: false),
                 "image-4":Card(image: UIImage(named: "image-4"), gender:  "Man", noseSize: "Big", eyes: "Brown", hair: "Gray", glasses: false),
                 "image-5":Card(image: UIImage(named: "image-5"), gender:  "Woman", noseSize: "Small", eyes: "Brown", hair: "Brown", glasses: false),
                 "image-6":Card(image: UIImage(named: "image-6"), gender:  "Man", noseSize: "Small", eyes: "Blue", hair: "Gray", glasses: false),
                 "image-7":Card(image: UIImage(named: "image-7"), gender:  "Woman", noseSize: "Small", eyes: "Brown", hair: "Blonde", glasses: false),
                 "image-8":Card(image: UIImage(named: "image-8"), gender:  "Woman", noseSize: "Small", eyes: "Blue", hair: "Blonde", glasses: true),
                 "image-9":Card(image: UIImage(named: "image-9"), gender:  "Man", noseSize: "Big", eyes: "Blue", hair: "Gray", glasses: false),
                 "image-10":Card(image: UIImage(named: "image-10"), gender: "Woman", noseSize: "Small", eyes: "Brown", hair: "Red", glasses: false),
                 "image-11":Card(image: UIImage(named: "image-11"), gender: "Man", noseSize: "Medium", eyes: "Brown", hair: "Gray", glasses: false),
                 "image-12":Card(image: UIImage(named: "image-12"), gender: "Woman", noseSize: "Small", eyes: "Brown", hair: "Brown", glasses: true),
                 "image-13":Card(image: UIImage(named: "image-13"), gender: "Man", noseSize: "Big", eyes: "Brown", hair: "Brown", glasses: false),
                 "image-14":Card(image: UIImage(named: "image-14"), gender: "Man", noseSize: "Big", eyes: "Brown", hair: "Black", glasses: false),
                 "image-15":Card(image: UIImage(named: "image-15"), gender: "Woman", noseSize: "Big", eyes: "Brown", hair: "Brown", glasses: false),
                 "image-16":Card(image: UIImage(named: "image-16"), gender: "Man", noseSize: "Medium", eyes: "Blue", hair: "Gray", glasses: true),
                 "image-17":Card(image: UIImage(named: "image-17"), gender: "Man", noseSize: "Big", eyes: "Brown", hair: "Black", glasses: false),
                 "image-18":Card(image: UIImage(named: "image-18"), gender: "Man", noseSize: "Small", eyes: "Brown", hair: "Black", glasses: false),
                 "image-19":Card(image: UIImage(named: "image-19"), gender: "Woman", noseSize: "Big", eyes: "Green", hair: "Red", glasses: false),
                 "image-20":Card(image: UIImage(named: "image-20"), gender: "Woman", noseSize: "Big", eyes: "Brown", hair: "Brown", glasses: false),
                 "image-21":Card(image: UIImage(named: "image-21"), gender: "Woman", noseSize: "Medium", eyes: "Brown", hair: "Blonde", glasses: false),
                 "image-22":Card(image: UIImage(named: "image-22"), gender: "Woman", noseSize: "Small", eyes: "Blue", hair: "Red", glasses: false),
                 "image-23":Card(image: UIImage(named: "image-23"), gender: "Woman", noseSize: "Big", eyes: "Brown", hair: "Red", glasses: false),
                 "image-24":Card(image: UIImage(named: "image-24"), gender: "Man", noseSize: "Big", eyes: "Brown", hair: "Brown", glasses: true),
                 "image-25":Card(image: UIImage(named: "image-25"), gender: "Woman", noseSize: "Medium", eyes: "Brown", hair: "Brown", glasses: false),
                 "image-26":Card(image: UIImage(named: "image-26"), gender: "Man", noseSize: "Big", eyes: "Hidden", hair: "Gray", glasses: true),
                 "image-27":Card(image: UIImage(named: "image-27"), gender: "Man", noseSize: "Big", eyes: "Brown", hair: "Brown", glasses: false),
                 "image-28":Card(image: UIImage(named: "image-28"), gender: "Man", noseSize: "Big", eyes: "Brown", hair: "Brown", glasses: false),
                 "image-29":Card(image: UIImage(named: "image-29"), gender: "Man", noseSize: "Big", eyes: "Brown", hair: "Gray", glasses: false),
                 "image-30":Card(image: UIImage(named: "image-30"), gender: "Woman", noseSize: "Big", eyes: "Brown", hair: "Black", glasses: false),
                 "image-31":Card(image: UIImage(named: "image-31"), gender: "Man", noseSize: "Small", eyes: "Brown", hair: "Gray", glasses: true),
                 "image-32":Card(image: UIImage(named: "image-32"), gender: "Man", noseSize: "Small", eyes: "Blue", hair: "Gray", glasses: true),
                 "image-33":Card(image: UIImage(named: "image-33"), gender: "Woman", noseSize: "Medium", eyes: "Brown", hair: "Brown", glasses: true),
                 "image-34":Card(image: UIImage(named: "image-34"), gender: "Man", noseSize: "Medium", eyes: "Blue", hair: "Gray", glasses: true),
                 "image-35":Card(image: UIImage(named: "image-35"), gender: "Woman", noseSize: "Medium", eyes: "Brown", hair: "Brown", glasses: false),
                 "image-36":Card(image: UIImage(named: "image-36"), gender: "Woman", noseSize: "Big", eyes: "Brown", hair: "Brown", glasses: false),
                 "image-37":Card(image: UIImage(named: "image-37"), gender: "Man", noseSize: "Big", eyes: "Blue", hair: "Brown", glasses: true),
                 "image-38":Card(image: UIImage(named: "image-38"), gender: "Man", noseSize: "Big", eyes: "Brown", hair: "Black", glasses: false),
                 "image-39":Card(image: UIImage(named: "image-39"), gender: "Man", noseSize: "Big", eyes: "Brown", hair: "Black", glasses: false),
                 "image-40":Card(image: UIImage(named: "image-40"), gender: "Woman", noseSize: "Big", eyes: "Blue", hair: "Red", glasses: false),
                 "image-41":Card(image: UIImage(named: "image-41"), gender: "Man", noseSize: "Big", eyes: "Brown", hair: "Black", glasses: true),
                 "image-42":Card(image: UIImage(named: "image-42"), gender: "Woman", noseSize: "Small", eyes: "Brown", hair: "Brown", glasses: false),
                 "image-43":Card(image: UIImage(named: "image-43"), gender: "Woman", noseSize: "Medium", eyes: "Hidden", hair: "Black", glasses: true),
                 "image-44":Card(image: UIImage(named: "image-44"), gender: "Man", noseSize: "Medium", eyes: "Brown", hair: "Brown", glasses: false),
                 "image-45":Card(image: UIImage(named: "image-45"), gender: "Woman", noseSize: "Medium", eyes: "Brown", hair: "Brown", glasses: true),
                 "image-46":Card(image: UIImage(named: "image-46"), gender: "Woman", noseSize: "Small", eyes: "Blue", hair: "Blonde", glasses: true),
                 "image-47":Card(image: UIImage(named: "image-47"), gender: "Man", noseSize: "Small", eyes: "Blue", hair: "Blonde", glasses: false),
                 "image-48":Card(image: UIImage(named: "image-48"), gender: "Man", noseSize: "Small", eyes: "Blue", hair: "Gray", glasses: true),
                 "image-49":Card(image: UIImage(named: "image-49"), gender: "Woman", noseSize: "Medium", eyes: "Brown", hair: "Black", glasses: false),
                 "image-50":Card(image: UIImage(named: "image-50"), gender: "Man", noseSize: "Big", eyes: "Brown", hair: "Black", glasses: false),
                 "image-51":Card(image: UIImage(named: "image-51"), gender: "Woman", noseSize: "Medium", eyes: "Brown", hair: "Brown", glasses: false)
]

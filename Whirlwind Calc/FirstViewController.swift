//
//  FirstViewController.swift
//  Whirlwind Calc
//
//  Created by Meg B on 8/6/19.
//  Copyright © 2019 Meg B. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var outputTable: UITableView!
    @IBOutlet weak var oneSide: UITextField!
    @IBOutlet weak var twoSide: UITextField!
    @IBOutlet weak var threeSide: UITextField!
    @IBOutlet weak var fourSide: UITextField!
    @IBOutlet weak var outputView: UITextView!
    @IBOutlet weak var calcButton: UIButton!
    
    public func getNumbers() -> [Double] {
        let first:Double = Double(oneSide.text!)!
        let second:Double = Double(twoSide.text!)!
        let third:Double = Double(threeSide.text!)!
        let fourth:Double = Double(fourSide.text!)!
        return [first, second, third, fourth]
    }
    
    @IBAction func calcButton(_ sender: UIButton) {
    
    let sideLengths = getNumbers()
    let sideSum = sideLengths.reduce(0, +)
    let corners = sideLengths.count - 1
    let sixSect = sixFootSections (value: sideLengths)
    let sixSectTotal = sixSect.reduce(0, +)
    let sideSumDouble = Double (sideSum)
        // How do I make \/ this section optimal? 
    let picketSolidFour = round(sideSumDouble * 12.0 / 3.5 + 10.0 + sixSectTotal)
    let picketSolidSix = round(sideSumDouble * 12.0 / 5.5 + 10.0 + sixSectTotal)
    let picketSolidEight = round(sideSumDouble * 12.0 / 7.5 + 10.0 + sixSectTotal)
    //let eightSect = eightFootSections(value: sideLengths)
    //let eightSectTotal = eightSect.reduce(0, +)
    
        
        outputView.text = """
        Total Length = \(sideSum)
        # of Corners = \(corners)
        6ft sections = \(sixSectTotal)
        Line Posts = \(sixSectTotal)
        Rails (2-rail) = \(sixSectTotal * 2)
        Pickets (4" solid board) = \(picketSolidFour)
        Pickets (6" solid board) = \(picketSolidSix)
        Pickets (8" solid board) = \(picketSolidEight)
        """
    }
    /* 8ft sections = \(eightSectTotal) */
    
    func roundToMultipleOfSix(value: Int) -> Int {
        let number = Double(value)
        let roundSix = ceil(number/6)
        let roundAgain = Double(roundSix)
        return Int(roundAgain)
    }
   /* func roundToMultipleOfEight(value: Int) -> Int {
        let number = Double(value)
        let roundEight = ceil(number/8)
        let roundAgain = Int(roundEight)
        return roundAgain
    } */
    
    func sixFootSections (value: Array<Double>) -> Array<Double> {
        let sideLengths = getNumbers()
        var sixes = [Double]()
        for sides in sideLengths {
            sixes.append(Double(roundToMultipleOfSix(value: Int(Double(sides)))))
        }
        return sixes
    }
/*    func eightFootSections (value: Array<Int>) -> Array<Int> {
        let sideLengths = getNumbers()
        var eights = [Int]()
        for sides in sideLengths {
            eights.append(roundToMultipleOfEight(value: sides))
        }
        return eights
    } */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // outputTable.dataSource = self
        }
   /* func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    } */
}


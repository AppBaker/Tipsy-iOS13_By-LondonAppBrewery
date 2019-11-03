//
//  Bill.swift
//  Tipsy
//
//  Created by Ivan Nikitin on 03.11.2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Bill {
    var totalBill: Double
    var tip: Double
    var persons: Double
    
    func getEachBill() -> Double {
        return (totalBill + totalBill * tip)/persons
    }
}

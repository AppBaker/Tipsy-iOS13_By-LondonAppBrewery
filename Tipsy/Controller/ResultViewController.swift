//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Ivan Nikitin on 02.11.2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var bill: Bill?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "\(String(format: "%0.2f", bill?.getEachBill() ?? 0.0))$"
        settingsLabel.text =
        """
        Split between \(String(format: "%0.0f", bill?.persons ?? 0)) persons
        With \(String(format: "%0.0f", (bill?.tip ?? 0) * 100))% tip.
        """
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

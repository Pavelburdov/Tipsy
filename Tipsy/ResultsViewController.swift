//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Pavel on 02.08.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var showRes = "0.00"
    var split = 2
    var tip = 0
    @IBOutlet weak var totalLabel: UILabel!

    

    @IBOutlet weak var settingsLabel: UILabel!




    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = showRes
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}

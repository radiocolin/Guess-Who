//
//  SettingsViewController.swift
//  Guess Who
//
//  Created by Colin Weir on 6/30/22.
//

import UIKit

class SettingsViewController: UIViewController {

    var game: Game?
    
    @IBOutlet weak var remainingBonus: UITextField!
    @IBOutlet weak var wrongPenalty: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        remainingBonus.text = String(game!.perCardBonus)
        wrongPenalty.text = String(game!.wrongQuestionPenalty)
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

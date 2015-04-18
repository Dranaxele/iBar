//
//  AddController.swift
//  iBar
//
//  Created by Alexandre Plaitant on 23/03/2015.
//  Copyright (c) 2015 Alexandre Plaitant. All rights reserved.
//

import UIKit

class AddController: UIViewController {

    @IBOutlet weak var Nom: UITextField!
    @IBOutlet weak var Type: UITextField!
    @IBOutlet weak var Categorie: UITextField!
    @IBOutlet weak var Difficulte: UITextField!
    @IBOutlet weak var Contenant: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // TODO: Charger les differents contenant pour la liste avec le services web (API)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SaveButton(sender: AnyObject) {
        // TODO: Envoyer une requete HTTP POST afin de permettre l'enregistrement dans la base de données
        
    }

}

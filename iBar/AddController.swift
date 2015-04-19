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
    @IBOutlet weak var Contenant: UITextField!
    
    var itemsType: [String] = ["Acide","Amer","Fruité", "Incoutournable", "Original", "Rafraichsissant", "Salé", "Sans alcool", "Sucré"]
    
    var itemsCategorie: [String] = ["Shooter", "Short Drink", "Long Drink"]
    
    var itemsDifficulte: [String] = ["Facile", "Moyen", "Difficulté"]
    
    var itemsContenant: [String] = ["25", "30", "50", "100"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // TODO: Charger les differents contenant pour la liste avec le services web (API)
        let request = NSMutableURLRequest(URL: NSURL(string: "http://alexandreplaitant.ddns.net/iBar/api.php")!)
        request.HTTPMethod = "POST"
        let postString = "Nom=/(Nom.text)&Type=/(Type.text)&Categorie=/(Categorie.text)&Difficulté=/(Difficulte.text)&Contenant=/(Contenant)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                println("error=\(error)")
                return
            }
            
            println("response = \(response)")
            
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("responseString = \(responseString)")
        }
        task.resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SaveButton(sender: AnyObject) {
        // TODO: Envoyer une requete HTTP POST afin de permettre l'enregistrement dans la base de données
        
    }

}

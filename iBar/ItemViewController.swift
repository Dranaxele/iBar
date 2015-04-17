//
//  ItemViewController.swift
//  iBar
//
//  Created by Alexandre Plaitant on 17/04/2015.
//  Copyright (c) 2015 Alexandre Plaitant. All rights reserved.
//

import UIKit

class ItemViewController : UIViewController {
    
    required init(coder aDecoder: NSCoder) {
        self.itemCocktail = Cocktail(id: "", nom: "", type: "", categ: "", difficulte: "", contenance: "", alcool: "")
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var Nom: UILabel!
    @IBOutlet weak var Type: UILabel!
    @IBOutlet weak var Categorie: UILabel!
    @IBOutlet weak var Difficulte: UILabel!
    @IBOutlet weak var Contenance: UILabel!
    @IBOutlet weak var Alcool: UILabel!
    
    var itemCocktail : Cocktail
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Nom.text = itemCocktail.nomC
        Type.text = itemCocktail.typeC
        Categorie.text = itemCocktail.categC
        Difficulte.text = itemCocktail.difficulte
        Contenance.text = itemCocktail.contenance
        Alcool.text = itemCocktail.alcool
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}
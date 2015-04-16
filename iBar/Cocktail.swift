//
//  Cocktail.swift
//  iBar
//
//  Created by Alexandre Plaitant on 16/04/2015.
//  Copyright (c) 2015 Alexandre Plaitant. All rights reserved.
//

import Foundation

class Cocktail{
    
    var id : String
    var nomC : String
    var typeC : String
    var categC : String
    var difficulte : String
    var contenance : String
    var alcool : String
    
    init(id:String, nom:String, type:String, categ:String, difficulte:String, contenance:String, alcool:String){
        self.id = id
        self.nomC = nom
        self.typeC = type
        self.categC = categ
        self.difficulte = difficulte
        self.contenance = contenance
        self.alcool = alcool
    }
    
    
    
}

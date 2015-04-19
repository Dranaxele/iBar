//
//  TableViewController.swift
//  iBar
//
//  Created by Alexandre Plaitant on 23/03/2015.
//  Copyright (c) 2015 Alexandre Plaitant. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var listCocktailView: UITableView!
    var lstC : [Cocktail] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCocktailView.delegate = self
        listCocktailView.dataSource = self
        
        
        //var endpoint = NSURL(string: "http://192.168.1.11/iBar/api.php")
        var endpoint = NSURL(string: "http://alexandreplaitant.dds.net/iBar/api.php")
        var data = NSData(contentsOfURL: endpoint!)
        
        let json = JSON(data: data!)
        
        for (index: String, subJson: JSON) in json {
            lstC.append(Cocktail(id: subJson["id"].stringValue,
                nom: subJson["nom_cocktail"].stringValue,
                type: subJson["nom_type"].stringValue,
                categ: subJson["nom_categorie"].stringValue,
                difficulte: subJson["nom_difficulte"].stringValue,
                contenance: subJson["nom_contenance"].stringValue,
                alcool: subJson["nom_alcool"].stringValue))
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return lstC.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = listCocktailView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel.text = self.lstC[indexPath.row].nomC

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        // Return NO if you do not want the specified item to be editable.
        listCocktailView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        println(lstC[row])
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        println("SEGUE id: \(segue.identifier)")
        if (segue.identifier == "item"){
            let destinationVC = segue.destinationViewController as ItemViewController
            let indexPath = self.listCocktailView.indexPathForSelectedRow()
            destinationVC.itemCocktail = lstC[indexPath!.row]
        }
    }
}

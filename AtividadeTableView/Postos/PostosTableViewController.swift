//
//  PostosTableViewController.swift
//  AtividadeTableView
//
//  Created by Felipe Luna Tersi on 20/05/19.
//  Copyright © 2019 Felipe Luna Tersi. All rights reserved.
//

import UIKit

class PostosTableViewController: UITableViewController {
    
    @IBOutlet var postosTableView: UITableView!
    
    var name:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name = ["BR", "Shell", "Ipiranga"]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    func adicionaPosto(nomePosto: String) {
        name.append(nomePosto)
    }
    
    @IBAction func backToPostos(_ segue: UIStoryboardSegue) {
        
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostoTableViewCell") as! PostoTableViewCell
        
        cell.postoName.text = name[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "voltaAbastecimento", sender: name[indexPath.row])
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "voltaAbastecimento" {
            if let abastecimentoVC = segue.destination as? AbastecimentoTableViewController {
              abastecimentoVC.posto = sender as? String
            }
        }
        
        if segue.identifier == "novoPostoSegue" {
            if let novoPostoVC = segue.destination as? NovoPostoTableViewController {
                novoPostoVC.telaLista = self
            }
        }
    }


}

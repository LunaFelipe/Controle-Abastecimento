//
//  ViewController.swift
//  AtividadeTableView
//
//  Created by Felipe Luna Tersi on 20/05/19.
//  Copyright © 2019 Felipe Luna Tersi. All rights reserved.
//

import UIKit


struct Posto {
    var posto: String
    var combustivel: String
    var valor: String
    var data: String
    var nomeServico: String
    var valorServico: String
    var valorLitro: String
}


class PrincipalTableViewController: UITableViewController {
    
    var lista:[Posto] = []
    
   
    func addPosto(posto: Posto)  {
        lista.append(posto)
//        print("Postos \(lista)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrincipalTableViewCell") as! PrincipalTableViewCell
        
        let posto = lista[indexPath.row]
        
        cell.infoCombustivel.text = posto.combustivel
        cell.infoPosto.text = posto.posto
        cell.infoValor.text = posto.valor
        cell.infoData.text = posto.data
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            lista.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }

    @IBAction func backToPrincipal(_ segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "novoAbastecimento" {
            if let abastecimentoVC  = segue.destination as? AbastecimentoTableViewController {
                abastecimentoVC.principal = self
            }
        }
    }
    
    
    
}


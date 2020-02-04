//
//  AbastecimentoTableViewController.swift
//  AtividadeTableView
//
//  Created by Felipe Luna Tersi on 20/05/19.
//  Copyright © 2019 Felipe Luna Tersi. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: class {
    func didChangeDate(date: Date, indexPath: IndexPath)
}

enum DateFormatType: String {
    
    case date = "dd-MMM-yyyy"
}


class AbastecimentoTableViewController: UITableViewController {

//    let numberOfRowsAtSection: [Int] = [2, 3, 2]
//    var telaLista: PostosTableViewController?
    
    var principal: PrincipalTableViewController?
    var datePickerIndexPath: IndexPath!
    weak var delegate: DatePickerDelegate?
    
    var flag: Int = 0
   
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func updateCell(date: Date, indexPath: IndexPath) {
        datePicker.setDate(date, animated: true)
        self.datePickerIndexPath = indexPath
    }
    
    func updateText(text: String, date: Date) {
        dataLabel.text = date.convertToString(dateformat: .date)
    }
    
    // Update text
    @objc func dateDidChange(_ sender: UIDatePicker) {
        let indexPathForDisplayDate = IndexPath(row: 1, section: 0)
        
        let date = sender.date
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "pt-BR")
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        let strDate = dateFormatter.string(from: date)
        
        dataLabel.text = strDate
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

    @IBOutlet weak var nomeServico: UITextField!
    @IBOutlet weak var valorServico: UITextField!
    @IBOutlet weak var valorLitro: UITextField!
    @IBOutlet weak var valorTotal: UITextField!
    @IBOutlet weak var selecionePosto: UILabel!
    @IBOutlet weak var selecioneCombustivel: UILabel!
    
    
    @IBAction func cancelarAbastecimento(_ sender: Any) {
        performSegue(withIdentifier: "backToPrincipal", sender: nil)
    }
    
    @IBAction func confirmarAbastecimento(_ sender: Any) {
        

        principal?.addPosto(posto: Posto(posto: selecionePosto.text ?? "",
                                         combustivel: selecioneCombustivel.text ?? "",
                                         valor: valorTotal.text ?? "",
                                         data: dataLabel.text ?? "",
                                         nomeServico: nomeServico.text ?? "",
                                         valorServico: valorServico.text ?? "",
                                         valorLitro: valorLitro.text ?? ""))
        
        performSegue(withIdentifier: "backToPrincipal", sender: self)
    }

    var posto: String?
    var combustivel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        datePicker.addTarget(self, action: #selector(dateDidChange), for: .valueChanged)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if posto?.isEmpty ?? true {
            selecionePosto.text = "Selecione um posto"
        } else {
            selecionePosto.text = posto
        }
        
        if combustivel?.isEmpty ?? true {
            selecioneCombustivel.text = "Selecione o combustível"
        } else {
            selecioneCombustivel.text = combustivel
        }
        
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows: Int = 0
        
        if section < numberOfRowsAtSection.count {
            rows = numberOfRowsAtSection[section]
        }
        
        return rows
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 1 && flag == 0 { // date cell
            flag = 1
            pickerHeight = 216
            let index = IndexPath(row: 2, section: 0)
            tableView.reloadRows(at: [index], with: .none)
        } else if indexPath.section == 0 && indexPath.row == 1 && flag == 1 {
            pickerHeight = 0
            flag = 0
            let index = IndexPath(row: 1, section: 0)
            tableView.reloadRows(at: [index], with: .none)
        }
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.selectionStyle = .none
        
    }
    
    var pickerHeight: CGFloat = 0
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height: CGFloat = 44
        
        if indexPath.section == 0 &&
            indexPath.row == 2 { // pickerview cell
            height = pickerHeight
        }
        return height
    }
    
    
    func indexPathToInsertDatePicker(indexPath: IndexPath) -> IndexPath {
        if let datePickerIndexPath = datePickerIndexPath, datePickerIndexPath.row < indexPath.row {
            return indexPath
        } else {
            return IndexPath(row: indexPath.row + 1, section: indexPath.section)
        }
    }
    
    @IBAction func backToAbastecimento(_ segue: UIStoryboardSegue) {
        
    }
    
        
}

extension Date {
    
    func convertToString(dateformat formatType: DateFormatType) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatType.rawValue
        let newDate: String = dateFormatter.string(from: self)
        return newDate
}

}

//Exemplo
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        datePickerIndexPath = indexPath
//        tableView.beginUpdates()
//
//        if let datePickerIndexPath = datePickerIndexPath,   datePickerIndexPath.row - 1 == indexPath.row {
//            tableView.deleteRows(at: [datePickerIndexPath], with: .fade)
//            self.datePickerIndexPath = nil
//        } else {
//            // 2
//            if let datePickerIndexPath = datePickerIndexPath {
//                tableView.deleteRows(at: [datePickerIndexPath], with: .fade)
//            }
//            datePickerIndexPath = indexPathToInsertDatePicker(indexPath: indexPath)
//            tableView.insertRows(at: [datePickerIndexPath!], with: .fade)
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
//
//        tableView.endUpdates()
//    }

//Tentativa Height
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 &&
//            indexPath.row == 2 {
////            pickerHeight.constant = 216
//            return 200
//        } else {
//            return UITableView.automaticDimension
////            pickerHeight.constant = 0
//        }
//    }


//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0 {
//            performSegue(withIdentifier: "listaPosto", sender: nil)
//        }
//    }

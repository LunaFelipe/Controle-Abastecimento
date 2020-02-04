//
//  PrincipalTableViewCell.swift
//  AtividadeTableView
//
//  Created by Felipe Luna Tersi on 23/05/19.
//  Copyright © 2019 Felipe Luna Tersi. All rights reserved.
//

import UIKit

class PrincipalTableViewCell: UITableViewCell {

    @IBOutlet weak var infoPosto: UILabel!
    @IBOutlet weak var infoCombustivel: UILabel!
    @IBOutlet weak var infoValor: UILabel!
    @IBOutlet weak var infoData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

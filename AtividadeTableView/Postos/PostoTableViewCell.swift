//
//  PostoTableViewCell.swift
//  AtividadeTableView
//
//  Created by Felipe Luna Tersi on 20/05/19.
//  Copyright © 2019 Felipe Luna Tersi. All rights reserved.
//

import UIKit

class PostoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postoName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

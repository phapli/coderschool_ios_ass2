//
//  CheckBoxCell.swift
//  coderschool_ios_ass2
//
//  Created by Tran Tien Tin on 6/24/17.
//  Copyright © 2017 phapli. All rights reserved.
//

import UIKit

protocol CheckBoxCellDelegate {
    func checkboxCell(checkboxCell: CheckBoxCell)
}

class CheckBoxCell: UITableViewCell {

    var delegate: CheckBoxCellDelegate!
    
    @IBOutlet weak var checkboxLabel: UILabel!
    @IBOutlet weak var checkboxControl: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onCheck(_ sender: UIButton) {
        self.delegate.checkboxCell(checkboxCell: self)
    }
}

//
//  SwitchCell.swift
//  coderschool_ios_ass2
//
//  Created by Tran Tien Tin on 6/23/17.
//  Copyright © 2017 phapli. All rights reserved.
//

import UIKit

protocol SwitchCellDelegate {
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool)
}

class SwitchCell: UITableViewCell {
    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    
    
    var delegate: SwitchCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onSwitchChange(_ sender: UISwitch) {
        print("change to \(sender.isOn)")
        delegate.switchCell(switchCell: self, didChangeValue: sender.isOn)
    }
}

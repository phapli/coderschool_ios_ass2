//
//  BusinessCell.swift
//  coderschool_ios_ass2
//
//  Created by Tran Tien Tin on 6/22/17.
//  Copyright © 2017 phapli. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var businessImage: UIImageView!
    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var business: Business! {
        didSet {
            businessImage.setImageWith(business.imageURL!)
            businessName.text = business.name
            distanceLabel.text = business.distance
            ratingImage.setImageWith(business.ratingImageURL!)
            reviewLabel.text = "\(business.reviewCount ?? 0)"
            addressLabel.text = business.address
            categoryLabel.text = business.categories
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

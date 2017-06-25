//
//  SearchSetting.swift
//  coderschool_ios_ass2
//
//  Created by Tran Tien Tin on 6/23/17.
//  Copyright © 2017 phapli. All rights reserved.
//

import Foundation

// Model class that represents the user's search settings
class SearchSettings {
    var searchString: String?
    var offerDeal: Bool?
    var distance: Float = 0
    var sortBy: YelpSortMode?
    var category: [String]?
    
    init() {
        
    }
}

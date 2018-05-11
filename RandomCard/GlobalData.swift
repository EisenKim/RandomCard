//
//  GlobalData.swift
//  RandomCard
//
//  Created by Myeong chul Kim on 2018. 5. 11..
//  Copyright © 2018년 Myeong chul Kim. All rights reserved.
//

import Foundation

class GlobalData {
    static let sharedInstance = GlobalData()
    
    var strName: String!
    
    private init() {
        self.strName = ""
    }
}

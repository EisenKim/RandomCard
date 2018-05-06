//
//  DecimalFormatter.swift
//  CarDirect
//
//  Created by Myeong chul Kim on 2017. 11. 14..
//  Copyright © 2017년 RichnCo. All rights reserved.
//

import Foundation

class DecimalFormatter: NumberFormatter {
    override init() {
        super.init()
        self.locale = Locale(identifier: "ko_KR")
        self.numberStyle = .decimal
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

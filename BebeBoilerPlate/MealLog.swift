//
//  MealLog.swift
//  BebeBoilerPlate
//
//  Created by sei on 10/23/23.
//

import Foundation
import SwiftData

enum MealType: Int, Codable, CaseIterable, Hashable {
    case 수유 = 0
    case 이유식

    var description: String {
        switch self {
        case .수유:
            "수유"
        case .이유식:
            "이유식"
        }
    }
}

@Model
final class MealLog {
    var timestamp: Date
    var mealType: MealType
    var amount: Int

    init(timestamp: Date = Date(), 
         mealType: MealType = .수유,
         amount: Int = 10) {
        self.timestamp = timestamp
        self.mealType = mealType
        self.amount = amount
    }
}

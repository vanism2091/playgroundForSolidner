//
//  Data.swift
//  BebeBoilerPlate
//
//  Created by sei on 10/25/23.
//

import Foundation


func date(year: Int, month: Int, day: Int = 1) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
}

struct AmountsData {
    /// A data series for the lines.
    struct Series: Identifiable {
        /// The type of the meal.
        let mealType: MealType

        /// Average daily sales for each weekday.
        /// The `weekday` property is a `Date` that represents a weekday.
        let intakes: [(day: Date, amount: Int)]

        /// The identifier for the series.
        var id: MealType { mealType }
    }

    static let last30Days: [Series] = [
        .init(mealType: .수유, intakes: [
            (day: date(year: 2023, month: 10, day: 1), amount: 350),
            (day: date(year: 2023, month: 10, day: 2), amount: 370),
            (day: date(year: 2023, month: 10, day: 3), amount: 390),
            (day: date(year: 2023, month: 10, day: 4), amount: 400),
            (day: date(year: 2023, month: 10, day: 5), amount: 410),
            (day: date(year: 2023, month: 10, day: 6), amount: 420),
            (day: date(year: 2023, month: 10, day: 7), amount: 450),
            (day: date(year: 2023, month: 10, day: 8), amount: 450),
            (day: date(year: 2023, month: 10, day: 9), amount: 500),
            (day: date(year: 2023, month: 10, day: 10), amount: 400),
            (day: date(year: 2023, month: 10, day: 11), amount: 350),
            (day: date(year: 2023, month: 10, day: 12), amount: 370),
            (day: date(year: 2023, month: 10, day: 13), amount: 390),
            (day: date(year: 2023, month: 10, day: 14), amount: 400),
            (day: date(year: 2023, month: 10, day: 15), amount: 410),
            (day: date(year: 2023, month: 10, day: 16), amount: 420),
            (day: date(year: 2023, month: 10, day: 17), amount: 450),
            (day: date(year: 2023, month: 10, day: 18), amount: 500),
        ]),
        .init(mealType: .이유식, intakes: [
            (day: date(year: 2023, month: 10, day: 10), amount: 50),
            (day: date(year: 2023, month: 10, day: 11), amount: 45),
            (day: date(year: 2023, month: 10, day: 12), amount: 55),
            (day: date(year: 2023, month: 10, day: 14), amount: 60),
            (day: date(year: 2023, month: 10, day: 15), amount: 45),
            (day: date(year: 2023, month: 10, day: 18), amount: 55),
        ])
    ]
}

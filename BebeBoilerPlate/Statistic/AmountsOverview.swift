//
//  AmountsOverview.swift
//  BebeBoilerPlate
//
//  Created by sei on 10/24/23.
//

import Charts
import SwiftUI
import SwiftData


//struct DailySalesChart: View {
//    @Binding var scrollPosition: Date
//
//    var body: some View {
//        Chart {
//            ForEach(SalesData.last365Days, id: \.day) {
//                BarMark(
//                    x: .value("Day", $0.day, unit: .day),
//                    y: .value("Sales", $0.sales)
//                )
//            }
//            .foregroundStyle(.blue)
//        }
//        .chartScrollableAxes(.horizontal)
//        .chartXVisibleDomain(length: 3600 * 24 * 30)
//        .chartScrollTargetBehavior(
//            .valueAligned(
//                matching: .init(hour: 0),
//                majorAlignment: .matching(.init(day: 1))))
//        .chartScrollPosition(x: $scrollPosition)
//
//        .chartXAxis {
//            AxisMarks(values: .stride(by: .day, count: 7)) {
//                AxisTick()
//                AxisGridLine()
//                AxisValueLabel(format: .dateTime.month().day())
//            }
//        }
//    }
//}


struct AmountsOverviewChart: View {
//    @Query private var mealLogs: [MealLog]
    @Binding var scrollPosition: Date
    var aNumberOfDays: Int = 7

    var body: some View {
        Chart {
            ForEach(AmountsData.last30Days) { series in
                ForEach(series.intakes, id: \.day) { element in
                    LineMark(
                        x: .value("Day", element.day, unit: .day),
                        y: .value("Sales", element.amount)
                    )
                }
                .foregroundStyle(by: .value("Meal Type", series.mealType.description))
//                .foregroundStyle(by: .value("Meal Type", series.mealType))
                .symbol(by: .value("Meal Type", series.mealType.description))
            }
        }
        .chartScrollableAxes(.horizontal)
        .chartXVisibleDomain(length: 3600 * 24 * aNumberOfDays)
    }
}

fileprivate extension MealLog {
    var dictKey: PairDictKey {
        PairDictKey(date: timestamp.start, type: mealType)
    }

    struct PairDictKey: Hashable {
        var date: Date
        var type: MealType
    }
}

struct AmountsOverview: View {
    @State var scrollPositionStart =
    AmountsData.last30Days[0].intakes.last!.day.addingTimeInterval(-1 * 3600 * 24 * 7)

    var body: some View {
        AmountsOverviewChart(scrollPosition: $scrollPositionStart, aNumberOfDays: 7)
    }
}

#Preview {
    AmountsOverview()
}

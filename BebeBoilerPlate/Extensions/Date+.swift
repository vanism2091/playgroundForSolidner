//
//  Date+.swift
//  BebeBoilerPlate
//
//  Created by sei on 10/24/23.
//

import Foundation

extension Date {

    var year: Int {
        return Calendar.current.component(.year, from: self)
    }

    var month: Int {
        return Calendar.current.component(.month, from: self)
    }

    var day: Int {
        return Calendar.current.component(.day, from: self)
    }

    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }

    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }

    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }

    var dateOnlyString: String {
        "\(month)월 \(day)일 \(Weekday(rawValue: weekday)!.string())요일"
    } // String(format: "%2d", month)

    var fullString: String {
//        "\(year)년 \(String(format: "%02d", month))월 \(String(format: "%02d", day))일"
        "\(year)년 \(month)월 \(day)일"
    }

    var numberOnlyString: String {
        "\(year)\(String(format: "%02d", month))\(String(format: "%02d", day))"
    }

    var start: Date {
        Calendar.current.startOfDay(for: self)
    }

    var end: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: start)!
    }
}

// MARK: - static method

extension Date {

    static func - (lhs: Date, rhs: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -rhs, to: lhs)!
    }

    func isSame(with another: Date, types: Calendar.Component...) -> Bool {
        types.allSatisfy { type in
            isSame(with: another, type: type)
        }
    }

    func isSame(with another: Date, type: Calendar.Component) -> Bool {
        switch type {
        case .day:
            self.day == another.day
        case .year:
            self.year == another.year
        case .month:
            self.month == another.month
        case .hour:
            self.hour == another.hour
        case .minute:
            self.minute == another.minute
        default:
            false
        }
    }
}

enum Weekday: Int {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7

    func string() -> String {
        switch self {
        case .sunday:
            return "일"
        case .monday:
            return "월"
        case .tuesday:
            return "화"
        case .wednesday:
            return "수"
        case .thursday:
            return "목"
        case .friday:
            return "금"
        case .saturday:
            return "토"
        }
    }
}

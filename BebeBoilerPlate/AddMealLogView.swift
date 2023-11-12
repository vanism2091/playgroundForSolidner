//
//  AddMealLogView.swift
//  BebeBoilerPlate
//
//  Created by sei on 10/23/23.
//

import SwiftUI

struct AddMealLogView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var meal: MealLog = MealLog()

    var body: some View {
        VStack {
            List {
                datePicker
                mealTypePicker
                mealAmountPicker
            }
            Button {
                addMealLog()
                dismiss()
            } label: {
                Text("추가하기")
            }
        }
    }

    var datePicker: some View {
        DatePicker("먹은 날",
                   selection: $meal.timestamp,
                   displayedComponents: [.date, .hourAndMinute]
        )
    }

    var mealTypePicker: some View {
        HStack {
            Text("종류")
            Spacer()
                .frame(minWidth: 10)
            Picker("종류",
                   selection: $meal.mealType) {
                ForEach(MealType.allCases, id:\.self) {
                    Text($0.description)
                }
            }
                   .pickerStyle(.segmented)
        }
    }

    var mealAmountPicker: some View {
        HStack {
            Stepper("섭취 양: \(meal.amount) ml",
                    value: $meal.amount,
                    in: 0...300,
                    step: 5)
        }
    }

    func addMealLog() {
        modelContext.insert(meal)
    }
}

#Preview {
    AddMealLogView()
}

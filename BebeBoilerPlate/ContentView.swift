//
//  ContentView.swift
//  BebeBoilerPlate
//
//  Created by sei on 10/23/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var mealLogs: [MealLog]
    @State var isAddMealLogPresented = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(mealLogs) { meal in
                    NavigationLink {
                        Text("Meal Log at \(meal.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                    } label: {
                        MealView(meal: meal)
                    }
                }
                .onDelete(perform: deleteMealLogs)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button{
                        isAddMealLogPresented = true
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddMealLogPresented, content: {
                AddMealLogView()
            })
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteMealLogs(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(mealLogs[index])
            }
        }
    }
}

struct MealView: View {
    var meal: MealLog

    var body: some View {
        HStack {
            Text("\(meal.timestamp)")
            VStack {
                Text(meal.mealType.description)
                Text("\(meal.amount) ml")
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

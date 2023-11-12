//
//  StatisticView.swift
//  BebeBoilerPlate
//
//  Created by sei on 10/23/23.
//

import SwiftUI

struct StatisticView: View {
    private enum Destinations {
        case empty
        case amounts
    }

    @State private var selection: Destinations?

    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                Section {
                    NavigationLink(value: Destinations.amounts) {
                        AmountsOverview()
                    }
                }
            }
        } detail: {
            NavigationStack {
            }
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    StatisticView()
}

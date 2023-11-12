//
//  MainView.swift
//  BebeBoilerPlate
//
//  Created by sei on 10/23/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .badge(2)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
            DailyScheduleView()
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }
            StatisticView()
                .badge("lolbdfs")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
            AmountsOverview()
                .badge("haha")
                .tabItem {
                    Label("Amounts", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

#Preview {
    MainView()
}

//
//  AppView.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/23/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            HomeView()
            .tabItem{
                Image(systemName: "stopwatch")
                Text("Home")
            }
            
            MedicationsView()
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("Meds")
            }
            
            PatientsView()
                        .tabItem{
                            Image(systemName: "person.3")
                            Text("Patients")
                    }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let appData = AppData()

    static var previews: some View {
        AppView().environmentObject(appData)
    }
}

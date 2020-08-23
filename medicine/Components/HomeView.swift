//
//  HomeView.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/12/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var appData : AppData
    
    var body: some View {
        VStack {
            NavigationView{
                List{
                    Section(header: Text("Patients").font(.headline)){
                        if !self.appData.patients.isEmpty{
                            ForEach(self.appData.patients) { item in
                                NavigationLink(destination: PatientDetailsView(patient: item)){
                                    Text(item.name)
                                }
                            }
                        }
                        NavigationLink(destination: AddPatientView()){
                            Text("Add New Patient").bold().foregroundColor(.green)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }.navigationBarTitle("Home")
                    .listStyle(GroupedListStyle())
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        HomeView().environmentObject(appData)
    }
}

//
//  PatientsView.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/23/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct PatientsView: View {
    @EnvironmentObject var appData : AppData

    var body: some View {
        VStack {
            NavigationView{
                List{
                    if !self.appData.patients.isEmpty{
                        ForEach(self.appData.patients) { item in
                            NavigationLink(destination: PatientDetailsView(patient: item)){
                                Text(item.name)
                            }
                        }
                    }
                    Section{
                        NavigationLink(destination: AddPatientView()){
                            Text("Add New Medicine").bold().foregroundColor(.purple)
                        }
                    }
                }.navigationBarTitle("Patients")
                    .navigationBarItems(trailing: NavigationLink(destination: AddPatientView(), label: {
                        Image(systemName: "person.crop.circle.fill.badge.plus")
                            .accentColor(.purple)
                    }))
                    .listStyle(GroupedListStyle())

                
            }
        }
    }
}

struct PatientsView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        PatientsView().environmentObject(appData)
    }
}

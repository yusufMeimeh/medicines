//
//  Medications.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/23/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct MedicationsView: View {
    @EnvironmentObject var appData : AppData
    var body: some View {
        VStack {
            NavigationView{
                List{
                    if !self.appData.medicines.isEmpty{
                        ForEach(self.appData.medicines) { item in
                            NavigationLink(destination: MedicineDetailsView(medicine: item)){
                                Text(item.name)
                            }
                        }
                    }
                    Section{
                        NavigationLink(destination: AddMedicine()){
                            Text("Add New Medicine").bold().foregroundColor(.purple)
                        }
                    }
                }.navigationBarTitle("Medications")
                    .navigationBarItems(trailing: NavigationLink(destination: AddMedicine(), label: {
                        Image(systemName: "plus")
                            .accentColor(.purple)
                    }))
                    .listStyle(GroupedListStyle())

                
            }
        }
    }

}

struct MedicationsView_Previews: PreviewProvider {
    static let appData = AppData()
    
    static var previews: some View {
        MedicationsView().environmentObject(appData)
    }
}

//
//  MedicineDetailsView.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/12/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct MedicineDetailsView: View {
    @EnvironmentObject var appData : AppData
    
    var medicine : Medicine
    var body: some View {
        List{
            Section(header:Text("Medicine Ifno")){
                HStack(alignment : .top){
                    Text("Name:").bold()
                    Text(medicine.name)
                }
                HStack(alignment : .top){
                    Text("Description:").bold()
                    Text(medicine.description)
                }
            }
            
            Section(header:Text("Purposes")){
                ForEach(medicine.purposes , id : \.self) { item in
                    Text(item)
                }
            }
            
        }.navigationBarTitle(Text("Details") , displayMode: .inline)
        
    }
}

struct MedicineDetailsView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        MedicineDetailsView(medicine: generateMedicineExample()).environmentObject(appData)
    }
}

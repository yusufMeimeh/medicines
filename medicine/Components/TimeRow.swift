//
//  TimeRow.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/17/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI


struct TimeRow: View {
    
    @ObservedObject var pm : PatientMedicinesTime
    var body: some View {
        VStack(alignment:.leading){
            
            DatePicker(selection: self.$pm.time, displayedComponents: .hourAndMinute ) {
                Text("Time")
                    .onAppear {
                        self.endEditing()
                }
                .onTapGesture{self.endEditing()}
            }
            Section(header : Text("How many?")){
                Stepper(value: self.$pm.count) {
                    Text("\(pm.count)")
                }
            }
            Divider()
        }
    }
}

struct TimeRow_Previews: PreviewProvider {
    static var previews: some View {
        TimeRow(pm: PatientMedicinesTime(time: Date(), count: 1))
    }
}

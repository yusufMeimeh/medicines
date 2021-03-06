//
//  DummyData.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/12/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI
import Fakery

let faker = Faker(locale: "nb-NO")

func generatePatients() -> [Patient]{
    var items = [Patient]()
    
    for _ in 1...5 {
        let item = Patient(id: UUID(), name: faker.name.name(), dob: faker.date.birthday(8, 100))
        items.append(item)
    }
    
    return items
}

func generateMedicines() -> [Medicine]{
    var items = [Medicine]()
    
    for _ in 1...15 {
        items.append(generateMedicineExample())
    }
    
    return items
}

#if DEBUG
let patientExample = gneratePatient()

func gneratePatient() -> Patient{
   return Patient(id: UUID(), name: faker.name.name(), dob: faker.date.birthday(8, 100))
}

func generateMedicineExample() -> Medicine{
    let random = faker.number.randomInt()
    var purposes = [String]()

    for _ in 1...random{
        purposes.append(faker.lorem.sentence())
    }
   return Medicine(id: UUID(), name: faker.commerce.productName(), purposes: purposes, description: faker.lorem.sentences())
}

func gneratePatientMedicine() -> PatientMedicines{
    return PatientMedicines(id: UUID(), patientID: UUID(), medicine: UUID(), doseForm: "Liquied", doseStrength: "22", expireDate: Date(), medicationMealPeriod: "After Meal", days: Day().items, Schedul: "EveryDay", times: Time().items)
    
}
#endif


struct DummyData_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

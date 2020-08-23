//
//  Patient.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/12/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct Patient: Codable , Identifiable , Equatable {
    var id: UUID
    var name: String
    var dob : Date?
    
}


class AppData : ObservableObject{
    @Published var patients = [Patient]()
    @Published var medicines = [Medicine]()
    @Published var patientMedicines = [PatientMedicines]()
    
    func addPatient(patient : Patient) {
        patients.append(patient)
    }
    
    func removePatient(patient : Patient) {
        if let index = patients.firstIndex(of: patient) {
            patients.remove(at: index)
        }
    }

    func addMedicine(item : Medicine) {
        medicines.append(item)
    }
    
    func removePatient(item : Medicine) {
        if let index = medicines.firstIndex(of: item) {
            medicines.remove(at: index)
        }
    }

    func addPatientMedicine(item : PatientMedicines) {
        patientMedicines.append(item)
    }
    
    func removePatientMedicine(item : PatientMedicines) {
        if let index = patientMedicines.firstIndex(of: item) {
            patientMedicines.remove(at: index)
        }
    }
}

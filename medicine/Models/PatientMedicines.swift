//
//  PatientMedicines.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/12/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI
import Combine

struct PatientMedicines: Codable, Equatable, Identifiable {
    var id: UUID
    var patientID: UUID
    var medicines: [UUID]
    var dosePeriod: [String]
    var times: Int
    var totalTablets: Int
}

class PatientMedicinesTime: Identifiable  , Equatable , ObservableObject{
    static func == (lhs: PatientMedicinesTime, rhs: PatientMedicinesTime) -> Bool {
        return lhs.id == rhs.id
    }
     var id: UUID = UUID()
    @Published  var time: Date
    @Published var count: Int
    
    init(time : Date , count : Int) {
        self.time = time
        self.count = count
    }
}

class Time  : ObservableObject{
    
    @Published var items = [PatientMedicinesTime]()

    func add(item: PatientMedicinesTime) {
        items.append(item)
    }

    func remove(item: PatientMedicinesTime) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}

//class SocialStore: ObservableObject {
//    @Published var socials : [Social]
//    var cancellables = [AnyCancellable]()
//
//    init(socials: [Social]){
//        self.socials = socials
//
//        self.socials.forEach({
//            let c = $0.objectWillChange.sink(receiveValue: { self.objectWillChange.send() })
//
//            // Important: You have to keep the returned value allocated,
//            // otherwise the sink subscription gets cancelled
//            self.cancellables.append(c)
//        })
//    }
//}
//
//class Social : ObservableObject{
//    var id: Int
//    var imageName: String
//    var companyName: String
//
//    @Published var pos: CGPoint
//
//    init(id: Int, imageName: String, companyName: String, pos: CGPoint) {
//        self.id = id
//        self.imageName = imageName
//        self.companyName = companyName
//        self.pos = pos
//    }
//
//    var dragGesture : some Gesture {
//        DragGesture()
//            .onChanged { value in
//                self.pos = value.location
//                print(self.pos)
//        }
//    }
//}
//
//struct ContentView : View {
//    @ObservedObject var socialObject: SocialStore = SocialStore(socials: [Social(id: 0, imageName: "", companyName: "", pos: .zero)])
//
//    var body: some View {
//        VStack {
//            ForEach(socialObject.socials, id: \.id) { social in
//                Image(social.imageName)
//                    .position(social.pos)
//                    .gesture(social.dragGesture)
//            }
//        }
//    }
//}
//

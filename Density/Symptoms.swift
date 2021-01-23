//
//  Symptoms.swift
//  Density
//
//  Created by Gareth Mansfield on 1/23/21.
//

import SwiftUI

struct CheckText: View {
    var text: String
    @State private var checked = false
    
    var tap: some Gesture {
            TapGesture(count: 1)
                .onEnded { _ in self.checked = !self.checked }
        }
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            if self.checked {
                Image(systemName: "checkmark.circle.fill")
            }
        }
    }
}

struct Symptoms: View {
    
    var symptoms = ["Fever", "Cough", "Loss of Smell/Taste"]
    
    @State private var active = false
    @State private var covidPositive = false
    
    var body: some View {
        HStack() {
            Spacer()
            VStack {
                Button(action: {
                    self.active = !self.active
                }) {
                    Text("Update Symptoms").fontWeight(.bold).padding()
                }
                if(self.active) {
                    Text("Since your last update, have you tested positive for COVID-19?")

                    Picker("Yes or No", selection: $covidPositive) {
                        Text("Yes").tag(true)
                        Text("No").tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Text("Are you experiencing any of the following syptoms?")
                    List(symptoms, id: \.self) { item in
                        CheckText(text: item)
                    }.frame(minHeight: 200)
                    
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .clipped()
        .cornerRadius(6)
        .shadow(color: Color(red: 0.8, green: 0.8, blue: 0.8), radius: 3)
        .frame(width: UIScreen.screenWidth * 0.9)
    }
}

struct Symptoms_Previews: PreviewProvider {
    static var previews: some View {
        Symptoms()
    }
}

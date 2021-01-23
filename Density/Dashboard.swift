//
//  File.swift
//  Density
//
//  Created by Gareth Mansfield on 1/23/21.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        ScrollView {
            //VStack {
                Symptoms()
                    .padding()
                Graph()
                    .padding()
            //}
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}

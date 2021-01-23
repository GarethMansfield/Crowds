//
//  Graph.swift
//  Density
//
//  Created by Gareth Mansfield on 1/23/21.
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct Graph: View {
    let data = [100, 120, 118, 125, 140, 152, 138, 139, 147, 155]
    @State var frame: CGSize = .zero
    
    func makeView(_ geometry: GeometryProxy) -> some View {
        print(geometry.size.width, geometry.size.height)

        DispatchQueue.main.async { self.frame = geometry.size }
        return ZStack {
            Rectangle().fill(Color.white)
            ForEach(0..<4) { mark in
              Rectangle()
                .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                .offset(x: CGFloat(mark) * geometry.size.width / 4 - UIScreen.screenWidth / 2)
                .frame(width: 1.0)
              Rectangle()
                .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                .offset(y: CGFloat(mark) * geometry.size.width / 4 - geometry.size.width / 2)
                  .frame(height: 1.0)
            }
            Path { path in
                path.move(to: CGPoint(x: 0, y: 200))
                for index in 0 ..< data.count {
                    path.addLine(to: CGPoint(x: ((index * 30) + 40), y: 400 - 2 * data[index]))
                }
            }.stroke(Color.green, lineWidth: 1.5)
        }
        .clipped()
        .cornerRadius(6)
        .shadow(color: Color(red: 0.8, green: 0.8, blue: 0.8), radius: 3)
        .frame(height: geometry.size.width)
    }
    
    var body: some View {
        GeometryReader { (geometry) in
                        self.makeView(geometry)
                    }
    }
}

struct Graph_Previews: PreviewProvider {
    static var previews: some View {
        Graph()
    }
}

//
//  ContentView.swift
//  Density
//
//  Created by Gareth Mansfield on 1/23/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    let minDragTranslationForSwipe: CGFloat = 50
    let numTabs = 2
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Dashboard()
                .tabItem {
                    Image(systemName: "waveform.path.ecg")
                    Text("Dashboard")
                }.tag(0)
                .highPriorityGesture(DragGesture().onEnded({ self.handleSwipe(translation: $0.translation.width)}))
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Heatmap")
                }.tag(1)
                .highPriorityGesture(DragGesture().onEnded({ self.handleSwipe(translation: $0.translation.width)}))
        }
        .font(.headline)
    }
    
    private func handleSwipe(translation: CGFloat) {
        if translation > minDragTranslationForSwipe && selectedTab > 0 {
            selectedTab -= 1
        } else  if translation < -minDragTranslationForSwipe && selectedTab < numTabs-1 {
            selectedTab += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

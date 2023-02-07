//
//  CustomTabBar.swift
//  CustomAnimatedTabBar
//
//  Created by A Farhan Agustiansyah on 07/02/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case message
    case person
    case leaf
    case gearshape
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                HStack {
                    
                }
                .frame(width: nil, height: 60)
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}

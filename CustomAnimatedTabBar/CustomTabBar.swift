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
    
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .blue
        case .message:
            return .pink
        case .person:
            if #available(iOS 15.0, *) {
                return .indigo
            } else {
                return .gray
            }
        case .leaf:
            return .green
        case .gearshape:
            return .orange
        }
    }
    
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                HStack {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        Spacer()
                        Image(systemName: selectedTab == tab ? fillImage :
                                tab.rawValue)
                            .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                            .foregroundColor(selectedTab == tab ? tabColor : .gray)
                            .font(.system(size: 22))
                            .onTapGesture {
                                withAnimation(.easeIn(duration:
                                                        0.1)) {
                                    selectedTab = tab
                                }
                            }
                        Spacer()
                    }
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

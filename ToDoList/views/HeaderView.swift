//
//  HeaderView.swift
//  ToDoList
//
//  Created by Randy on 24/04/24.
//

import SwiftUI

struct HeaderView: View {
    let colorR: Double
    let colorG: Double
    let colorB: Double
    let title: String
    let subtitle: String
    let angle: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color(
                    red: colorR / 255.0,
                    green: colorG / 255.0,
                    blue: colorB / 255.0
                ))
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color(
                        red: Double(AppConfig.FONT_TITLE_COLOR[0]) / 255.0,
                        green: Double(AppConfig.FONT_TITLE_COLOR[1]) / 255.0,
                        blue: Double(AppConfig.FONT_TITLE_COLOR[2]) / 255.0
                    ))
                    .fontWeight(.heavy)
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color(
                        red: Double(AppConfig.FONT_TITLE_COLOR[0]) / 255.0,
                        green: Double(AppConfig.FONT_TITLE_COLOR[1]) / 255.0,
                        blue: Double(AppConfig.FONT_TITLE_COLOR[2]) / 255.0
                    ))
                    .fontWeight(.bold)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height:350)
        .offset(y: -150)
        
        Spacer()
    }
}

#Preview {
    HeaderView(colorR: Double(AppConfig.BASE_BACKGROUND[0]),
               colorG: Double(AppConfig.BASE_BACKGROUND[1]),
               colorB: Double(AppConfig.BASE_BACKGROUND[2]),
               title: "title",
               subtitle: "subtitle",
               angle: 15)
}

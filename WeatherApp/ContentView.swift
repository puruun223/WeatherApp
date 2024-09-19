//
//  ContentView.swift
//  WeatherApp
//
//  Created by PB on 2024/09/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, Color("specialBlue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Brussels, BE")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 8) {
                    Image(systemName: "sun.rain.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("20°C")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Din",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 18)
                    WeatherDayView(dayOfWeek: "Woe", 
                                   imageName: "cloud.rain.fill",
                                   temperature: 16)
                    WeatherDayView(dayOfWeek: "Don", 
                                   imageName: "sun.max.fill",
                                   temperature: 25)
                    WeatherDayView(dayOfWeek: "Vri", 
                                   imageName: "wind",
                                   temperature: 10)
                    WeatherDayView(dayOfWeek: "Zat", 
                                   imageName: "cloud.snow.fill",
                                   temperature: -5)
                }
                
                Spacer()
                Button {
                    
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
            
        }
    }
}

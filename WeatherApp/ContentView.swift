//
//  ContentView.swift
//  WeatherApp
//
//  Created by PB on 2024/09/19.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Brussels, BE")
                WeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                  temperature: 20)
                
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
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
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

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("specialBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}



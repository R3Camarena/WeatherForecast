//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Ricardo Camarena on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Weekly Forecast")
            .font(.title)
            .fontWeight(.bold)
        ScrollView(.horizontal) {
            HStack(spacing: 15) {
                DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
                DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                DayForecast(day: "Wed", isRainy: true, high: 60, low: 45)
                DayForecast(day: "Thu", isRainy: false, high: 75, low: 60)
                DayForecast(day: "Fri", isRainy: true, high: 60, low: 40)
                DayForecast(day: "Sat", isRainy: false, high: 60, low: 40)
                DayForecast(day: "Sun", isRainy: false, high: 60, low: 40)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .shadow(radius: 12, x: 8, y: 5)
                .frame(width: 200, height: 200)
            VStack {
                Text(day)
                    .font(.title)
                Image(systemName: iconName)
                    .foregroundColor(iconColor)
                    .font(.largeTitle)
                    .padding(5)
                Text("High: \(high)º")
                    .fontWeight(.semibold)
                Text("Low: \(low)º")
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
    }
}

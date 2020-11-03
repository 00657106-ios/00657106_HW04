//
//  ContentView.swift
//  00657106_HW04
//
//  Created by User06 on 2020/10/28.
//

import SwiftUI

struct ContentView: View {
    @State private var bgColor = Color.blue
    @State private var showAlert = false
    @State private var isRain = true
    @State private var brightnessAmount: Double = 0
    @State private var showSecondPage = false
    @State private var selectDate = Date()
    @State private var trueAmount = 0
    let today = Date()
    let startDate = Calendar.current.date(byAdding: .year, value: -100, to: Date())!
    var year: Int {
        Calendar.current.component(.year, from: selectDate)
    }
    
    
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                VStack {
                    TenYearImage(width: geometry.size.width, selectDate: selectDate, brightnessAmount: brightnessAmount)
                    
                    Form {
                        BrightnessSlider(brightnessAmount: $brightnessAmount)
                        DatePicker("時間", selection: $selectDate, in: startDate...today, displayedComponents: .date)
                        Button("植物生長日記") {
                            showSecondPage = true
                        }
                        .sheet(isPresented: $showSecondPage) {
                            SecondView()
                        }
                        
                        VStack {
                            Image(systemName: isRain ? "cloud.rain.fill" : "sun.max.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text(isRain ? "你猜今天是雨天" : "你猜今天是晴天")
                            Toggle("你猜天氣是哪種?", isOn: $isRain)
                        }
                        Button(action: {
                            showAlert = true
                        }
                        )
                        {
                            VStack {
                                Text("看答案")
                            }
                        }.alert(isPresented: $showAlert) { () -> Alert in
                            let answer = ["其實今天下雨唷", "其實今天晴天唷"].randomElement()!
                            return Alert(title: Text(answer))
                            
                        }
                        Stepper(value: $trueAmount, in: 0...100,step:1)
                        {
                            Text("猜對\(trueAmount) 次")
                        }
                        
                    }
                    
                }.background(bgColor)
                ColorPicker("", selection: $bgColor)
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BrightnessSlider: View {
    @Binding var brightnessAmount: Double
    
    var body: some View {
        HStack {
            Text("亮度")
            Slider(value: $brightnessAmount, in: 0...1, minimumValueLabel: Image(systemName: "sun.max.fill").imageScale(.small), maximumValueLabel: Image(systemName: "sun.max.fill").imageScale(.large)) {
                Text("")
            }
        }
    }
}

struct TenYearImage: View {
    
    let width: CGFloat
    let selectDate: Date
    let brightnessAmount: Double
    var year: Int {
        return Calendar.current.component(.year, from: selectDate)
    }
    
    var body: some View {
        Image("weather")
            .resizable()
            .scaledToFill()
            .frame(width: width, height: width / 4 * 3)
            .clipped()
            .brightness(brightnessAmount)
    }
}

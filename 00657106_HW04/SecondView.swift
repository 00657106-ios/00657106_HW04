//
//  SecondView.swift
//  00657106_HW04
//
//  Created by User06 on 2020/11/3.
import SwiftUI

struct SecondView: View {
    
    @State private var isPresented = false
    @State private var vegetable = ""
    var day = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40",""]
    let vegetable_description = ["菠菜", "Spinach", "秋冬季臺灣全島各地均有栽培。現在有很多溫室培養的菠菜，各地超市全年都可買到新鮮的菠菜", "1. 食用：菠菜是秋冬季蔬菜，全株可以食用，適炒食、煮湯；菠菜是一道家常菜，經常用來煮湯，涼拌，單炒，和配葷菜合炒或墊盤用。", "2. 食療用：菠菜含有豐富的維他命Ａ、維他命Ｃ及礦物質，尤其維他命Ａ、維他命Ｃ含量是所有蔬菜類之冠，人體造血物質鐵的含量也比其它蔬菜為多，對於胃腸障礙、便秘、痛風、皮膚病、各種神經疾病、貧血確有特殊食療效果。對解酒毒及防止齒槽膿漏現象亦具有食療神效。", "3.藥用：性味：帶根全草：甘、涼；果實：微辛、甜、微溫。效用：帶根全草：滋陰平肝，止咳，潤腸。治頭痛，目眩，風火赤眼，消渴，便秘；果實：袪風明目，通關開竅，利胃腸，養血，止血，潤燥。治壞血病，消渴，便秘。"]
    @State private var selectedIndex = 0
    var body: some View {
        NavigationView{
            VStack {
                Form {
                    Picker(selection: $selectedIndex, label: Text("選擇天數")) {
                        Group{
                        Text(day[0]).tag(0)
                        Text(day[1]).tag(1)
                        Text(day[2]).tag(2)
                        Text(day[3]).tag(3)
                        Text(day[4]).tag(4)
                        Text(day[5]).tag(5)
                        Text(day[6]).tag(6)
                        Text(day[7]).tag(7)
                        Text(day[8]).tag(8)
                        Text(day[9]).tag(9)
                        }
                        Group{
                        Text(day[10]).tag(10)
                        Text(day[11]).tag(11)
                        Text(day[12]).tag(12)
                        Text(day[13]).tag(13)
                        Text(day[14]).tag(14)
                        Text(day[15]).tag(15)
                        Text(day[16]).tag(16)
                        Text(day[17]).tag(17)
                        Text(day[18]).tag(18)
                        Text(day[19]).tag(19)
                        }
                        Group{
                        Text(day[20]).tag(20)
                        Text(day[21]).tag(21)
                        Text(day[22]).tag(22)
                        Text(day[23]).tag(23)
                        Text(day[24]).tag(24)
                        Text(day[25]).tag(25)
                        Text(day[26]).tag(26)
                        Text(day[27]).tag(27)
                        Text(day[28]).tag(28)
                        Text(day[29]).tag(29)
                        }
                        Group{
                        Text(day[30]).tag(30)
                        Text(day[31]).tag(31)
                        Text(day[32]).tag(32)
                        Text(day[33]).tag(33)
                        Text(day[34]).tag(34)
                        Text(day[35]).tag(35)
                        Text(day[36]).tag(36)
                        Text(day[37]).tag(37)
                        Text(day[38]).tag(38)
                        Text(day[39]).tag(39)
                        }
                    }
                    
                    DisclosureGroup("畫面上の植物") {
                                VStack(alignment: .leading) {
                                    ForEach(vegetable_description.indices) { (index) in
                                        Text(vegetable_description[index])
                                        
                                    }
                                   
                                }
                            }
                    TextField("請猜蔬菜名稱", text: $vegetable)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.asciiCapable)
                           .padding()
                    
                    Image("day\(day[selectedIndex])")
                        .resizable()
                        .frame(width:333 , height: 224)
                        .scaledToFill()
                        .clipped()
                    Button("答案") {
                                self.isPresented.toggle()
                            }
                            .fullScreenCover(isPresented: $isPresented, content: ThirdView.init)
                           
                }
                
            }
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
     }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}


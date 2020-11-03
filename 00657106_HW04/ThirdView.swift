//
//  FullScreenModeView.swift
//  00657106_HW04
//
//  Created by User06 on 2020/11/3.
//

import SwiftUI

struct ThirdView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("菠菜").font(Font.system(size:30, design: .default))
            ExtractedView()
                }
                .frame(maxWidth: 500, maxHeight: 300)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

struct ExtractedView: View {
    var body: some View {
        Image("菠菜")
            .resizable()
            .scaledToFill()
            .clipped()
    }
}

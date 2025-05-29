//
//  KahveSatir.swift
//  KahveMenu
//
//  Created by Halil Keremoğlu on 23.05.2025.
//

import SwiftUI

struct KahveItem: View {
    var kahve = Kahveler()
    var genislik = 0.0
    var body: some View {
        VStack(spacing: 5){
            Image(kahve.kahve_resim!).resizable().frame(width: genislik)
            Text(kahve.kahve_ad!).foregroundColor(.gray)
            Text("Sipariş Et")
                .padding(5)
                .foregroundColor(.white)
                .background(.indigo)
                .cornerRadius(5)
                .padding(.bottom,5)
                .onTapGesture {
                    print("\(kahve.kahve_ad!) sipariş edildi")
                }
        }.background(Rectangle().fill(.white).shadow(radius: 3))
    }
}
/*#Preview {
    KahveSatir()
}*/

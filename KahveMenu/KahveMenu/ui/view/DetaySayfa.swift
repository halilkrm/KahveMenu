//
//  DetaySayfa.swift
//  KahveMenu
//
//  Created by Halil Keremoğlu on 23.05.2025.
//

import SwiftUI

struct DetaySayfa: View {
    
        var kahve = Kahveler()
        
        var body: some View {
            VStack(spacing: 50){
                Image(kahve.kahve_resim!)
                
                Text(kahve.kahve_ad!).font(.system(size: 30))
                
                Text("\(kahve.kahve_fiyat!)₺").font(.system(size: 50)).foregroundColor(.blue)
                
                Button("Sipariş Et"){
                    print("Detay Sayfa : \(kahve.kahve_ad!) sipariş edildi")
                }
                .foregroundColor(.white)
                .frame(width: 250,height: 50)
                .background(.indigo)
                .cornerRadius(10)
            }.navigationTitle(kahve.kahve_ad!)
        }
    }
    
    /*#Preview {
     DetaySayfa()
     }*/


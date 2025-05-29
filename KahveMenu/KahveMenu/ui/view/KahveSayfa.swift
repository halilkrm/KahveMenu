//
//  KahveSayfa.swift
//  KahveMenu
//
//  Created by Halil Keremoğlu on 23.05.2025.
//

import SwiftUI

struct KahveSayfa: View {
        @ObservedObject var viewModel = KahveSayfaViewModel()
        
        var kategori = Kategoriler()
        
        var body: some View {
            
            GeometryReader{ geometry in
                let ekranGenislik = geometry.size.width
                let itemGenislik = (ekranGenislik-40)/2
                //10 X 20 X 10 = 40
                ScrollView{
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 20){
                        ForEach(viewModel.kahvelerListesi){ kahve in
                            NavigationLink(destination: DetaySayfa(kahve:kahve)){
                                KahveItem(kahve:kahve ,genislik: itemGenislik)
                            }
                            
                        }
                    }
                }.padding(10)
                    .navigationTitle(kategori.kategori_ad!)
                    .onAppear{
                        viewModel.kahveleriYukle(kategori_id: kategori.kategori_id!)
                    }
            }
            
        }
    }
    
    /*#Preview {
     KahveSayfa()
     }*/

 

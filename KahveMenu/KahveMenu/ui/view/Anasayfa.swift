//
//  ContentView.swift
//  KahveMenu
//
//  Created by Halil Keremoğlu on 23.05.2025.
//

import SwiftUI

struct Anasayfa: View {
    @ObservedObject var viewModel = AnaSayfaViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.kategorilerListesi){ kategori in
                    NavigationLink(destination: KahveSayfa(kategori:kategori)){
                        KategoriItem(kategori:kategori)
                    }
                    
                }
            }.navigationTitle("Kategoriler")
                .onAppear(){
                    veritabaniKopyala()
                    viewModel.kategorileriYukle()
                }
        }
        
        
    }
    
    func veritabaniKopyala(){
        let bundle = Bundle.main.path(forResource: "kahveler", ofType: ".sqlite")
        
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("kahveler.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: hedefYol.path){
            print("Veritabanı daha önce kopyalandı.")
        }else{
            do{
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
}
    
    
    #Preview {
        Anasayfa()
    }


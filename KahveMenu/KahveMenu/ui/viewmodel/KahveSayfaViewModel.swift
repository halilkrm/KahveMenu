//
//  DetayViewModel.swift
//  KahveMenu
//
//  Created by Halil Keremoğlu on 23.05.2025.
//

import Foundation

class KahveSayfaViewModel: ObservableObject {
    @Published var kahvelerListesi = [Kahveler]()
    
    let db:FMDatabase?
    
    init(){
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("kahveler.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }
    
    func kahveleriYukle(kategori_id:Int){
        db?.open()
        
        var liste = [Kahveler]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM kategoriler,kahveler WHERE kahveler.kategori_id = kategoriler.kategori_id and kahveler.kategori_id = ?", values: [kategori_id])
            
            while result.next() {
                let kategori_id = Int(result.string(forColumn: "kategori_id"))!
                let kategori_ad = result.string(forColumn: "kategori_ad")!
                
                let kategori = Kategoriler(kategori_id: kategori_id, kategori_ad: kategori_ad)
              
                let kahve_id = Int(result.string(forColumn: "kahve_id"))!
                let kahve_ad = result.string(forColumn: "kahve_ad")!
                let kahve_fiyat = result.string(forColumn: "kahve_fiyat")!
                let kahve_resim = result.string(forColumn: "kahve_resim")!
                
                let kahve = Kahveler(kahve_id: kahve_id, kahve_ad: kahve_ad, kahve_fiyat: kahve_fiyat, kategori: kategori, kahve_resim: kahve_resim)
                
                liste.append(kahve)
            }
            
            kahvelerListesi = liste
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}

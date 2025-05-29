//
//  AnaSayfaViewModel.swift
//  KahveMenu
//
//  Created by Halil Keremoğlu on 23.05.2025.
//

import Foundation

class AnaSayfaViewModel: ObservableObject{
    @Published var kategorilerListesi = [Kategoriler]()
    
    let db:FMDatabase?
    
    
    init(){
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("kahveler.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }
    
    
    func kategorileriYukle(){
        db?.open()
        
        var liste = [Kategoriler]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM kategoriler", values: nil)
            
            while result.next(){
                let kategori_id = Int(result.string(forColumn: "kategori_id"))!
                let kategori_ad = result.string(forColumn: "kategori_ad")!
                
                let kategori = Kategoriler(kategori_id: kategori_id, kategori_ad: kategori_ad)
                liste.append(kategori)
            }
            
            kategorilerListesi = liste
            

        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()

    }
}

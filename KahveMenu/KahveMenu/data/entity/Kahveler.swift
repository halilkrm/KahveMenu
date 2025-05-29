//
//  Kahveler.swift
//  KahveMenu
//
//  Created by Halil Keremoğlu on 23.05.2025.
//

import Foundation

class Kahveler:Identifiable{
    var kahve_id:Int?
    var kahve_ad:String?
    var kahve_fiyat:String?
    var kategori:Kategoriler?
    var kahve_resim:String?

    
    
    init(){
        
        
    }
    init(kahve_id: Int, kahve_ad: String, kahve_fiyat: String,kategori:Kategoriler,kahve_resim:String) {
        self.kahve_id = kahve_id
        self.kahve_ad = kahve_ad
        self.kahve_fiyat = kahve_fiyat
        self.kategori = kategori
        self.kahve_resim = kahve_resim
    }
}

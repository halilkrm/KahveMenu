//
//  Kategoriler.swift
//  KahveMenu
//
//  Created by Halil Keremoğlu on 23.05.2025.
//

import Foundation

class Kategoriler : Identifiable {
    var kategori_id:Int?
    var kategori_ad:String?
    
    init(){
        
    }
    
    init(kategori_id: Int, kategori_ad: String) {
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}

//
//  KategoriItem.swift
//  KahveMenu
//
//  Created by Halil Keremoğlu on 23.05.2025.
//

import SwiftUI

struct KategoriItem: View {
    var kategori = Kategoriler()
    
    var body: some View {
        Text(kategori.kategori_ad!)
    }
}

/*#Preview {
    KategoriItem()
}*/

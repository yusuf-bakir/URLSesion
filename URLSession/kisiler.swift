//
//  kisiler.swift
//  URLSession
//
//  Created by yusuf bakır on 24.05.2023.
//

import Foundation
class kisiler :Codable{
    var kisi_id :String?
    var kisi_ad :String?
    var kisi_tel :String?
    init (){
        
    }
    init (kisi_id :String,kisi_ad :String,kisi_tel :String) {
        self.kisi_ad = kisi_ad
        self.kisi_id = kisi_id
        self.kisi_tel = kisi_tel
    }
    
    
    
    
    
    
    
}

//
//  ViewController.swift
//  URLSession
//
//  Created by yusuf bakır on 22.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
       
//           Personinsert()
//        personupdate()
//        personDelete()
        Allselcet()
//        search()
            }
    
    func Personinsert () {
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
        
        request.httpMethod = "POST"
        let postString = "kisi_ad=TESTad&kisi_tel=TESTtel"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            if error != nil || data == nil {
                print ("hata")
                return
                
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data! ,options: []) as? [String:Any] {
                    print (json)
                }
            
            }catch {
                print (error.localizedDescription)
            }
            
        }.resume()
        
        
    }
 func personDelete (){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_id=119"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            if error != nil ||  data == nil {
                print("hata")
            return
            }
            do{
                if let json = try JSONSerialization.jsonObject(with: data! ,options: []) as? [String:Any] {
                    print (json)
                }
            }catch{
                print(error.localizedDescription)
            }
                
                
            
        }.resume()
        
    }
    func personupdate (){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_id=119&kisi_ad=TEXTad&kisi_tel=TEXTtel"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            if error != nil ||  data == nil {
                print("hata")
            return
            }
            do{
                if let json = try JSONSerialization.jsonObject(with: data! ,options: []) as? [String:Any] {
                    print (json)
                }
            }catch{
                print(error.localizedDescription)
            }
                
                
            
        }.resume()
       
    }
    func Allselcet () {
        var request = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            if error != nil || data == nil {
                print("hata")
                return
            }
            do {
                let cevap = try JSONDecoder().decode(kisiCevap.self,from: data!)
                for kisi in cevap.kisiler! {
                    
                    print("kisi_id : \(kisi.kisi_id!)")
                    print("kisi_ad : \(kisi.kisi_ad!)")
                    print("kisi_tel : \(kisi.kisi_tel!)")
                    
                    
                    
                    
                    
                        
                }
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    func  search (){
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_ad=x"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            if error != nil || data == nil {
                print("hata")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data! ,options: []) as? [String:Any]
                print(json)
                
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }

}

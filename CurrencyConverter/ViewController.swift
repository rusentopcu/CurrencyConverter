//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Rusen Topcu on 25.02.2020.
//  Copyright © 2020 Rusen Topcu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     //MARK: - App url main adress: (https://fixer.io)
    
    //MARK: -Outlets
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }

    @IBAction func getRates(_ sender: Any) {
        
        //MARK: - Request & Session
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=ff2327436590b035d07e0eb9b3573b1d")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert,animated: true, completion: nil)
            }
            else {
                if data != nil {
                    //MARK: - Response & Data
                    
                    
                    do {
                        let jsonresponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        
                        DispatchQueue.main.async {
                            print(jsonresponse)
                        }
                    } catch {
                        print("error")
                    }
                    
                }
            }
            
        }
        task.resume()
    }
    
}


//
//  UserViewModel.swift
//  MvvmJson
//
//  Created by KULDEP KUMAR PRAJAPATI on 25/07/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit
import Alamofire

class UserViewModel {
    weak var vc: ViewController?
    var arrUser = [UserModel]()
    
    func getAllUserDataAF() {
        AF.request("https://jsonplaceholder.typicode.com/todos/")
            .response{ response in
                if let data = response.data{
                    do{
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        self.arrUser.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            self.vc?.tableView.reloadData()
                        }
                    }catch let error{
                        print(error.localizedDescription)
                    }
                }
           }
        
    }

    
    func getAllUserData() {
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { (data, response, error)
                in
                if error == nil{
                    if let data = data{
                        do{
                            let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                            self.arrUser.append(contentsOf: userResponse)
                            DispatchQueue.main.async {
                                self.vc?.tableView.reloadData()
                            }
                        
                        }catch let error{
                            print(error.localizedDescription)
                        }
                    }
                    
                }else{
                    print(error!.localizedDescription)
                }
                
        }.resume()
    }
}

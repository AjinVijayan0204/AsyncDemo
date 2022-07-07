//
//  ViewController.swift
//  ASyncTestCheck
//
//  Created by Ajin on 05/07/22.
//

import UIKit

enum AlbumsFetcherError: Error {
        case invalidURL
        case missingData
    }


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fetchData(_ sender: UIButton) {
        Task{
            do{
                let finalData = try await fetchjsonData()
                print(finalData![0])
            }catch{
                print("error occured")
            }
        }
    }
    
    func fetchjsonData() async throws -> [PostModel]?{
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else{
            throw AlbumsFetcherError.invalidURL
        }
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let parsedJson = try JSONDecoder().decode([PostModel].self, from: data)
        return parsedJson
    }
    
}


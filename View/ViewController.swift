//
//  ViewController.swift
//  Weather
//
//  Created by Артур Шестаков on 12.03.2023.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource {

    
let  urlString="https://api.unsplash.com/search/photos?page=3&per_page=50&query=office&client_id=Ryj6PQT3F86nbePGERH5GupY7bM6lA_ZjmLcHx7ieuE"
    
    private var collectionView:UICollectionView?
    
    var results=[Results]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout=UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self
                                , forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.dataSource = self
        view.addSubview(collectionView)
        self.collectionView = collectionView
fetchPhotos()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    func fetchPhotos(){
        
   guard let url=URL(string: urlString) else{ return }
   var request = URLRequest(url: url)
        let task=URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data,error == nil else { return }
            
            do{
                let result = try JSONDecoder().decode(ApiResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self?.results=result.results
                    self?.collectionView?.reloadData()
                }
                
            }catch{
                print(error)
            }
            
        }
        task.resume()
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let result=results[indexPath.row].urls.regular
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
        else {
           return UICollectionViewCell()
       }
        cell.backgroundColor = .blue
        cell.configure(with: result)
        return cell
    }
}

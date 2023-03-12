//
//  CollectionViewCell.swift
//  Weather
//
//  Created by Артур Шестаков on 12.03.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"
    
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(with url:String){
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else{
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self?.imageView.image = image
            }
        }
        task.resume()
    }
}

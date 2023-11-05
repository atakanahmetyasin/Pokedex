//
//  PokemonCell.swift
//  Poxedex
//
//  Created by Ebuzer Şimşek on 4.11.2023.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    
    let pokemonImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Pokemon")
        return image
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true // Ensures that the corners are rounded
        view.layer.shadowColor = UIColor.black.cgColor // Add shadow color if needed
        view.layer.shadowOffset = CGSize(width: 0, height: 2) // Add shadow offset if needed
        view.layer.shadowOpacity = 0.4 // Add shadow opacity if needed
        view.layer.shadowRadius = 4 // Add shadow radius if needed
        return view
    }()
    
    let PokemonNameLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Metropolis", size: 14)
        lab.font = UIFont.boldSystemFont(ofSize: 14)
        lab.textAlignment = .center
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    let idLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Metropolis", size: 14)
        lab.font = UIFont.boldSystemFont(ofSize: 14)
        lab.textAlignment = .center
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pokemonImage)
        addSubview(PokemonNameLabel)
        addSubview(backView)
        addSubview(idLabel)
        setupCell()
        
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            pokemonImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            pokemonImage.bottomAnchor.constraint(equalTo: PokemonNameLabel.topAnchor),
            pokemonImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 100),
            pokemonImage.heightAnchor.constraint(equalToConstant: 80),
            pokemonImage.widthAnchor.constraint(equalToConstant: 80),
            
            
            PokemonNameLabel.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 8),
            PokemonNameLabel.centerXAnchor.constraint(equalTo: pokemonImage.centerXAnchor),
            
            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            idLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor,constant: 100),
            
        ])
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupCell()
    }
    private func setupCell() {
        // Hücrenin görünümünü özelleştirin, border ve gölge ekleyin
        layer.cornerRadius = 10 // Köşeleri yuvarlamak için
        layer.borderWidth = 1 // Border genişliği
        layer.borderColor = UIColor.gray.cgColor // Border rengi
        layer.shadowColor = UIColor.black.cgColor // Gölge rengi
        layer.shadowOpacity = 0.5 // Gölge yoğunluğu
        layer.shadowOffset = CGSize(width: 0, height: 2) // Gölge konumu
        layer.shadowRadius = 4 // Gölge yarıçapı
        
        

        // Diğer hücre özelleştirmelerini burada yapabilirsiniz
    }
    
}

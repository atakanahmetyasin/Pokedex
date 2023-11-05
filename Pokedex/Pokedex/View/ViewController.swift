//
//  ViewController.swift
//  Poxedex
//
//  Created by chvck on 3.11.2023.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PokemonViewModelOutput {
    
    
    var name: [String] = []
    var images: [UIImage] = []
    
    func updateView(name: String, id: Int, weight: Float, height: Float, types: [String], abilities: [String], stats: [String : Int], image: String) {
        
        pokemons.append(Poke(name: name, id: id, weight: weight, height: height, types: types, abilities: abilities, stats: stats, image: image))
        self.name.append(name)
        print(self.name)
        print(types.first)
        
        DispatchQueue.main.async {
            self.filteredPokemons = self.pokemons
            self.PokemonCollectionView.reloadData()
        }
        
    }
    
    func updateViewDesc(desc: String) {
        for index in pokemons.indices {
            pokemons[index].desc = desc
            print(pokemons[index])
            
        }
    }
    let imageView = UIImageView()
    var pokemons = [Poke]()
    var filteredPokemons: [Poke] = []
    private let viewModel: PokemonViewModel
    var output: PokemonViewModelOutput?
    
    init(viewModel: PokemonViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    var PokemonCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = -10
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 100, height: 150)
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
        let collection = UICollectionView(frame:.zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    
    var backgroundView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    let imgPokeball: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let imgPokedex: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let sortButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("#", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20 // Yuvarlak olması için yüksekliğinin yarısı kadar köşe yuvarlama
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(showSortingOptions), for: .touchUpInside)
        
        
        return button
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundImage = UIImage() // Kenarlarında border olmaması için arka plan resmi ayarla
        searchBar.barTintColor = .red // Arka plan rengi
        searchBar.tintColor = .red // Arama ikonu rengi
        searchBar.searchTextField.backgroundColor = .white // Yazı yazma alanının rengi
        searchBar.searchTextField.leftView?.tintColor = .red
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray, // Kırmızı placeholder rengi
            .font: UIFont.systemFont(ofSize: 12.0) // İstenilen font
        ]
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: placeholderAttributes)
        
        
        searchBar.layer.cornerRadius = 17.0 // Kenarların yuvarlaklığını ayarla
        searchBar.layer.masksToBounds = true // Kenarların yuvarlaklığını etkinleştir
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .white // Yazı yazma alanının rengi
            textField.layer.cornerRadius = 17.0 // Yazı yazma alanının kenarlarını yuvarlak yap
            textField.layer.masksToBounds = true
        }
        
        
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        PokemonCollectionView.delegate = self
        PokemonCollectionView.dataSource = self
        PokemonCollectionView.register(PokemonCell.self, forCellWithReuseIdentifier: "cell")
        
        viewModel.output = self
        searchBar.delegate = self
        viewModel.fetchAll()
        
        view.addSubview(backgroundView)
        view.addSubview(PokemonCollectionView)
        view.addSubview(imgPokeball)
        view.addSubview(imgPokedex)
        view.addSubview(searchBar)
        view.addSubview(sortButton)
        
        
        
        
        // Elemanların konumlarını ve boyutlarını belirle
        NSLayoutConstraint.activate([
            
            
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.74),
            backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            
            
            
            imgPokeball.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 40),
            imgPokeball.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imgPokeball.widthAnchor.constraint(equalToConstant: 35), // İstediğin genişliği belirle
            imgPokeball.heightAnchor.constraint(equalToConstant: 35), // İstediğin yüksekliği belirle
            
            
            
            imgPokedex.leadingAnchor.constraint(equalTo: imgPokeball.trailingAnchor, constant: 20),
            imgPokedex.topAnchor.constraint(equalTo: imgPokeball.topAnchor),
            imgPokedex.widthAnchor.constraint(equalToConstant: 140), // İstediğin genişliği belirle
            imgPokedex.heightAnchor.constraint(equalTo: imgPokeball.heightAnchor),
            
            
            
            
            
            searchBar.topAnchor.constraint(equalTo: imgPokedex.topAnchor,constant: 50),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            
            
            
            
            sortButton.topAnchor.constraint(equalTo: imgPokedex.topAnchor,constant: 55),
            sortButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 8),
            sortButton.widthAnchor.constraint(equalToConstant: 40),
            sortButton.heightAnchor.constraint(equalToConstant: 40),
            
            
            
            PokemonCollectionView.heightAnchor.constraint(equalToConstant: 500),
            //            PokemonCollectionView.widthAnchor.constraint(equalToConstant: 300),
            PokemonCollectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            PokemonCollectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,constant: -20),
            PokemonCollectionView.topAnchor.constraint(equalTo: backgroundView.topAnchor,constant: 10),
            PokemonCollectionView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
            
        ])
        
        
        
        
        imgPokeball.image = UIImage(named: "pokeball 1") // "resminAdi" kısmını kendi resminin adıyla değiştir
        imgPokedex.image = UIImage(named: "pokedex")
        
        
        
    }
    
   
    @objc func showSortingOptions() {
        let alertController = UIAlertController(title: "Sort Options", message: "Please choose a sorting option", preferredStyle: .actionSheet)
        
        let sortByNameAction = UIAlertAction(title: "Sort by Name", style: .default) { _ in
            // Sorting the pokemons array by name
            self.pokemons.sort { $0.name < $1.name }
            // Update the filteredPokemons array as well if you're using it
            self.filteredPokemons.sort { $0.name < $1.name }
            // Reload the collection view to reflect the sorted data
            self.PokemonCollectionView.reloadData()
        }
        
        let sortByNumberAction = UIAlertAction(title: "Sort by Number", style: .default) { _ in
            // Sorting the pokemons array by ID
            self.pokemons.sort { $0.id < $1.id }
            // Update the filteredPokemons array as well if you're using it
            self.filteredPokemons.sort { $0.id < $1.id }
            // Reload the collection view to reflect the sorted data
            self.PokemonCollectionView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(sortByNameAction)
        alertController.addAction(sortByNumberAction)
        alertController.addAction(cancelAction)
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    func downloadImageWithKingfisher(from urlString: String, imageView: UIImageView) {
        if let url = URL(string: urlString) {
            imageView.kf.setImage(with: url)
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredPokemons.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PokemonCell
        cell.PokemonNameLabel.text = filteredPokemons[indexPath.item].name
        downloadImageWithKingfisher(from: filteredPokemons[indexPath.item].image, imageView: cell.pokemonImage)
        cell.idLabel.text = String("#\(filteredPokemons[indexPath.item].id)")
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Burada hücre boyutunu ayarlayabilirsiniz
        let cellWidth = collectionView.bounds.width / 3.2 // 3 hücre olacak şekilde böldük
        return CGSize(width: cellWidth, height: cellWidth) // Veya hücrelerin farklı yüksekliklere sahip olmasını istiyorsanız boyutu özelleştirebilirsiniz
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let secondViewController = SecondViewController()
        // Pass any necessary data to the second view controller
        secondViewController.pokemon = self.filteredPokemons[indexPath.item]
        // Present the second view controller
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    
    
    
    
}
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredPokemons = pokemons
        } else {
            filteredPokemons = pokemons.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        // Reload the collection view to display the filtered results
        DispatchQueue.main.async {
            self.PokemonCollectionView.reloadData()
        }
    }
}

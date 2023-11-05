//
//  SecondViewController.swift
//  Pokedex
//
//  Created by Ahmet Yasin Atakan on 3.11.2023.
//

import UIKit
import Kingfisher



class SecondViewController: UIViewController {
    

    
    var background : UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        
        return view
    }()

    var pokemonBackgroundImage : UIImageView = {
        var PokemonImage = UIImageView()
        PokemonImage.translatesAutoresizingMaskIntoConstraints = false
        PokemonImage.image = UIImage(named: "Pokeball")
        return PokemonImage
    }()
    var bulbasourImage : UIImageView = {
        var PokemonImage = UIImageView()
        PokemonImage.translatesAutoresizingMaskIntoConstraints = false
        return PokemonImage
    }()


    var skillsLabel : UILabel = {
        var skillsLabel = UILabel()
        skillsLabel.textAlignment = .center
        skillsLabel.layer.cornerRadius = 10
        skillsLabel.text = "Grass"
        skillsLabel.clipsToBounds = true
        skillsLabel.textColor = .white
        skillsLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        skillsLabel.backgroundColor = .systemGreen
        skillsLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        return skillsLabel
    }()

    var skillsLabel2 : UILabel = {
        var skillsLabel = UILabel()
        skillsLabel.textAlignment = .center
        skillsLabel.layer.cornerRadius = 10
        skillsLabel.text = "Poison"
        skillsLabel.clipsToBounds = true
        skillsLabel.textColor = .white
        skillsLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        skillsLabel.backgroundColor = .systemPurple
        skillsLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        return skillsLabel
    }()

    var aboutLabel : UILabel = {
        var aboutLabel = UILabel()
        aboutLabel.text = "About"
        aboutLabel.textAlignment = .center
        aboutLabel.textColor = .systemGreen
        aboutLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        return aboutLabel
    }()

    var weightImage : UIImageView = {
        var weightImage = UIImageView()
        weightImage.backgroundColor = .clear
        weightImage.image = UIImage(named: "WeightImage")
        weightImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        weightImage.translatesAutoresizingMaskIntoConstraints = false
        return weightImage
    }()
    var weightValueLabel : UILabel = {
        var weightValueLabel = UILabel()
        weightValueLabel.textColor = .black
        weightValueLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        weightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        return weightValueLabel
    }()

    var weightLabel : UILabel = {
        var weightLabel = UILabel()
        
        weightLabel.text = "Weight"
        weightLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        weightLabel.textColor = .black
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        return weightLabel
    }()
    var heightImage : UIImageView = {
        var heightImage = UIImageView()
        heightImage.backgroundColor = .clear
        heightImage.image = UIImage(named: "HeightIcon")
        heightImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        heightImage.translatesAutoresizingMaskIntoConstraints = false
        return heightImage
    }()
    var heightValueLabel : UILabel = {
        var heightValueLabel = UILabel()
        heightValueLabel.textColor = .black
        heightValueLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        heightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        return heightValueLabel
    }()

    var heightLabel : UILabel = {
        var heightLabel = UILabel()
        
        heightLabel.text = "Height"
        heightLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        heightLabel.textColor = .black
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        return heightLabel
    }()

    var specialMovesLabel : UILabel = {
        var specialMovesLabel = UILabel()
        specialMovesLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        specialMovesLabel.textColor = .black
        specialMovesLabel.translatesAutoresizingMaskIntoConstraints = false
        return specialMovesLabel
    }()

    var specialMovesLabel2 : UILabel = {
        var specialMovesLabel = UILabel()
        specialMovesLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        specialMovesLabel.textColor = .black
        specialMovesLabel.translatesAutoresizingMaskIntoConstraints = false
        return specialMovesLabel
    }()

    var movesLabel : UILabel = {
        var movesLabel = UILabel()
        movesLabel.text = "Moves"
        movesLabel.numberOfLines = 3
        movesLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        movesLabel.textColor = .black
        movesLabel.translatesAutoresizingMaskIntoConstraints = false
        return movesLabel
    }()

    var descriptionLabel : UILabel = {
        var descriptionLabel = UILabel()
        descriptionLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        descriptionLabel.numberOfLines = 3
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.lineBreakMode = .byWordWrapping
        //    descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        descriptionLabel.textColor = .black
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    var baseStatsLabel : UILabel = {
        var baseStatsLabel = UILabel()
        baseStatsLabel.text = "Base Stats"
        baseStatsLabel.textColor = .systemGreen
        baseStatsLabel.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        baseStatsLabel.translatesAutoresizingMaskIntoConstraints = false
        return baseStatsLabel
    }()

    var HPLabel : UILabel = {
        var label = UILabel()
        label.text = "HP"
        label.font = UIFont.systemFont(ofSize: 17,weight: .bold)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var ATKLabel : UILabel = {
        var label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 17,weight: .bold)
        label.text = "ATK"
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var DEFLabel : UILabel = {
        var label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 17,weight: .bold)
        label.text = "DEF"
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var SATKLabel : UILabel = {
        var label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 17,weight: .bold)
        label.text = "SATK"
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var SDEFLabel : UILabel = {
        var label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 17,weight: .bold)
        label.text = "SDEF"
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var SPDLabel : UILabel = {
        var label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 17,weight: .bold)
        label.text = "SPD"
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let nextButton : UIButton = {
        let nextButton = UIButton()
        nextButton.setImage(UIImage(named: "nextbuttn"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        return nextButton
    }()

    let backButton : UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "backbutton"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()
    
    
 
    
    @objc func nextButtonTapped(){
  
   
    }
    
    @objc func backButtonTapped(){
       
    }
    
    var maxValue : Float = 220.00
    var dataValueHP = Float()
    var dataValueATK = Float()
    var dataValueDEF = Float()
    var dataValueSATK = Float()
    var dataValueSDEF = Float()
    var dataValueSPD = Float()
    
    var progressViewHP = UIProgressView(progressViewStyle: .bar)
    var progressViewATK = UIProgressView(progressViewStyle: .bar)
    var progressViewDEF = UIProgressView(progressViewStyle: .bar)
    var progressViewSATK = UIProgressView(progressViewStyle: .bar)
    var progressViewSDEF = UIProgressView(progressViewStyle: .bar)
    var progressViewSPD  = UIProgressView(progressViewStyle: .bar)
    
    var progressViewHPLabel = UILabel()
    var progressViewATKLabel = UILabel()
    var progressViewDEFLabel = UILabel()
    var progressViewSATKLabel = UILabel()
    var progressViewSDEFLabel = UILabel()
    var progressViewSPDLabel = UILabel()
    
    var pokemon = Poke(name: "", id: 0, weight: 0, height: 0, types: ["String"], abilities: ["String"], stats: ["asd" : 0], image: "")
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadImageWithKingfisher(from: pokemon.image, imageView: bulbasourImage)
        addViews()
        setupUI()
        setupPokemonUI()
        configureBackButton()
        setUpColors()
        
    }
    
    
    func setUpColors(){
        view.backgroundColor = setColor(pokemonType: pokemon.types[0])
        aboutLabel.textColor = self.setColor(pokemonType: pokemon.types[0])
        HPLabel.textColor = self.setColor(pokemonType: pokemon.types[0])
        ATKLabel.textColor = self.setColor(pokemonType: pokemon.types[0])
        DEFLabel.textColor = self.setColor(pokemonType: pokemon.types[0])
        SATKLabel.textColor = self.setColor(pokemonType: pokemon.types[0])
        SDEFLabel.textColor = self.setColor(pokemonType: pokemon.types[0])
        SPDLabel.textColor = self.setColor(pokemonType: pokemon.types[0])
        baseStatsLabel.textColor = self.setColor(pokemonType: pokemon.types[0])
    }
    
    
    
    func configureBackButton() {
        let customBackButton = UIButton(type: .system)
        customBackButton.setTitle("<  \(pokemon.name)", for: .normal)
        customBackButton.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        customBackButton.setTitleColor(.white, for: .normal)
        customBackButton.addTarget(self, action: #selector(barBackButtonTapped), for: .touchUpInside)

        let backButton = UIBarButtonItem(customView: customBackButton)
        navigationItem.leftBarButtonItem = backButton
    }

    @objc func barBackButtonTapped() {
        // Handle the custom back button action
        navigationController?.popViewController(animated: true) // Example action to pop the view controller
    }

    
    func setupUI() {
        dataValueHP = Float(pokemon.stats["hp"] ?? 0)
        progressViewHP.progressTintColor = self.setColor(pokemonType: pokemon.types[0])
        progressViewHP.trackTintColor = .lightGray
        progressViewHP.setProgress(dataValueHP  / maxValue, animated: true)
        progressViewHP.translatesAutoresizingMaskIntoConstraints = false
        progressViewHP.widthAnchor.constraint(equalToConstant: 220).isActive = true
        progressViewHP.heightAnchor.constraint(equalToConstant: 3).isActive = true
        

        dataValueATK = Float(pokemon.stats["attack"] ?? 0)
    
   
        progressViewATK.progressTintColor = self.setColor(pokemonType: pokemon.types[0])
        progressViewATK.trackTintColor = .lightGray
        progressViewATK.setProgress((dataValueATK  / maxValue ) , animated: true)
        progressViewATK.translatesAutoresizingMaskIntoConstraints = false
        progressViewATK.widthAnchor.constraint(equalToConstant: 220).isActive = true
        progressViewATK.heightAnchor.constraint(equalToConstant: 3).isActive = true
  
        
        
        dataValueDEF = Float(pokemon.stats["defense"] ?? 0)
        
        progressViewDEF.progressTintColor = self.setColor(pokemonType: pokemon.types[0])
        progressViewDEF.trackTintColor = .lightGray
        progressViewDEF.setProgress(dataValueDEF  / maxValue, animated: true)
        progressViewDEF.translatesAutoresizingMaskIntoConstraints = false
        progressViewDEF.widthAnchor.constraint(equalToConstant: 220).isActive = true
        progressViewDEF.heightAnchor.constraint(equalToConstant: 3).isActive = true
    
    
         
         dataValueSATK = Float(pokemon.stats["special-attack"] ?? 0)
      
        progressViewSATK.progressTintColor = self.setColor(pokemonType: pokemon.types[0])
        progressViewSATK.trackTintColor = .lightGray
        progressViewSATK.setProgress(dataValueSATK  / maxValue, animated: true)
        progressViewSATK.translatesAutoresizingMaskIntoConstraints = false
        progressViewSATK.widthAnchor.constraint(equalToConstant: 220).isActive = true
        progressViewSATK.heightAnchor.constraint(equalToConstant: 3).isActive = true
 
        
        dataValueSDEF  = Float(pokemon.stats["special-defense"] ?? 0)
        
        progressViewSDEF.progressTintColor = self.setColor(pokemonType: pokemon.types[0])
        progressViewSDEF.trackTintColor = .lightGray
        progressViewSDEF.setProgress(dataValueSDEF  / maxValue, animated: true)
        progressViewSDEF.translatesAutoresizingMaskIntoConstraints = false
        progressViewSDEF.widthAnchor.constraint(equalToConstant: 220).isActive = true
        progressViewSDEF.heightAnchor.constraint(equalToConstant: 3).isActive = true
  
        
   
        
        dataValueSPD = Float(pokemon.stats["speed"] ?? 0)
        
        progressViewSPD.progressTintColor = self.setColor(pokemonType: pokemon.types[0])
        progressViewSPD.trackTintColor = .lightGray
        progressViewSPD.setProgress(dataValueSPD  / maxValue, animated: true)
        progressViewSPD.translatesAutoresizingMaskIntoConstraints = false
        progressViewSPD.widthAnchor.constraint(equalToConstant: 220).isActive = true
        progressViewSPD.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        progressViewHPLabel.textColor = .black
        progressViewHPLabel.textAlignment = .center
        progressViewHPLabel.font = UIFont.systemFont(ofSize: 12,weight: .regular)
        progressViewHPLabel.translatesAutoresizingMaskIntoConstraints = false
        progressViewHPLabel.text = "\(Int(progressViewHP.progress * 220))"
        
        progressViewATKLabel.textColor = .black
        progressViewATKLabel.textAlignment = .center
        progressViewATKLabel.font = UIFont.systemFont(ofSize: 12,weight: .regular)
        progressViewATKLabel.translatesAutoresizingMaskIntoConstraints = false
        progressViewATKLabel.text = "\(Int(progressViewATK.progress * 220))"
        
        progressViewDEFLabel.textColor = .black
        progressViewDEFLabel.textAlignment = .center
        progressViewDEFLabel.font = UIFont.systemFont(ofSize: 12,weight: .regular)
        progressViewDEFLabel.translatesAutoresizingMaskIntoConstraints = false
        progressViewDEFLabel.text = "\(Int(progressViewDEF.progress * 220))"
        
        
        progressViewSATKLabel.textColor = .black
        progressViewSATKLabel.textAlignment = .center
        progressViewSATKLabel.font = UIFont.systemFont(ofSize: 12,weight: .regular)
        progressViewSATKLabel.translatesAutoresizingMaskIntoConstraints = false
        progressViewSATKLabel.text = "\(Int(progressViewSATK.progress * 220))"
        
        
        progressViewSDEFLabel.textColor = .black
        progressViewSDEFLabel.textAlignment = .center
        progressViewSDEFLabel.font = UIFont.systemFont(ofSize: 12,weight: .regular)
        progressViewSDEFLabel.translatesAutoresizingMaskIntoConstraints = false
        progressViewSDEFLabel.text = "\(Int(progressViewSDEF.progress * 220))"
        
        progressViewSPDLabel.textColor = .black
        progressViewSPDLabel.textAlignment = .center
        progressViewSPDLabel.font = UIFont.systemFont(ofSize: 12,weight: .regular)
        progressViewSPDLabel.translatesAutoresizingMaskIntoConstraints = false
        progressViewSPDLabel.text = "\(Int(progressViewSPD.progress * 220))"
        
        
        
    }
    func setupPokemonUI() {
        self.weightValueLabel.text = String(pokemon.weight)
        self.heightValueLabel.text = String(pokemon.height)
        if !pokemon.abilities.isEmpty {
            self.specialMovesLabel.text = String(pokemon.abilities[0])
            if pokemon.abilities.count > 1 {
                self.specialMovesLabel2.text = String(pokemon.abilities[1])
            } else {
                self.specialMovesLabel2.text = ""
            }
        } else {
            self.specialMovesLabel.text = ""
            self.specialMovesLabel2.text = ""
        }
        if !pokemon.types.isEmpty {
            self.skillsLabel.text = pokemon.types[0]
            if pokemon.types.count > 1 {
                self.skillsLabel2.text = pokemon.types[1]
            } else {
                self.skillsLabel2.text = ""
                self.skillsLabel2.backgroundColor = .white
            }
        }
        self.descriptionLabel.text = pokemon.desc
        self.progressViewHPLabel.text = String(pokemon.stats["hp"] ?? 0)
        self.progressViewATKLabel.text = String(pokemon.stats["attack"] ?? 0)
        self.progressViewDEFLabel.text = String(pokemon.stats["defense"] ?? 0)
        self.progressViewSATKLabel.text = String(pokemon.stats["special-attack"] ?? 0)
        self.progressViewSDEFLabel.text = String(pokemon.stats["special-defense"] ?? 0)
        self.progressViewSPDLabel.text = String(pokemon.stats["speed"] ?? 0)
        
        
    }
    
    func downloadImageWithKingfisher(from urlString: String, imageView: UIImageView) {
        if let url = URL(string: urlString) {
            imageView.kf.setImage(with: url)
        }
    }
    
    
    func setColor(pokemonType: String) -> UIColor{
        if pokemonType == "grass"{
            return UIColor(named: "grassColor")!
        }else if pokemonType == "poison"{
            return UIColor(named: "poisonColor")!
        }else if pokemonType == "fire"{
            return UIColor(named: "fireColor")!
        }else if pokemonType == "water"{
            return UIColor(named: "waterColor")!
        }else if pokemonType == "bug"{
            return UIColor(named: "bugColor")!
        }else if pokemonType == "flying"{
            return UIColor(named: "flyingColor")!
        }else if pokemonType == "electric"{
            return UIColor(named: "electricColor")!
        }else if pokemonType == "ghost"{
            return UIColor(named: "ghostColor")!
        }else if pokemonType == "normal"{
            return UIColor(named: "normalColor")!
        }else if pokemonType == "psychic"{
            return UIColor(named: "psychicColor")!
        }else if pokemonType == "steel"{
            return UIColor(named: "steelColor")!
        }else if pokemonType == "sock"{
            return UIColor(named: "rockColor")!
        }else{
            return .blue
        }

    }

    
    
    func addViews(){
        
       
        
        var seperator = UIView(frame: .zero)
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .quaternaryLabel
        
        var seperator2 = UIView(frame: .zero)
        seperator2.translatesAutoresizingMaskIntoConstraints = false
        seperator2.backgroundColor = .quaternaryLabel
        
        var seperator3 = UIView(frame: .zero)
        seperator3.translatesAutoresizingMaskIntoConstraints = false
        seperator3.backgroundColor = .quaternaryLabel
        
        view.addSubview(pokemonBackgroundImage)
        view.addSubview(background)
        view.addSubview(bulbasourImage)
        
        view.addSubview(skillsLabel)
        view.addSubview(skillsLabel2)
        
        view.addSubview(aboutLabel)
        
        view.addSubview(weightImage)
        view.addSubview(weightValueLabel)
        view.addSubview(weightLabel)
        
        view.addSubview(seperator)
        
        view.addSubview(heightImage)
        view.addSubview(heightValueLabel)
        view.addSubview(heightLabel)
        
        view.addSubview(seperator2)
        
        view.addSubview(specialMovesLabel)
        view.addSubview(specialMovesLabel2)
        view.addSubview(movesLabel)
        
        view.addSubview(descriptionLabel)
        
        view.addSubview(baseStatsLabel)
        
        view.addSubview(HPLabel)
        view.addSubview(ATKLabel)
        view.addSubview(DEFLabel)
        view.addSubview(SATKLabel)
        view.addSubview(SDEFLabel)
        view.addSubview(SPDLabel)
        
        view.addSubview(seperator3)
        
        view.addSubview(progressViewHP)
        view.addSubview(progressViewATK)
        view.addSubview(progressViewDEF)
        view.addSubview(progressViewSATK)
        view.addSubview(progressViewSDEF)
        view.addSubview(progressViewSPD)
        
        view.addSubview(progressViewHPLabel)
        view.addSubview(progressViewATKLabel)
        view.addSubview(progressViewDEFLabel)
        view.addSubview(progressViewSATKLabel)
        view.addSubview(progressViewSDEFLabel)
        view.addSubview(progressViewSPDLabel)
        
        view.addSubview(nextButton)
        view.addSubview(backButton)
        
        
        var stackViewWeight = UIStackView(arrangedSubviews: [ weightImage,weightValueLabel])
        stackViewWeight.translatesAutoresizingMaskIntoConstraints = false
        stackViewWeight.axis = .horizontal
        view.addSubview(stackViewWeight)
        
        var stackViewHeight = UIStackView(arrangedSubviews: [ heightImage,heightValueLabel])
        stackViewHeight.translatesAutoresizingMaskIntoConstraints = false
        stackViewHeight.axis = .horizontal
        view.addSubview(stackViewHeight)
        
        var stackViewAbility = UIStackView(arrangedSubviews: [ HPLabel,ATKLabel,DEFLabel,SATKLabel,SDEFLabel,SPDLabel])
        stackViewAbility.translatesAutoresizingMaskIntoConstraints = false
        stackViewAbility.axis = .vertical
        view.addSubview(stackViewAbility)
        
        
        
        
        NSLayoutConstraint.activate([
            
            pokemonBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            pokemonBackgroundImage.bottomAnchor.constraint(equalTo: background.topAnchor, constant: -6),
            pokemonBackgroundImage.widthAnchor.constraint(equalTo:view.widthAnchor,multiplier: 0.57),
            pokemonBackgroundImage.heightAnchor.constraint(equalTo:view.heightAnchor,multiplier: 0.325),
            
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -4),
            background.heightAnchor.constraint(equalTo:view.heightAnchor,multiplier: 0.65),
            
            
            bulbasourImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bulbasourImage.heightAnchor.constraint(equalToConstant: 200),
            bulbasourImage.widthAnchor.constraint(equalToConstant: 200),
            bulbasourImage.bottomAnchor.constraint(equalTo: skillsLabel.topAnchor, constant: -10),
            
            
            skillsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -50),
            skillsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -70),
            skillsLabel.widthAnchor.constraint(equalToConstant: 70),
            
            skillsLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 50),
            skillsLabel2.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -70),
            skillsLabel2.widthAnchor.constraint(equalToConstant: 70),
            
            aboutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -20),
            aboutLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            stackViewWeight.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor,constant: 30),
            stackViewWeight.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 60),
            
            weightLabel.topAnchor.constraint(equalTo: stackViewWeight.bottomAnchor,constant: 28),
            weightLabel.centerXAnchor.constraint(equalTo: stackViewWeight.centerXAnchor),
            
            seperator.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor,constant: 30),
            seperator.leadingAnchor.constraint(equalTo: stackViewWeight.trailingAnchor,constant: 20),
            seperator.heightAnchor.constraint(equalToConstant: 60),
            seperator.widthAnchor.constraint(equalToConstant: 3),
            
            stackViewHeight.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor,constant: 30),
            stackViewHeight.leadingAnchor.constraint(equalTo: seperator.trailingAnchor,constant: 9),
            stackViewHeight.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            heightLabel.topAnchor.constraint(equalTo: stackViewHeight.bottomAnchor,constant: 28),
            heightLabel.centerXAnchor.constraint(equalTo: stackViewHeight.centerXAnchor),
            
            seperator2.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor,constant: 30),
            seperator2.leadingAnchor.constraint(equalTo: stackViewHeight.trailingAnchor,constant: 20),
            seperator2.heightAnchor.constraint(equalToConstant: 60),
            seperator2.widthAnchor.constraint(equalToConstant: 3),
            
            specialMovesLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor,constant: 25),
            specialMovesLabel.leadingAnchor.constraint(equalTo: seperator2.trailingAnchor,constant: 20),
            
            specialMovesLabel2.topAnchor.constraint(equalTo: specialMovesLabel.bottomAnchor,constant: 5),
            specialMovesLabel2.leadingAnchor.constraint(equalTo: seperator2.trailingAnchor,constant: 20),
            
            movesLabel.topAnchor.constraint(equalTo: specialMovesLabel.bottomAnchor, constant: 38),
            movesLabel.centerXAnchor.constraint(equalTo: specialMovesLabel.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor,constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 5),
            
            baseStatsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            baseStatsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            
            stackViewAbility.topAnchor.constraint(equalTo: baseStatsLabel.bottomAnchor,constant: 27),
            stackViewAbility.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            
            seperator3.topAnchor.constraint(equalTo: baseStatsLabel.bottomAnchor,constant: 30),
            seperator3.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor, constant: 20),
            seperator3.heightAnchor.constraint(equalToConstant: 150),
            seperator3.widthAnchor.constraint(equalToConstant: 3),
            
            progressViewHP.topAnchor.constraint(equalTo: baseStatsLabel.bottomAnchor,constant: 30),
            progressViewHP.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor,constant: 70),
            progressViewHPLabel.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor,constant: 35),
            progressViewHPLabel.topAnchor.constraint(equalTo: baseStatsLabel.bottomAnchor,constant: 24),
            
            progressViewATK.topAnchor.constraint(equalTo: progressViewHP.bottomAnchor,constant: 25),
            progressViewATK.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor,constant: 70),
            progressViewATKLabel.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor,constant: 35),
            progressViewATKLabel.topAnchor.constraint(equalTo: progressViewHPLabel.bottomAnchor,constant: 15),
            
            progressViewDEF.topAnchor.constraint(equalTo: progressViewATK.bottomAnchor,constant: 25),
            progressViewDEF.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor,constant: 70),
            progressViewDEFLabel.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor,constant: 35),
            progressViewDEFLabel.topAnchor.constraint(equalTo: progressViewATKLabel.bottomAnchor,constant: 15),
            
            progressViewSATK.topAnchor.constraint(equalTo: progressViewDEF.bottomAnchor,constant: 25),
            progressViewSATK.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor,constant: 70),
            progressViewSATKLabel.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor,constant: 35),
            progressViewSATKLabel.topAnchor.constraint(equalTo: progressViewDEFLabel.bottomAnchor,constant: 12),
            
            progressViewSDEF.topAnchor.constraint(equalTo: progressViewSATK.bottomAnchor,constant: 25),
            progressViewSDEF.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor,constant: 70),
            progressViewSDEFLabel.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor,constant: 35),
            progressViewSDEFLabel.topAnchor.constraint(equalTo: progressViewSATKLabel.bottomAnchor,constant: 15),
            
            progressViewSPD.topAnchor.constraint(equalTo: progressViewSDEF.bottomAnchor,constant: 25),
            progressViewSPD.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor,constant: 70),
            progressViewSPDLabel.leadingAnchor.constraint(equalTo: stackViewAbility.trailingAnchor,constant: 35),
            progressViewSPDLabel.topAnchor.constraint(equalTo: progressViewSDEFLabel.bottomAnchor,constant: 15),
            
            nextButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 250),
            nextButton.trailingAnchor.constraint(equalTo: bulbasourImage.trailingAnchor,constant: 60),
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 250),
            backButton.leadingAnchor.constraint(equalTo: bulbasourImage.leadingAnchor,constant: -60),
            
        ])
        stackViewWeight.setCustomSpacing(15, after: weightImage)
        stackViewHeight.setCustomSpacing(15, after: heightImage)
        stackViewAbility.setCustomSpacing(5, after: HPLabel)
        stackViewAbility.setCustomSpacing(5, after: ATKLabel)
        stackViewAbility.setCustomSpacing(7, after: DEFLabel)
        stackViewAbility.setCustomSpacing(10, after: SATKLabel)
        stackViewAbility.setCustomSpacing(8, after: SDEFLabel)
    }
    
    
    
}

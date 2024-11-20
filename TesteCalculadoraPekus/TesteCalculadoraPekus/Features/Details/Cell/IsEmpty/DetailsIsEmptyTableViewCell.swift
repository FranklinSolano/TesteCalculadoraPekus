//
//  DetailsIsEmptyTableViewCell.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 20/11/24.
//

import UIKit

class DetailsIsEmptyTableViewCell: UITableViewCell {
    
    //MARK: - Elements
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: DetailsIsEmptyTableViewCellEnum.title.rawValue, font: DesignerSystem.Fonts.fontBold , textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var imageLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: DetailsIsEmptyTableViewCellEnum.image.rawValue)
        imageView.tintColor = DesignerSystem.Colors.primaryColor
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    //MARK: - Other Methods
    
    static let identifier: String = DetailsIsEmptyTableViewCellEnum.identifier.rawValue
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Other Methods
    
    private func configSetup() {
        configColor()
        configElements()
        configConstraints()
    }
    
    private func configColor(){
        backgroundColor = DesignerSystem.Colors.secondaryColor
    }
    
    private func configElements(){
        addSubview(titleLabel)
        addSubview(imageLogo)
    }
    
    private func configConstraints(){
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -70),
            
            imageLogo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            imageLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 150),
            imageLogo.widthAnchor.constraint(equalToConstant: 150)
            
        ])
    }

}

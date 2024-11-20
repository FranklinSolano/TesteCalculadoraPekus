//
//  DetailsScreen.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit

class DetailsScreen: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Dados de todas as operações", font: DesignerSystem.Fonts.fontBold, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var detailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = DesignerSystem.Colors.secondaryColor
        tableView.register(DetailsScreenTableViewCell.self, forCellReuseIdentifier: DetailsScreenTableViewCell.identifier)
        tableView.register(DetailsIsEmptyTableViewCell.self, forCellReuseIdentifier: DetailsIsEmptyTableViewCell.identifier)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        detailsTableView.delegate = delegate
        detailsTableView.dataSource = dataSource
    }
    
    private func configSetup(){
        configColor()
        configElements()
        configConstraints()
    }
    
    private func configColor(){
        backgroundColor = DesignerSystem.Colors.secondaryColor
    }
    
    private func configElements(){
        addSubview(titleLabel)
        addSubview(detailsTableView)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            detailsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 50),
            detailsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            ])
    }
}

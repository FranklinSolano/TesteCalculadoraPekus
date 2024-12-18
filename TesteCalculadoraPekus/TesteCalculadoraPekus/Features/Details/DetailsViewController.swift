//
//  DetailsViewController.swift
//  TesteCalculadoraPekus
//
//  Created by Franklin  Stilhano Solano on 19/11/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var screen: DetailsScreen?
    var viewModel: DetailsViewModel = DetailsViewModel()

    //MARK: - Inicializador
    override func loadView() {
        screen = DetailsScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableView(delegate: self, dataSource: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        pullFirebase()
    }
    
    //MARK: - Other Methods
    
    func pullFirebase(){
        viewModel.fetchUserData { (resultData, error) in
                if let error = error {
                    print("Erro ao buscar dados: \(error.localizedDescription)")
                } else if let resultData = resultData {
                    self.viewModel.dataPopular = resultData
                    self.screen?.detailsTableView.reloadData() // Atualiza a UITableView com os dados carregados
                }
            }
    }
    
}

//MARK: - Extension UITableViewDelegate, UITableViewDataSource

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.dataPopular.isEmpty {
            return 1
        } else {
            return viewModel.dataPopular.count + 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.dataPopular.isEmpty {
            let cell: DetailsIsEmptyTableViewCell? = tableView.dequeueReusableCell(withIdentifier: DetailsIsEmptyTableViewCell.identifier, for: indexPath) as? DetailsIsEmptyTableViewCell
            return cell ?? UITableViewCell()
        } else if indexPath.row == 0 {
            let cell: DetailsScreenTableViewCell? = tableView.dequeueReusableCell(withIdentifier: DetailsScreenTableViewCell.identifier, for: indexPath) as? DetailsScreenTableViewCell
            cell?.configSetupCellWithFixedData()
            return cell ?? UITableViewCell()
        } else {
            let cell: DetailsScreenTableViewCell? = tableView.dequeueReusableCell(withIdentifier: DetailsScreenTableViewCell.identifier, for: indexPath) as? DetailsScreenTableViewCell
            let dataIndex = indexPath.row - 1  // Subtrai 1 para ajustar o índice do array
            cell?.configSetupCellPopular(data: viewModel.dataPopular[dataIndex])
            return cell ?? UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if viewModel.dataPopular.isEmpty {
            return 350
        } else {
            return 90
        }
    }
    
}

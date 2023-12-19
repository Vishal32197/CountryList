//
//  CountryListViewController.swift
//  AylanDemo
//
//  Created by Bishal Ram on 19/12/23.
//

import UIKit
import RxSwift
import RxCocoa
import Stevia

class CountryListViewController: UIViewController {
    
    // MARK: // Properties
    private let viewModel: CountryListViewModelProtocol
    private let disposeBag = DisposeBag()
    
    // MARK: // UI-Components
    private lazy var countryListTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(CountryListTableViewCell.self, forCellReuseIdentifier: "\(CountryListTableViewCell.self)")
        tableview.estimatedRowHeight = 42.0
        tableview.separatorStyle = .none
        tableview.rowHeight = UITableView.automaticDimension
        return tableview
    }()
    
    // MARK: // Initialization
    init(viewModel: CountryListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: // LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewLayout()
        addBindings()
        viewModel.fetchData()
    }
    
    // MARK: // Private Methods
    private func setupViewLayout() {
        view.backgroundColor = .white
        
        view.subviews {
            countryListTableView
        }
        
        countryListTableView.fillContainer()
    }
    
    private func addBindings() {
        viewModel.countryDetailDatasource
            .bind(to: countryListTableView.rx.items(cellIdentifier: "\(CountryListTableViewCell.self)", cellType: CountryListTableViewCell.self)) {[weak self] row, element, cell in
                cell.countryDetail = element
            }.disposed(by: disposeBag)
    }
}

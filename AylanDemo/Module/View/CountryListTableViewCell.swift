//
//  CountryListTableViewCell.swift
//  AylanDemo
//
//  Created by Bishal Ram on 19/12/23.
//

import UIKit
import Stevia
import Kingfisher

class CountryListTableViewCell: UITableViewCell {
    
    // MARK: // Computed Property
    var countryDetail: Countries? {
        didSet {
            setupCell()
        }
    }
    
    // MARK: // UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
   
    // MARK: // Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: // Private MAethods
    private func setupViewLayout() {
        contentView.backgroundColor = .white
        
        contentView.subviews {
            titleLabel
            descriptionLabel
            bannerImageView
        }
        
        titleLabel.Top == contentView.Top + Constants.verticalSpacing
        titleLabel.Left == contentView.Left + Constants.leftMargin
        titleLabel.Right == contentView.Right - Constants.horizontalSpacing
        
        descriptionLabel.Top == titleLabel.Bottom + Constants.descriptionTopSpacing
        descriptionLabel.Leading == titleLabel.Leading
        descriptionLabel.Trailing == titleLabel.Trailing
        
        bannerImageView.Top == descriptionLabel.Bottom + Constants.descriptionBottomSpacing
        bannerImageView.fillHorizontally()
        bannerImageView.Bottom == contentView.Bottom - Constants.verticalSpacing
        bannerImageView.height(Constants.imageViewHeight)
    }
    
    private func setupCell() {
        guard let countryDetail = countryDetail else { return }
        titleLabel.text = countryDetail.title
        descriptionLabel.text = countryDetail.description
        if let imageUrl = countryDetail.imageHref, let url = URL(string: imageUrl) {
            bannerImageView.kf.setImage(with: url)
       }
    }
    
    // MARK: // Constants
    private enum Constants {
        //Dimensions:
        static let verticalSpacing: CGFloat = 12
        static let descriptionTopSpacing: CGFloat = 8
        static let descriptionBottomSpacing: CGFloat = 12
        static let leftMargin: CGFloat = 8
        static let horizontalSpacing: CGFloat = 8
        static let imageViewHeight: CGFloat = 164
    }
}

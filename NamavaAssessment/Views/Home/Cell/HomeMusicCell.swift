//
//  HomeMusicCell.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/15/23.
//

import UIKit

class HomeMusicCell: UITableViewCell {
    // MARK: - properties
    static let CellID = "HomeMusicCell"
    let trackNameLabel = UILabel()
    let artistNameLabel = UILabel()
//    let shortDescriptionLabel = UILabel()
    let releaseData = UILabel()
    let artworkImageView = UIImageView()
    var stackView: UIStackView!
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - prepare UI
    func setupView() {
        prepareTitles()
        prepareImageView()
        
        // add subviews
        contentView.addSubview(stackView)
        contentView.addSubview(releaseData)
//        contentView.addSubview(shortDescriptionLabel)
        contentView.addSubview(artworkImageView)
        // constraints
        
        artworkImageView.anchorWithConstantsToTop(top: contentView.topAnchor, left: contentView.leftAnchor, topConstant: 12, leftConstant: 12)
        stackView.anchorWithConstantsToTop(top: artworkImageView.topAnchor, left: artworkImageView.rightAnchor, bottom: contentView.bottomAnchor, leftConstant: 8, bottomConstant: -12)
        releaseData.anchorWithConstantsToTop(top: artworkImageView.topAnchor, right: contentView.rightAnchor, topConstant: 6, rightConstant: 12)
//        shortDescriptionLabel.anchorWithConstantsToTop(top: stackView.bottomAnchor, left: artworkImageView.leftAnchor, right: contentView.rightAnchor, bottom: contentView.bottomAnchor, topConstant: 8, rightConstant: 12, bottomConstant: -12)
        
        NSLayoutConstraint.activate([
            artworkImageView.widthAnchor.constraint(equalToConstant: 32),
            artworkImageView.heightAnchor.constraint(equalToConstant: 32),
            stackView.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.5)
        ])
    }
    
    // MARK: - prepareTitles
    func prepareTitles() {
        // trackNameLabel
        trackNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        trackNameLabel.textColor = .black
        
        // artistNameLabel
        artistNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        artistNameLabel.textColor = .gray
        //releaseData
        releaseData.font = UIFont.systemFont(ofSize: 14, weight: .light)
        releaseData.textColor = .gray
        // shortDescriptionLabel
//        shortDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
//        shortDescriptionLabel.textColor = .gray
//        shortDescriptionLabel.numberOfLines = 4
        
        // stack
        stackView = UIStackView(arrangedSubviews: [trackNameLabel, artistNameLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
    }
    
    // MARK: - prepareImageView
    func prepareImageView() {
        artworkImageView.layer.cornerRadius = 4
        artworkImageView.clipsToBounds = true
        artworkImageView.backgroundColor = .gray
        artworkImageView.contentMode = .scaleAspectFit
    }
    
    // MARK: - config
    func configure(music: Music) {
        if let urlStr = music.artworkUrl30, let url = URL(string: urlStr) {
            self.artworkImageView.load(url: url)
        } else {
            self.artworkImageView.image = nil
        }
        self.artistNameLabel.text = music.artistName
        self.trackNameLabel.text = music.trackName
        if let dateStr = music.releaseDate, let date = dateStr.toDate(.isoDateTimeSec) {
            self.releaseData.text = date.changeFormat()
        } else {
            self.releaseData.text = ""
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.artworkImageView.image = nil
    }
}


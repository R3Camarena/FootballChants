//
//  TeamTableViewCell.swift
//  Football Chants
//
//  Created by Ricardo Camarena on 10/05/23.
//

import UIKit

protocol TeamTableViewCellDelegate: AnyObject {
    func didTapPlayback(for team: Team)
}

class TeamTableViewCell: UITableViewCell {

    static let cellId = "TeamTableViewCell"
    
    // MARK: - UI
    
    // Container View
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Stack View
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        return stackView
    }()
    
    // Badge Image
    private lazy var badgeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Play Button
    private lazy var playbackButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        return btn
    }()
    
    // Team name label
    private lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    // Founded date label
    private lazy var foundedLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .white
        return label
    }()
    
    // Job type label
    private lazy var jobLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .white
        return label
    }()
    
    // Full information label
    private lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private weak var delegate: TeamTableViewCellDelegate?
    private var team: Team?
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.team = nil
        self.delegate = nil
        self.contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func configure(with item: Team, delegate: TeamTableViewCellDelegate) {
        
        self.team = item
        self.delegate = delegate
        
        playbackButton.addTarget(self, action: #selector(didTapPlayback), for: .touchUpInside)
        
        containerView.backgroundColor = item.id.background
        
        badgeImageView.image = item.id.badge
        
        playbackButton.setImage(item.isPlaying ? Assets.pause : Assets.play, for: .normal)
        
        nameLabel.text = item.name
        foundedLabel.text = item.founded
        jobLabel.text = "Current \(item.manager.job.rawValue): \(item.manager.name)"
        infoLabel.text = item.info
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(contentStackView)
        containerView.addSubview(badgeImageView)
        containerView.addSubview(playbackButton)
        
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(foundedLabel)
        contentStackView.addArrangedSubview(jobLabel)
        contentStackView.addArrangedSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            // Container View constraints
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            // Badge Image constraints
            badgeImageView.heightAnchor.constraint(equalToConstant: 50),
            badgeImageView.widthAnchor.constraint(equalToConstant: 50),
            badgeImageView.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            badgeImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            
            // Content Stack View constraints
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: badgeImageView.trailingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: playbackButton.leadingAnchor, constant: -8),
            
            // Play button constraints
            playbackButton.heightAnchor.constraint(equalToConstant: 44),
            playbackButton.widthAnchor.constraint(equalToConstant: 44),
            playbackButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            playbackButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            
        ])
    }
    
    @objc func didTapPlayback() {
        if let team = team {
            delegate?.didTapPlayback(for: team)
        }
    }
}

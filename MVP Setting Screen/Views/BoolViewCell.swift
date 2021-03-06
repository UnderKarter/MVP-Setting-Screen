//
//  BoolViewCell.swift
//  MVP Setting Screen
//
//  Created by temp user on 11.07.2022.
//

import UIKit

class BoolViewCell: UITableViewCell {
    
    static let identifier = "BoolViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let moodLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = Metrics.labelNumberOfLines
        label.textColor = .systemGray2
        return label
    }()
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = Metrics.iconContainerCornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Инициализация
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(moodLabel)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // Настройка размеров и положения ячейки и элементов
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height - Metrics.sizeHeight
        iconContainer.frame = CGRect(
            x: Metrics.iconContainerFrameX,
            y: Metrics.iconContainerFrameY,
            width: size,
            height: size
        )
        
        let imageSize: CGFloat = size
        iconImageView.frame = CGRect(
            x: (size-imageSize) / Metrics.iconImageViewFrameX,
            y: (size-imageSize) / Metrics.iconImageViewFrameY,
            width: imageSize,
            height: imageSize
        )
        
        label.frame = CGRect(
            x: Metrics.labelFrameX + iconContainer.frame.size.width,
            y: Metrics.labelFrameY,
            width: contentView.frame.size.width - Metrics.labelFrameWidth - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )
        
        moodLabel.frame = CGRect(
            x: contentView.frame.width - Metrics.moodLabelFrameX,
            y: Metrics.moodLabelFrameY,
            width: contentView.frame.size.width - Metrics.moodLabelFrameWidth - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )
    }
    
    // поготовка к повторному использованию
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        moodLabel.text = nil
        iconContainer.backgroundColor = nil
    }
    
    // передача значений элементам структуры
    public func configure(with model: BoolOption) {
        label.text = model.title
        moodLabel.text = model.label
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
    
    private struct Metrics {
        
        static let labelNumberOfLines = 1
        
        static let labelFrameX: CGFloat = 25
        static let labelFrameY: CGFloat = 0
        static let labelFrameWidth: CGFloat = 15
        
        static let iconImageViewFrameX: CGFloat = 2
        static let iconImageViewFrameY: CGFloat = 2
        
        static let sizeHeight: CGFloat = 12
        
        static let iconContainerCornerRadius: CGFloat = 8
        static let iconContainerFrameX: CGFloat = 15
        static let iconContainerFrameY: CGFloat = 8
        
        static let moodLabelFrameX: CGFloat = 90
        static let moodLabelFrameY: CGFloat = 0
        static let moodLabelFrameWidth: CGFloat = 15
    }
}


//
//  ArticleDetailsViewController.swift
//  AppleNews
//
//  Created by Артур Олехно on 22/11/2023.
//

import UIKit
import SDWebImage

class ArticleDetailsViewController: UIViewController {
    
    let newsUIViewConteiner = UIView()

    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 28)
        return label
    }()
    
    let imageUIImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        
        scrollStackViewContainer.addArrangedSubview(newsUIViewConteiner)
        
        newsUIViewConteiner.addSubview(titleLabel)
        newsUIViewConteiner.addSubview(authorLabel)
        newsUIViewConteiner.addSubview(imageUIImageView)
        newsUIViewConteiner.addSubview(contentLabel)
        
        applyConstraints()
    }
    
    public func configure(with model: Article) {
        titleLabel.text = model.title
        authorLabel.text = model.author
        guard let url = URL(string: model.urlToImage!) else {return}
        imageUIImageView.sd_setImage(with: url)
        contentLabel.text = model.content
    }
    
    private func applyConstraints() {
        let scrollViewConstraits = [
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        let scrollStackViewContainerConstraints = [
            scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ]

        let newsUIViewConteinerConstraints = [
            newsUIViewConteiner.heightAnchor.constraint(equalToConstant: 800)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor)
        ]
        let authorLabelConstraints = [
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor)
        ]
        let imageUIImageViewConstraints = [
            imageUIImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            imageUIImageView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            imageUIImageView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            imageUIImageView.heightAnchor.constraint(equalToConstant: 300)

        ]
        let contentLabelConstraints = [
            contentLabel.topAnchor.constraint(equalTo: imageUIImageView.bottomAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraits)
        NSLayoutConstraint.activate(scrollStackViewContainerConstraints)
        
        NSLayoutConstraint.activate(newsUIViewConteinerConstraints)
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(authorLabelConstraints)
        NSLayoutConstraint.activate(imageUIImageViewConstraints)
        NSLayoutConstraint.activate(contentLabelConstraints)
    }
}

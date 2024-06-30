//
//  ViewController.swift
//  RandomPhoto
//
//  Created by C P Karthik on 30/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.backgroundColor = .white
        return imageview
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemTeal,
        .systemGreen,
        .systemBlue,
        .systemCyan,
        .systemGray2,
        .systemGray3,
        .systemGray4,
        .systemGray5,
        .systemGray6,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 30,
            y:
                view .frame.size.height-150-view.safeAreaInsets
                .bottom,
            width: view.frame.size.width-60,
            height: 60
        )
    }
    
    func getRandomPhoto() {
        let urlstring = "https://media.istockphoto.com/id/1144604245/photo/a-computer-system-hacked-warning.jpg?s=1024x1024&w=is&k=20&c=eCByZfCjDbMIKrsSyeVEyXg5_M1hQhIT0HXC5EOlMaA="
        let url = URL(string: urlstring)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
        
        
        
    }
    
}

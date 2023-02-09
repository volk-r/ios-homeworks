//
//  InfoViewController.swift
//  Navigation
//
//  Created by Roman Romanov on 04.02.2023.
//

import UIKit

final class InfoViewController: UIViewController {

    private let articleButton: UIButton =  {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Тут что-то есть", for: .normal)
        button.setTitle("Открываю окошко", for: .highlighted)
        button.backgroundColor = .blue

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        setupButtons()
    }

    private func setupButtons() {
        view.addSubview(articleButton)
        articleButton.center = view.center
        articleButton.addTarget(self, action: #selector(articleAction), for: .touchUpInside)
    }

    @objc private func articleAction() {
        let alert = UIAlertController(title: "Оставтьe отзыв", message: "Поделитесь мнение о прочитанной статье", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Поехали!", style: .default) {_ in
            print("Трам парам, на страницу отзыва переходим")
        }
        let cancelAction = UIAlertAction(title: "Не хочу!", style: .destructive) {_ in
            print("К сожалению, отзыва не оставили :(")
        }
        alert.addAction(cancelAction)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }

}

//
//  Storyboards.swift
//  Metronome
//
//  Created by krris on 05/03/2017.
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit

struct Storyboards {
    struct MainScreen {
        static var storyboard: UIStoryboard {
            return UIStoryboard(name: "MainScreen", bundle: nil)
        }

        static func instantiate(viewModel: MainScreenViewModel) -> MainScreenViewController {
            guard let viewController = storyboard.instantiateViewController(withIdentifier: MainScreenViewController.nameOfClass)
                as? MainScreenViewController else {
                fatalError("Cannot isntatiate \(MainScreenViewController.self)")
            }
            viewController.viewModel = viewModel
            return viewController
        }
    }
}

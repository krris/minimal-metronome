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

        static func instantiate() -> MainScreenViewController {
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "MainScreenViewController")
                as? MainScreenViewController else {
                fatalError("Cannot isntatiate \(MainScreenViewController.self)")
            }
            viewController.viewModel = MainScreenViewModel(beatViewModel: BeatViewModel(beatsPerMinute: 64))
            return viewController
        }
    }
}

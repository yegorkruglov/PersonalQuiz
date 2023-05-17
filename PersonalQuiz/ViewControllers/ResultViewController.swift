//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 15.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChosen: [Answer]!

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        updateLabelsToResults()
    }

    // MARK: - IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func updateLabelsToResults() {
        var animalCounts: [Animal: Int] = [:]
        
        for answer in answersChosen {
            animalCounts[answer.animal, default: 0] += 1
        }
        
        if let (animal, _) = animalCounts.max(by: { $0.value < $1.value }) {
            resultLabel.text = "Вы - \(animal.rawValue)"
            descriptionLabel.text = animal.definition
        }
    }
    
    deinit {
        print("ResultViewController is deallocated")
    }

}

//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var shouldShowPlutoSwitch: UISwitch!

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        setUpSubViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
        
    }
    
    func setUpSubViews() {
        //Button
        
        let doneButton = UIButton(type: .system)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: .normal)
        //action is what needs to happen when the button is triggered.
        //touch up inside send to self view controller and calls done selector - same work as wiring up a button to an IBAction
        doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        //adds the button to the view heierarchy.
        view.addSubview(doneButton)
        //Constraints for the button
        let doneButtonTopConstraints = NSLayoutConstraint(item: doneButton,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: view.safeAreaLayoutGuide,
                                                          attribute: .top,
                                                          multiplier: 1,
                                                          constant: 20)
        
//        let doneButtonTrailingConstraints = NSLayoutConstraint(item: doneButton,
//                                                               attribute: .trailing,
//                                                               relatedBy: .equal,
//                                                               toItem: view.safeAreaLayoutGuide,
//                                                               attribute: .trailing,
//                                                               multiplier: 1,
//                                                               constant: -20)
        // 👇this is the same as the above👆
        let doneButtonTrailingConstraints = doneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        //this activates the constraints.
        NSLayoutConstraint.activate([doneButtonTopConstraints, doneButtonTrailingConstraints])
        
        //switch
        
        let shouldShowPlutoSwitch = UISwitch()
        shouldShowPlutoSwitch.translatesAutoresizingMaskIntoConstraints = false
        shouldShowPlutoSwitch.addTarget(self, action: #selector(changeShouldShowPluto(_:)), for: .valueChanged)
        view.addSubview(shouldShowPlutoSwitch)
        shouldShowPlutoSwitch.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 60).isActive = true
        shouldShowPlutoSwitch.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        self.shouldShowPlutoSwitch = shouldShowPlutoSwitch
        
        //Label
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Is Pluto a planet?"
        view.addSubview(label)
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: shouldShowPlutoSwitch.leadingAnchor, constant: -8).isActive = true
        label.centerYAnchor.constraint(equalTo: shouldShowPlutoSwitch.centerYAnchor).isActive = true
    }
    
    // MARK: - Action Handlers
    
    @objc func changeShouldShowPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
    }
    
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private
    
    private func updateViews() {
        let userDefaults = UserDefaults.standard
        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
}

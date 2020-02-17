//
//  PlanetCollectionViewCell.swift
//  ProgrammaticPlanets
//
//  Created by Spencer Curtis on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    
   
    
    var planet: Planet! {
        didSet {
            updateViews()
        }
    }
    //runs when making everything in code completely
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    //when defining cell in storyboard but subviews are laid out programmatically.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubViews()
    }
    
    private func updateViews() {
              imageView.image = planet.image
              nameLabel.text = planet.name
          }
    
    func setUpSubViews(){
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //what kind of scale is it?
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        //y
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 4).isActive = true
        //x
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 4).isActive = true
        //W
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -4).isActive = true
        //H
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        self.imageView = imageView
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
            //these ones are assigning to the cell itself
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        
        self.nameLabel = label
    }
    
   
    
    //Constraints
    
}

//
//  CardCollectionViewCell.swift
//  Match App
//
//  Created by Ketan Choyal on 05/11/18.
//  Copyright © 2018 Ketan Choyal. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func setCard(_ card:Card)
    {
        self.card = card
        
        backImageView.image = UIImage.init(named: card.imageName)
        
        //check if the card is mached or not
        if card.isMatched
        {
            //If the card has been matched then make the image view invisible
            
            frontImageView.alpha = 0
            backImageView.alpha = 0
            
            return
        }
        else{
            
            //If the card hasn't been mached then make the image view visible
            
            frontImageView.alpha = 1
            backImageView.alpha = 1
        }
        
        //Check if card is in flipped state or not
        if card.isFlipped
        {
            //filp the card
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
        }
        else
        {
            //Flipback the card
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
        }
    }
    
    func flip()
    {
        //transit the image with animation
        UIView.transition(from: frontImageView, to: backImageView, duration: 0.3, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
        
        //set the status of card
        card?.isFlipped = true
    }
    
    func filpBack()
    {
        //Delay the flipback method by 0.5 second
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.backImageView, to: self.frontImageView, duration: 0.5, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: nil)
        }
        
        //set the status of the card
        card?.isFlipped = false
    }
    
    func remove() {
        //make the card invisible
        backImageView.alpha = 0
        
        //Animate it
        
        UIView.animate(withDuration: 0.3, delay: 1, options: .curveEaseInOut, animations: {
            
            self.frontImageView.alpha = 0
            
        }, completion: nil)
        
    }
    
}

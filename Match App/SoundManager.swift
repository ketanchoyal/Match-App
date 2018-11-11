//
//  SoundManager.swift
//  Match App
//
//  Created by Ketan Choyal on 08/11/18.
//  Copyright © 2018 Ketan Choyal. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        
        //different cases of game to play sound
        
        case flip
        case shuffle
        case match
        case nomatch
        
    }
    
    static func playSound(_ soundeffect:SoundEffect) {
        
        var soundFileName = ""
        
        //Detirmine the sound we want to play and set the appropiate name
        switch soundeffect {
        case .flip:
            soundFileName = "cardflip"
            
        case .match:
            soundFileName = "dingcorrect"
            
        case .nomatch:
            soundFileName = "dingwrong"
        
        case .shuffle:
            soundFileName = "shuffle"
        }
        
        //get the path to the sound file inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Couldn't find the sound file \(soundFileName) in the bundle")
            return
        }
        
        //Create URL object from the bundle path
        let soundURI = URL(fileURLWithPath: bundlePath!)
        
        do {
            //Create the audio player
            audioPlayer = try AVAudioPlayer(contentsOf: soundURI)
            
            //play the sound
            audioPlayer?.play()
        }
        catch {
            
            //Log the error
            print("Couldn't create the audio player object from the sound file : \(soundFileName)")
        }
        
    }
    
}

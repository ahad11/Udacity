//
//  SoundEffectedViewController.swift
//  PitchPerfect
//
//  Created by ahad on 8/2/1440 A.
//  Copyright © 2019 ahad. All rights reserved.
//

import UIKit
import WebKit
import AVFoundation


class SoundEffectedViewController: UIViewController {
     var recordedURL:URL!
    // MARK: Outlets
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    enum ButtonType : Int { case echo = 0 , chipmunk, rabbit , vader , snail , reverb }

    override func viewDidLoad() {
        setupAudio()
     
        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .echo:
            playSound(echo: true)
        case .chipmunk:
            playSound(pitch: 1000)
            
       case .rabbit:
         playSound(rate: 1.5)
            
        case .vader:
            playSound(pitch: -1000)
            
        case .snail:
            playSound(rate: 0.5)
            


        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
        
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
        configureUI(.notPlaying)
  
    }
    
 override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }


}

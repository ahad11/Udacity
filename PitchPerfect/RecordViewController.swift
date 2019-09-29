//
//  ViewController.swift
//  PitchPerfect
//
//  Created by ahad on 8/2/1440 A.
//  Copyright © 2019 ahad. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController , AVAudioRecorderDelegate{
    @IBOutlet weak var recordButton: UIButton!

    @IBOutlet weak var stopButton: UIButton!
    var audioRecorder: AVAudioRecorder!
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.isEnabled = false;
        
      
        // Do any additional setup after loading the view, typically from a nib.
    }
  

    
    
    
    @IBAction func recoredPressed(_ sender: Any) {
        recordButton.isEnabled = false;
        stopButton.isEnabled = true;
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.delegate = self;
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
        
    @IBAction func stopPressed(_ sender: Any) {
        audioRecorder.stop()
        let session = AVAudioSession.sharedInstance()
        try! session.setActive(false)
        recordButton.isEnabled = true;
        stopButton.isEnabled = false
        
    }
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if ( flag){
            performSegue(withIdentifier: "stopRecordingSegue", sender: audioRecorder.url)}
        else {
            print("rcording was not Succssful")
        }
        
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "stopRecordingSegue"){
            let PlayVc = segue.destination as! SoundEffectedViewController
            let recordedURL =  sender as! URL
            PlayVc.recordedURL = recordedURL;
        }
    }
    
        
    
    
}


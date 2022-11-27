//
//  VolumeViewController.swift
//  Artistack
//
//  Created by 임영준 on 2022/07/27.
//

import UIKit



protocol VolumeSliderDelegate {
    func originalSliderChanged(SliderValue : Float)
    func addedSliderChanged(SliderValue : Float)
}


class VolumeViewController: UIViewController {
    
    @IBOutlet weak var voluemPopupView: UIView!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var originalSoundSlider: UISlider!
    @IBOutlet weak var addedSoundSlider: UISlider!
    @IBOutlet weak var completeButton: UIButton!
    
    
    var value1 : Float = 0.2
    var value2 : Float = 0.2
    
    
    var delegate : VolumeSliderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func dissmissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func completeButtonTapped(_ sender: Any) {
        
        MediaPostingViewController.originalVolume = value1
        MediaPostingViewController.addedVolume = value2
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func originalSoundSliderChanged(_ sender: UISlider) {
        
        value1 = originalSoundSlider.value
        RecordingViewController.AudioPlayer.volume = value1
        print(value1)
        
    }
    
    @IBAction func addedSoundSliderChanged(_ sender: Any) {
        value2 = addedSoundSlider.value
        RecordingViewController.playerView?.player.volume = value2
        print(value2)
    }
    
}

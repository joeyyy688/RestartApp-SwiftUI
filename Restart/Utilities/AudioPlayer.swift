//
//  AudioPlayer.swift
//  Restart
//
//  Created by Joseph on 6/18/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playAudio(filename: String, fileType: String){
    if let path = Bundle.main.path(forResource: filename, ofType: fileType){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("Cannot play audio")
        }
    }
}

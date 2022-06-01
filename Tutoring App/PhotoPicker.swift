//
//  PhotoPicker.swift
//  Test
//
//  Created by Aditya Nair on 1/29/22.
//

import Foundation
import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable{
    
    @Binding var pfpImage: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }

    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker){
            self.photoPicker = photoPicker
        }
        
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                photoPicker.pfpImage = image
            } else {
                //USER selectrs wrong type, maybe video or something
            }
            picker.dismiss(animated: true)
        }
    }
    
    
}



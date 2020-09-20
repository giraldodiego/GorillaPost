//
//  CreatePostViewController.swift
//  GorillaPost
//
//  Created by Diego Giraldo Gómez on 20/09/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    
    var delegate: FeedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "0/150"
        messageTextView.becomeFirstResponder()
        messageTextView.delegate = self
    }

    @IBAction func addPhotoAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    @IBAction func shareAction(_ sender: Any) {
        let post = Post(id: 100, firstName: "Diego", lastName: "Giraldo", body: messageTextView.text, date: String(Date().timeIntervalSince1970))
        
        delegate?.addPost(post)
        
        navigationController?.popViewController(animated: true)
    }
}

extension CreatePostViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        
        counterLabel.text = "\(currentText.count + 1)/150"

        return currentText.count + 1 < 150
    }
}

extension CreatePostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Implementation not speficied in Gorilla requirements
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

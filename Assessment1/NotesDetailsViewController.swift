//
//  NotesDetailsViewController.swift
//  Assessment1
//
//  Created by Collin Cannavo on 5/26/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import UIKit

class NotesDetailsViewController: UIViewController, UITextFieldDelegate {

    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: Actions

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let noteTextField = noteTextField.text else { return }
        
        if let note = self.note {
            NoteController.shared.updateNote(note: note, text: noteTextField)
        } else {
            NoteController.shared.addNote(text: noteTextField)
        }
        
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: Functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    func updateViews() {
        guard let note = note, isViewLoaded == true else { return }
        
        noteTextField.text = note.text
        
    }
    
    // MARK: Outlets
   
    @IBOutlet weak var noteTextField: UITextView!

}

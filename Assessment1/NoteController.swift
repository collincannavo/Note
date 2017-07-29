//
//  NoteController.swift
//  Assessment1
//
//  Created by Collin Cannavo on 5/26/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import Foundation

class NoteController {
    
    private let notesKey = "notes"
    static let shared = NoteController()
    var notes: [Note] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: Lifecycle Functions
    
    func updateNote(note: Note, text: String) {
        note.text = text
        saveToPersistentStore()
    }
    
    func removeNote(note: Note) {
        guard let theIndex = notes.index(of: note) else {return}
        notes.remove(at: theIndex)
        saveToPersistentStore()
    }
    
    func addNote(text: String) {
        let note = Note(text: text)
        notes.append(note)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        var notesDictionary: [[String : Any]] = []
        for note in notes {
            
            let dictionary = note.dictionaryRepresentation
            notesDictionary.append(dictionary)
        }
        
        UserDefaults.standard.set(notesDictionary, forKey: notesKey)
    }
    
    func loadFromPersistentStore() {
        if let notesDictionary = UserDefaults.standard.object(forKey: notesKey) as? [[String : Any]] {
            var notes: [Note] = []

            for note in notesDictionary {
                
                if let note = Note(dictionary: note) {
                    notes.append(note)
                }
            }
            self.notes = notes
        }
    }
    
}














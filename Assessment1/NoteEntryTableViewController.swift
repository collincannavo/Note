//
//  NoteEntryTableViewController.swift
//  Assessment1
//
//  Created by Collin Cannavo on 5/26/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import UIKit

class NoteEntryTableViewController: UITableViewController, UISearchBarDelegate {
    
    var tableData = NoteController.shared.notes
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    // MARK: Actions
    
    @IBAction func editButtonTapped(_ sender: Any) {
        self.isEditing = !self.isEditing
    }
    
    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return NoteController.shared.notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteEntryField", for: indexPath)
        
        let note = NoteController.shared.notes[indexPath.row]
        
        cell.textLabel?.text = note.text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let note = NoteController.shared.notes[indexPath.row]
            
            NoteController.shared.removeNote(note: note)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let note = NoteController.shared.notes[fromIndexPath.row]
        
    }
    
    // MARK: - Segue Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editNote" {
            if let noteDetailsVC = segue.destination as? NotesDetailsViewController, let selectedRow = tableView.indexPathForSelectedRow?.row {
                
                let note = NoteController.shared.notes[selectedRow]
                
                noteDetailsVC.note = note
            }
        }
    }
    
    // MARK: Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableViewSearch: UITableView!
    
}








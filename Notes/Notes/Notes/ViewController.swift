//
//  ViewController.swift
//  Notes
//
//  Created by Cristi Cretu on 26.05.2021.
//

import UIKit

class ViewController: UITableViewController {
    var notes: [Note] = []
        
    @IBAction func createNote() {
        let _ = NoteManager.main.create()
        reload()
    }
    
    func reload() {
        notes = NoteManager.main.getNotes()
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].contents
        return cell
    }
}


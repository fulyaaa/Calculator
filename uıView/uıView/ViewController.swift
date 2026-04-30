//
//  ViewController.swift
//  uıView
//
//  Created by fulya akan on 30.04.2026.
//
import Kingfisher
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let letters: [String] = [
        "a",
        "b",
        "c"
        
    ]
    
    private let contactsa: [String] = ["ahmet","ali"]
    private let contactsb: [String] = ["bbb","bb"]
    private let contactsc: [String] = ["ccc","c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.isScrollEnabled = true
        tableView.alwaysBounceVertical = true
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        letters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
            return contactsa.count
        case 1:
            return contactsb.count
        case 2:
            return contactsc.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = .init()
        
        switch indexPath.section {
            case 0 
        }
        
        let tweet: String = tweets[indexPath.row]
        cell.textLabel?.text = tweet
        
        return cell
    }
    
}

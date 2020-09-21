//
//  FeedViewController.swift
//  GorillaPost
//
//  Created by Diego Giraldo Gómez on 20/09/20.
//  Copyright © 2020 Diego Giraldo Gómez. All rights reserved.
//

import UIKit

protocol FeedDelegate {
    func addPost(post: Post, image: UIImage?)
}

class FeedViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var expandConstraint: NSLayoutConstraint!
    
    let viewModel = FeedViewModel()
    
    var expanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBar()
        configureView()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.retrievePosts { [weak self] (status) in
            if status {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    func configureView() {
        dateLabel.text = Date().stringByFormat("EEEE, MMM d").uppercased()
        helloLabel.text = "Hello Gorilla"
    }
    
    func configureBar() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "logo")
        self.navigationItem.titleView = imageView
    }
    
    @IBAction func expandAction(_ sender: Any) {
        expandConstraint.constant = expanded ? 150 : 500
        expanded = !expanded
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "feedToCreatePost" {
            guard let view = segue.destination as? CreatePostViewController else { return }
            view.delegate = self
        }
    }

}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        
        let post = viewModel.posts[indexPath.row]
        
        cell.nameLabel.text = post.fullName
        cell.dateLabel.text = post.formattedDate
        cell.messageLabel.text = post.body
        
        return cell
    }
}

extension FeedViewController: FeedDelegate {
    func addPost(post: Post, image: UIImage?) {
        viewModel.posts.insert(post, at: 0)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        if let image = image {
            self.imageView.image = image
        }
    }
}

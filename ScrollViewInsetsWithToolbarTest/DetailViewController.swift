//
//  DetailViewController.swift
//  ScrollViewInsetsWithToolbarTest
//
//  Created by Andrew Ebling on 13/07/2018.
//  Copyright © 2018 Tenero. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        self.scrollView.contentSize = CGSize(width: 1024, height: 1024)
        self.navigationController?.isToolbarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    @IBAction func hideToolbar(_ sender: Any) {
        self.navigationController?.isToolbarHidden = !(self.navigationController?.isToolbarHidden ?? true)
    }
}


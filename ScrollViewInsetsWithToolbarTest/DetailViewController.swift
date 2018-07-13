//
//  DetailViewController.swift
//  ScrollViewInsetsWithToolbarTest
//
//  Created by Andrew Ebling on 13/07/2018.
//  Copyright © 2018 Tenero. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView = UIScrollView(frame: self.view.bounds)
        self.scrollView.backgroundColor = .blue
        self.view.addSubview(self.scrollView)
        self.scrollView.autoresizingMask = [.flexibleHeight,  .flexibleWidth]
        self.scrollView.contentSize = CGSize(width: 1024, height: 1024)
        self.navigationController?.isToolbarHidden = false
        
        let bbi = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(hideToolbar(_:)))
        self.navigationItem.rightBarButtonItem = bbi
    }

    @IBAction func hideToolbar(_ sender: Any) {
        self.navigationController?.isToolbarHidden = !(self.navigationController?.isToolbarHidden ?? true)
    }
}


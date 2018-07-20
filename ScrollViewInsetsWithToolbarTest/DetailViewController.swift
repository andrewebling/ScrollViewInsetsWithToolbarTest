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
    var textView: UITextView!
    var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.containerView = MyContainerView(frame: self.view.bounds)
        self.containerView.autoresizingMask = [.flexibleHeight,  .flexibleWidth]
        self.view.addSubview(self.containerView)
        self.scrollView = UIScrollView(frame: self.view.bounds)
        self.scrollView.backgroundColor = .blue
        self.containerView.addSubview(self.scrollView)
        self.scrollView.autoresizingMask = [.flexibleHeight,  .flexibleWidth]
        self.scrollView.contentSize = CGSize(width: 1024, height: 1024)
        
        self.textView = UITextView(frame: CGRect(x: 80, y: 80, width: 150, height: 40))
        self.scrollView.addSubview(self.textView)
        
        self.navigationController?.isToolbarHidden = false
        
        let editBBI = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editText(_:)))
        self.navigationItem.rightBarButtonItems = [editBBI]
        
        let toggleButton = UIButton(frame: CGRect(x: 220, y: 80, width: 150, height: 40))
        toggleButton.setTitle("Toggle Bars", for: .normal)
        toggleButton.addTarget(self, action: #selector(hideToolbar(_:)), for: .touchUpInside)
        self.scrollView.addSubview(toggleButton)
    }

    @objc func hideToolbar(_ sender: Any) {
        self.navigationController?.isToolbarHidden = !(self.navigationController?.isToolbarHidden ?? true)
        self.navigationController?.setNavigationBarHidden(!(self.navigationController?.isNavigationBarHidden ?? true), animated: true)
    }
    
    @objc func editText(_ sender: Any) {
        if self.textView.isFirstResponder {
            self.textView.resignFirstResponder()
        } else {
            self.textView.becomeFirstResponder()
        }
    }
}


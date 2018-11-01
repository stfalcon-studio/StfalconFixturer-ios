//
//  UITextFieldExtension.swift
//  StfalconFixturer
//
//  Created by Alex Frankiv on 10/30/18.
//  Copyright © 2018 Alex Frankiv. All rights reserved.
//

import UIKit

extension UITextField {
	
	// MARK: - Public
	public func setFixtureTag(_ tag: FixtureTag) {
		#if DEBUG
		Fixturer.shared.register(self, for: tag)
		let gesture = UITapGestureRecognizer(target: self, action: #selector(showFixtures(_:)))
		gesture.numberOfTapsRequired = 3 // TODO: make available to set from outside
			self.addGestureRecognizer(gesture)
		#endif
	}
	
	// MARK: - Internal
	internal func setFixtureText(_ text: String?) {
		self.text = text
	}
	
	// MARK: - Private
	@objc private func showFixtures(_ sender: UITapGestureRecognizer) {
		parentViewController?.presentFixtures(for: self)
	}
	
	private var parentViewController: UIViewController? {
		var parentResponder: UIResponder? = self
		while parentResponder != nil {
			parentResponder = parentResponder!.next
			if let viewController = parentResponder as? UIViewController {
				return viewController
			}
		}
		return nil
	}
}

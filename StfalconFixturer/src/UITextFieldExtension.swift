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
	@IBInspectable public var fixtureTag: String? {
		set {
			#if DEBUG
			guard let fixtureTag = newValue else { return }
			Fixturer.shared.register(self, for: fixtureTag)
			let gesture = UITapGestureRecognizer(target: self, action: #selector(showFixtures(_:)))
			gesture.numberOfTapsRequired = 3 // TODO: make available to set from outside
			self.addGestureRecognizer(gesture)
			#endif
		}
		get {
			return Fixturer.shared.inputs.object(forKey: self)?.tag
		}
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

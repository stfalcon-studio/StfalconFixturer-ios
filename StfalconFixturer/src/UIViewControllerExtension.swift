//
//  UIViewControllerExtension.swift
//  StfalconFixturer
//
//  Created by Alex Frankiv on 11/1/18.
//  Copyright © 2018 Alex Frankiv. All rights reserved.
//

import UIKit

extension UIViewController {
	
	// MARK: - Internal
	internal func presentFixtures(for view: UITextField) {
		guard let fixtureItem = Fixturer.shared.inputs.object(forKey: view) else { return }
		
		let controller = UIAlertController(title: "Choose fixture", message: nil, preferredStyle: .actionSheet)
		
		for (index, value) in Fixturer.shared.fixtures(for: fixtureItem.tag).enumerated() {
			
			controller.addAction(UIAlertAction(title: value, style: .default, handler: { (_) in
				view.text = value
				Fixturer.shared.inputs.keyEnumerator().forEach({ key in
					guard let key = key as? UIView,
						let value = Fixturer.shared.inputs.object(forKey: key) else { return }
					if key != view && value.group == fixtureItem.group {
						(key as? UITextField)?.text = value.values[index]
					}
				})
			}))
		}
		
		controller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
			controller.dismiss(animated: true, completion: nil)
		}))
		
		self.present(controller, animated: true, completion: nil)
	}
}

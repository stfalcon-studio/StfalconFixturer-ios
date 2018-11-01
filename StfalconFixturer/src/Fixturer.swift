//
//  Fixturer.swift
//  StfalconFixturer
//
//  Created by Alex Frankiv on 10/31/18.
//  Copyright © 2018 Alex Frankiv. All rights reserved.
//

import UIKit

public typealias FixtureTag = String

internal final class FixtureItem: Codable {
	
	var tag: FixtureTag
	var group: String?
	var values: [String]
}

public final class Fixturer {
	
	// MARK: - Private properties
	private (set) var fixtures = [FixtureItem]()
	private (set) var inputs = NSMapTable<UIView, FixtureItem>(keyOptions: .weakMemory, valueOptions: .weakMemory)
	
	// MARK: - Singleton
	public static let shared = Fixturer()
	
	// MARK: - Lifecycle
	private init() {}
	
	// MARK: - Public methods
	public func specify(source: String) {
		if let sourceFile = Bundle.main.path(forResource: source, ofType: "json"),
			let data = try? String(contentsOfFile: sourceFile) {
			fixtures = (try? JSONDecoder().decode([FixtureItem].self, from: Data(data.utf8))) ?? []
		}
	}
	
	// MARK: - Internal methods
	internal func fixtures(for tag: FixtureTag) -> [String] {
		return fixtures.first(where: { $0.tag == tag })?.values ?? []
	}
	
	internal func register(_ view: UIView, for tag: FixtureTag) {
		inputs.setObject(fixtures.first(where: { $0.tag == tag }), forKey: view)
	}
}

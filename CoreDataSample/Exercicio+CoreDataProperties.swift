//
//  Exercicio+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Nelson on 9/1/2017.
//  Copyright © 2017 T@d. All rights reserved.
//

import Foundation
import CoreData


extension Exercicio {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercicio> {
        return NSFetchRequest<Exercicio>(entityName: "Exercicio");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var treino1: Treino?
    @NSManaged public var serie2: NSSet?

}

// MARK: Generated accessors for serie2
extension Exercicio {

    @objc(addSerie2Object:)
    @NSManaged public func addToSerie2(_ value: Serie)

    @objc(removeSerie2Object:)
    @NSManaged public func removeFromSerie2(_ value: Serie)

    @objc(addSerie2:)
    @NSManaged public func addToSerie2(_ values: NSSet)

    @objc(removeSerie2:)
    @NSManaged public func removeFromSerie2(_ values: NSSet)

}

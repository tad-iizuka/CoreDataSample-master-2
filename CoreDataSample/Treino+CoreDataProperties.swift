//
//  Treino+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Nelson on 9/1/2017.
//  Copyright © 2017 T@d. All rights reserved.
//

import Foundation
import CoreData


extension Treino {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Treino> {
        return NSFetchRequest<Treino>(entityName: "Treino");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var exercicio1: NSSet?
    @NSManaged public var serie1: NSSet?

}

// MARK: Generated accessors for exercicio1
extension Treino {

    @objc(addExercicio1Object:)
    @NSManaged public func addToExercicio1(_ value: Exercicio)

    @objc(removeExercicio1Object:)
    @NSManaged public func removeFromExercicio1(_ value: Exercicio)

    @objc(addExercicio1:)
    @NSManaged public func addToExercicio1(_ values: NSSet)

    @objc(removeExercicio1:)
    @NSManaged public func removeFromExercicio1(_ values: NSSet)

}

// MARK: Generated accessors for serie1
extension Treino {

    @objc(addSerie1Object:)
    @NSManaged public func addToSerie1(_ value: Serie)

    @objc(removeSerie1Object:)
    @NSManaged public func removeFromSerie1(_ value: Serie)

    @objc(addSerie1:)
    @NSManaged public func addToSerie1(_ values: NSSet)

    @objc(removeSerie1:)
    @NSManaged public func removeFromSerie1(_ values: NSSet)

}

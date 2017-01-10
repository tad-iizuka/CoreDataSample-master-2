//
//  Treino+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Tadashi on 2017/01/10.
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
    @NSManaged public var exercicio: NSSet?
    @NSManaged public var serie: NSSet?

}

// MARK: Generated accessors for exercicio
extension Treino {

    @objc(addExercicioObject:)
    @NSManaged public func addToExercicio(_ value: Exercicio)

    @objc(removeExercicioObject:)
    @NSManaged public func removeFromExercicio(_ value: Exercicio)

    @objc(addExercicio:)
    @NSManaged public func addToExercicio(_ values: NSSet)

    @objc(removeExercicio:)
    @NSManaged public func removeFromExercicio(_ values: NSSet)

}

// MARK: Generated accessors for serie
extension Treino {

    @objc(addSerieObject:)
    @NSManaged public func addToSerie(_ value: Serie)

    @objc(removeSerieObject:)
    @NSManaged public func removeFromSerie(_ value: Serie)

    @objc(addSerie:)
    @NSManaged public func addToSerie(_ values: NSSet)

    @objc(removeSerie:)
    @NSManaged public func removeFromSerie(_ values: NSSet)

}

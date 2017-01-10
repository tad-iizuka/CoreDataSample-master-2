//
//  Exercicio+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Tadashi on 2017/01/10.
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
    @NSManaged public var serie: NSSet?
    @NSManaged public var treino: Treino?

}

// MARK: Generated accessors for serie
extension Exercicio {

    @objc(addSerieObject:)
    @NSManaged public func addToSerie(_ value: Serie)

    @objc(removeSerieObject:)
    @NSManaged public func removeFromSerie(_ value: Serie)

    @objc(addSerie:)
    @NSManaged public func addToSerie(_ values: NSSet)

    @objc(removeSerie:)
    @NSManaged public func removeFromSerie(_ values: NSSet)

}

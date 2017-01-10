//
//  Serie+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Tadashi on 2017/01/10.
//  Copyright © 2017 T@d. All rights reserved.
//

import Foundation
import CoreData


extension Serie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Serie> {
        return NSFetchRequest<Serie>(entityName: "Serie");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var exercicio: Exercicio?
    @NSManaged public var treino: Treino?

}

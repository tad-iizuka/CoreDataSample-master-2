//
//  Serie+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Nelson on 9/1/2017.
//  Copyright © 2017 T@d. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Serie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Serie> {
        return NSFetchRequest<Serie>(entityName: "Serie");
    }

    @NSManaged public var name: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var exercicio2: Exercicio?
    @NSManaged public var treino2: Treino?

}

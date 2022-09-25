//
//  PostalCodeLocal+CoreDataProperties.swift
//  WTest
//
//  Created by Raphael Alkamim on 24/09/22.
//
//

import Foundation
import CoreData


extension PostalCodeLocal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostalCodeLocal> {
        return NSFetchRequest<PostalCodeLocal>(entityName: "PostalCodeLocal")
    }

    @NSManaged public var postalCode: String?
    @NSManaged public var id: UUID?
    @NSManaged public var localyName: String?

}

extension PostalCodeLocal : Identifiable {

}

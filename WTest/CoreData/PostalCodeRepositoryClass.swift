//
//  PostalCodeRepositoryClass.swift
//  WTest
//
//  Created by Raphael Alkamim on 24/09/22.
//

import Foundation
import CoreData

class PostalCodeRepository: NSManagedObject {
    static let shared: PostalCodeRepository = PostalCodeRepository()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "wTestApp")
        container.loadPersistentStores { _, error in
            if let erro = error {
                preconditionFailure(erro.localizedDescription)
            }
            
        }
        return container
    }()
    

    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Problema de contexto: \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createPostalCode(postalCode: PostalCodeCSV) -> PostalCodeLocal {
        guard let newPostalCode = NSEntityDescription.insertNewObject(forEntityName: "PostalCodeLocal", into: context) as? PostalCodeLocal else { preconditionFailure("somethingWrong")}
        
        newPostalCode.id = UUID()
        
        if postalCode.nome_localidade.count == 0 {
            newPostalCode.localyName = "Empty"
        } else {
            newPostalCode.localyName = postalCode.nome_localidade
        }
        
        if postalCode.num_cod_postal.count == 0 || postalCode.ext_cod_postal.count == 0 {
            newPostalCode.postalCode = "####-###"
        } else {
            newPostalCode.postalCode = "\(postalCode.num_cod_postal)\(postalCode.ext_cod_postal)"
        }
        
        self.saveContext()
        return newPostalCode
    }
    
    func getPostalCode() -> [PostalCodeLocal] {
        let fetchRequest = NSFetchRequest<PostalCodeLocal>(entityName: "PostalCodeLocal")
        do {
            return try self.persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
        }
        return []
    }
    
    func fetchPostalCode(with searchText: String) -> [PostalCodeLocal] {
        let fetchRequest: NSFetchRequest<PostalCodeLocal> = PostalCodeLocal.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "postalCode CONTAINS[cd] %@ || localyName CONTAINS[cd] %@", searchText, searchText)
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch _ {
            print("nothing found")
        }
        return []
    }
    
}


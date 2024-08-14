//
//  PublicationsViewModel.swift
//  App754
//
//  Created by IGOR on 06/08/2024.
//

import SwiftUI
import CoreData

final class PublicationsViewModel: ObservableObject {
    
    @AppStorage("views") var views: Int = 0
    @Published var addView = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddCategory: Bool = false
    
    @Published var savedCart: [String] = []

    @Published var cartoons: [String] = ["FaceLook", "Linked", "MyblAze"]
    @Published var currentCart = ""
    @Published var currentCartPhoto = ""
    @Published var currentCartForFilter = ""

    @Published var hisCart = ""
    @Published var hisCartPhoto = ""
    @Published var hisName: String = ""
    @Published var hisDate = ""
    @Published var hisDescr = ""
    @Published var hisLikes = ""
    @Published var hisViews = ""
    @Published var hisComments = ""
    
    @Published var histories: [HistoryModel] = []
    @Published var selectedHistory: HistoryModel?

    func addHistory() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "HistoryModel", into: context) as! HistoryModel

        loan.hisCart = hisCart
        loan.hisName = hisName
        loan.hisDate = hisDate
        loan.hisDescr = hisDescr
        loan.hisLikes = hisLikes
        loan.hisViews = hisViews
        loan.hisComments = hisComments
        loan.hisCartPhoto = hisCartPhoto

        CoreDataStack.shared.saveContext()
    }

    func fetchHistorys() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HistoryModel>(entityName: "HistoryModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.histories = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.histories = []
        }
    }
    
    @Published var catPhoto = ""
    @Published var catName: String = ""
    
    @Published var categories: [CatModel] = []
    @Published var selectedCategory: CatModel?

    func addCategory() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CatModel", into: context) as! CatModel

        loan.catPhoto = catPhoto
        loan.catName = catName

        CoreDataStack.shared.saveContext()
    }

    func fetchHCategories() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CatModel>(entityName: "CatModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.categories = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.categories = []
        }
    }
}

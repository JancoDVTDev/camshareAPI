import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "camSHARE API"
    }
    
    //TipsAndTricks
    router.get("tipsandtricks") { request -> [String: [TipsAndTricksModel]] in
        var repo = TipsAndTricksRepo()
        let tipsAndTricksContent = repo.populateDictionaries()
        return ["tips": tipsAndTricksContent]
    }
    
    router.post(NewRating.self, at: "rating") { _, newRating -> Ratings in
        let ratingID = newRating.ratingID
        let rating = newRating.rating
        
        let ratings = updateRatings(currentRatingID: ratingID, newRating: rating)
        let ratingsFormatted: [String: [RatingsModel]] = ["ratings": ratings!.ratings]
        saveDataToFile(ratings: ratingsFormatted)
        
        return ratings!
    }
    
    func updateRatings(currentRatingID: Int, newRating: Int) -> Ratings? {
        let ratings = getAllRatings()

        var veryBadNumberOfRatings: Int
        var badNumberOfRatings: Int
        var okayNumberOfRatings: Int
        var goodNumberOfRatings: Int
        var veryGoodNumberOfRatings: Int
        var overallRating: Int
        
        var newRatings: Ratings = Ratings(ratings: [])
        
        if let ratings = ratings {
            for rating in ratings.ratings {
                if rating.ratingID == currentRatingID {
                    veryBadNumberOfRatings = rating.veryBadNumberOfRatings
                    badNumberOfRatings = rating.badNumberOfRatings
                    okayNumberOfRatings = rating.okayNumberOfRatings
                    goodNumberOfRatings = rating.goodNumberOfRatings
                    veryGoodNumberOfRatings = rating.veryGoodNumberOfRatings

                    switch newRating {
                    case 1:
                        veryBadNumberOfRatings += 1
                    case 2:
                        badNumberOfRatings += 1
                    case 3:
                        okayNumberOfRatings += 1
                    case 4:
                        goodNumberOfRatings += 1
                    default:
                        veryGoodNumberOfRatings += 1
                    }
                    
                    let ratingNumbers = [veryBadNumberOfRatings, badNumberOfRatings, okayNumberOfRatings, goodNumberOfRatings, veryGoodNumberOfRatings]
                    let highest = ratingNumbers.max()
                    let highestIndex = ratingNumbers.index(of: highest!)
                    overallRating = highestIndex! + 1
                    let newRatingModel = RatingsModel(ratingID: currentRatingID, lastRating: newRating, veryBadNumberOfRatings: veryBadNumberOfRatings, badNumberOfRatings: badNumberOfRatings, okayNumberOfRatings: okayNumberOfRatings, goodNumberOfRatings: goodNumberOfRatings, veryGoodNumberOfRatings: veryGoodNumberOfRatings, overallRating: overallRating)
                    newRatings.ratings.append(newRatingModel)
                } else {
                    newRatings.ratings.append(rating)
                }
            }
        }
        print(newRatings.ratings)
        return newRatings
    }
    
    func getAllRatings() -> Ratings? {
        var ratings: Ratings = Ratings(ratings: [])
        let directory = DirectoryConfig.detect()
        let destinationDirectory = "Sources/App/Models"
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: directory.workDir)
                .appendingPathComponent(destinationDirectory, isDirectory: true)
                .appendingPathComponent("Ratings.json", isDirectory: false))
            let allRatings = try JSONDecoder().decode(Ratings.self, from: data)
            ratings = allRatings
        } catch {
            return nil
        }
        return ratings
    }
    
    func saveDataToFile(ratings: [String: [RatingsModel]]) {
        let directory = DirectoryConfig.detect()
        let destinationDirectory = "Sources/App/Models"
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(ratings) {
            do {
                let filePath = URL(fileURLWithPath: directory.workDir)
                    .appendingPathComponent(destinationDirectory, isDirectory: true)
                    .appendingPathComponent("Ratings.json", isDirectory: false)
                try jsonData.write(to: filePath)
            } catch {
                print(error)
            }
        }
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}

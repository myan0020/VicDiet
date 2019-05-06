import UIKit
//import Firebase

class PlanResultView: UIView, UITableViewDelegate, UITableViewDataSource{
    
    var homePageController: HomePageController?
    var mealPlanResultController: MealPlanResultController?
    var mealPlanArray = [FoodObject]()

    
    let cellId = "cellId"
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: frame.height*0.6).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return mealPlanArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: cellId)
        let name = mealPlanArray[indexPath.row].name
        let detail = mealPlanArray[indexPath.row].surveyFlag
        cell.textLabel!.text = name
        cell.detailTextLabel?.text = detail
        
        return cell
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let oldNavigationController = self.substituteForthController?.navigationController
//        let substituteFifthController = SubstituteFifthController()
//        substituteFifthController.homePageController = self.homePageController
//        if isSearching{
//            substituteFifthController.selectedOldFoodObject = self.selectedOldFoodObject
//            substituteFifthController.selectedNewFoodObject = filteredFoodDatabaseArray[indexPath.row]
//            substituteFifthController.selectedNewFoodObject?.setWithMultipler(multipler: newFoodQuantity)
//        }else{
//            substituteFifthController.selectedOldFoodObject = self.selectedOldFoodObject
//            substituteFifthController.selectedNewFoodObject = foodDatabaseArray[indexPath.row]
//            substituteFifthController.selectedNewFoodObject?.setWithMultipler(multipler: newFoodQuantity)
//
//        }
//        oldNavigationController?.pushViewController(substituteFifthController, animated: true)
        
        
    }
    
}

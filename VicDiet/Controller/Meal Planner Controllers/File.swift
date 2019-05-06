import UIKit
//import Firebase

class PlanResultView: UIView, UITableViewDelegate, UITableViewDataSource{
    
    var homePageController: HomePageController?
    var substituteForthController: SubstituteForthController?
    var selectedOldFoodObject: FoodObject?
    var fixedDimensionalArrayJoinedNew = [FoodObject]()
    var filteredFixedDimensionalArrayJoinedNew = [FoodObject]()
    var isSearching: Bool = false
    let cellId = "cellId"
    
    var newFoodQuantity: Double = 0
    
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
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            //
            //            if (!filteredFixedDimensionalArray[section].isExpanded){
            //                return 0
            //            }
            return filteredFixedDimensionalArrayJoinedNew.count
            
        }
        //
        //        if (!nonActiveFixedDimensionalArray[section].isExpanded){
        //            return 0
        //        }
        return fixedDimensionalArrayJoinedNew.count
        //return nonActiveFixedDimensionalArray[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as UITableViewCell
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: cellId)
        if isSearching{
            let name = filteredFixedDimensionalArrayJoinedNew[indexPath.row].name
            let detail = filteredFixedDimensionalArrayJoinedNew[indexPath.row].surveyFlag
            cell.textLabel!.text = name
            cell.detailTextLabel?.text = detail
            
        }else{
            let name = fixedDimensionalArrayJoinedNew[indexPath.row].name
            let detail = fixedDimensionalArrayJoinedNew[indexPath.row].surveyFlag
            cell.textLabel!.text = name
            cell.detailTextLabel?.text = detail
        }
        
        return cell
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearching{
            
            return 1
        }else{
            
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let oldNavigationController = self.substituteForthController?.navigationController
        let substituteFifthController = SubstituteFifthController()
        substituteFifthController.homePageController = self.homePageController
        if isSearching{
            substituteFifthController.selectedOldFoodObject = self.selectedOldFoodObject
            substituteFifthController.selectedNewFoodObject = filteredFixedDimensionalArrayJoinedNew[indexPath.row]
            substituteFifthController.selectedNewFoodObject?.setWithMultipler(multipler: newFoodQuantity)
        }else{
            substituteFifthController.selectedOldFoodObject = self.selectedOldFoodObject
            substituteFifthController.selectedNewFoodObject = fixedDimensionalArrayJoinedNew[indexPath.row]
            substituteFifthController.selectedNewFoodObject?.setWithMultipler(multipler: newFoodQuantity)
            
        }
        oldNavigationController?.pushViewController(substituteFifthController, animated: true)
        
        
    }
    
}

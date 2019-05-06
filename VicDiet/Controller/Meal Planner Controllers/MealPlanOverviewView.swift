import UIKit
import Charts

class MealPlanOverviewView: UIView, UITableViewDelegate, UITableViewDataSource{
    
    var homePageController: HomePageController?
    var mealPlanResultController: MealPlanResultController?
    
    let overviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "Meal Plan Overview"
        label.font =  UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var overviewChart : PieChartView = {
        let oc = PieChartView()
        oc.rotationEnabled = false
        oc.legend.enabled = false
        oc.chartDescription?.enabled = false
        return oc
        
    }()
    var proteinDataEntry = PieChartDataEntry(value: 0)
    var calciumDataEntry = PieChartDataEntry(value: 0)
    var fatDataEntry = PieChartDataEntry(value: 0)
    var sodiumDataEntry = PieChartDataEntry(value: 0)
    var CDataEntry = PieChartDataEntry(value: 0)
    var ADataEntry = PieChartDataEntry(value: 0)
    var pieChartDataEntryArray = [PieChartDataEntry]()
    
    let nutrientOverviewProtein: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nProtein", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewCalcium: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nCalcium", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewFat: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nFat", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewSodium: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nSodium", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewVitaminC: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nVitaminC", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewVitaminA: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nVitaminA", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    lazy var tableView0: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
        
    }()
    lazy var tableView1: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        tableView0.register(UITableViewCell.self, forCellReuseIdentifier: "cellId00")
        tableView0.register(UITableViewCell.self, forCellReuseIdentifier: "cellId01")
        tableView0.register(UITableViewCell.self, forCellReuseIdentifier: "cellId02")
        self.tableView0.separatorStyle = UITableViewCell.SeparatorStyle.none

        
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cellId10")
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cellId11")
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cellId12")
        self.tableView1.separatorStyle = UITableViewCell.SeparatorStyle.none

        setupViews()
        
        setupData(protein: 20, calcium: 40, fat: 60, sodium: 30, vitaminC: 30, vitaminA: 40)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(protein: Double,calcium: Double, fat: Double, sodium: Double, vitaminC:Double, vitaminA: Double){
        setupPieChartData(protein: protein, calcium: calcium, fat: fat, sodium: sodium, vitaminC: vitaminC, vitaminA: vitaminA)
        setupBothSidesData(protein: protein, calcium: calcium, fat: fat, sodium: sodium, vitaminC: vitaminC, vitaminA: vitaminA)
    }
    
    func setupBothSidesData(protein: Double,calcium: Double, fat: Double, sodium: Double, vitaminC:Double, vitaminA: Double){
        let physicalAttributedText0 = NSMutableAttributedString(string: "\(String(format: "%.1f", protein))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText0.append(NSMutableAttributedString(string: "\nProtein", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewProtein.attributedText = physicalAttributedText0
        
        let physicalAttributedText1 = NSMutableAttributedString(string: "\(String(format: "%.1f", calcium))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText1.append(NSMutableAttributedString(string: "\nCalcium", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewCalcium.attributedText = physicalAttributedText1
        
        let physicalAttributedText2 = NSMutableAttributedString(string: "\(String(format: "%.1f", fat))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText2.append(NSMutableAttributedString(string: "\nFat", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewFat.attributedText = physicalAttributedText2
        
        let physicalAttributedText3 = NSMutableAttributedString(string: "\(String(format: "%.1f", sodium))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText3.append(NSMutableAttributedString(string: "\nSodium", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewSodium.attributedText = physicalAttributedText3
        
        let physicalAttributedText4 = NSMutableAttributedString(string: "\(String(format: "%.1f", vitaminC))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText4.append(NSMutableAttributedString(string: "\nVitaminC", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewVitaminC.attributedText = physicalAttributedText4
        
        let physicalAttributedText5 = NSMutableAttributedString(string: "\(String(format: "%.1f", vitaminA))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        physicalAttributedText5.append(NSMutableAttributedString(string: "\nVitaminA", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        nutrientOverviewVitaminA.attributedText = physicalAttributedText5
        
     
    }
    
    func setupPieChartData(protein: Double,calcium: Double, fat: Double, sodium: Double, vitaminC:Double, vitaminA: Double){
        
        proteinDataEntry.value = protein
        proteinDataEntry.label = "Pro"
        calciumDataEntry.value = calcium
        calciumDataEntry.label = "Ca"
        fatDataEntry.value = fat
        fatDataEntry.label = "Fat"
        sodiumDataEntry.value = sodium
        sodiumDataEntry.label = "Sodium"
        CDataEntry.value = vitaminC
        CDataEntry.label = "Vc"
        ADataEntry.value = vitaminA
        ADataEntry.label = "Va"
        pieChartDataEntryArray = [proteinDataEntry,calciumDataEntry,fatDataEntry,sodiumDataEntry,CDataEntry,ADataEntry]
        
        let chartDataSet = PieChartDataSet(values: pieChartDataEntryArray, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor.orange,UIColor.brown,UIColor.blue,UIColor.red,UIColor.green,UIColor.gray]
        chartDataSet.colors = colors as! [NSUIColor]
        overviewChart.data = chartData
        chartDataSet.selectionShift = 0
        chartData.setDrawValues(false)
    }
    
    
    func setupViews(){
        addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        overviewLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        overviewLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        overviewLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        
        addSubview(tableView0)
        tableView0.translatesAutoresizingMaskIntoConstraints = false
        tableView0.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        tableView0.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView0.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.21).isActive = true
        tableView0.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(tableView1)
        tableView1.translatesAutoresizingMaskIntoConstraints = false
        tableView1.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        tableView1.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView1.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.21).isActive = true
        tableView1.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(overviewChart)
        overviewChart.translatesAutoresizingMaskIntoConstraints = false
        overviewChart.leadingAnchor.constraint(equalTo: tableView0.trailingAnchor).isActive = true
        overviewChart.trailingAnchor.constraint(equalTo: tableView1.leadingAnchor).isActive = true
        overviewChart.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        overviewChart.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView0{
            return 3
        }else{
            return 3
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView0{
            if indexPath.row == 0{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId00")
                
                cell.addSubview(nutrientOverviewProtein)
                nutrientOverviewProtein.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewProtein.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewProtein.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewProtein.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewProtein.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            if indexPath.row == 1{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId01")
                
                cell.addSubview(nutrientOverviewCalcium)
                nutrientOverviewCalcium.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewCalcium.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewCalcium.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewCalcium.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewCalcium.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }else{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId02")
                
                cell.addSubview(nutrientOverviewFat)
                nutrientOverviewFat.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewFat.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewFat.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewFat.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewFat.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            
        }else{
            if indexPath.row == 0{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId10")
                
                cell.addSubview(nutrientOverviewSodium)
                nutrientOverviewSodium.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewSodium.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewSodium.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewSodium.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewSodium.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            if indexPath.row == 1{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId11")
                
                cell.addSubview(nutrientOverviewVitaminC)
                nutrientOverviewVitaminC.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewVitaminC.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminC.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminC.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewVitaminC.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }else{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId12")
                
                cell.addSubview(nutrientOverviewVitaminA)
                nutrientOverviewVitaminA.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewVitaminA.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminA.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminA.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewVitaminA.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tableView0{
            return 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tableView0{
            return tableView.frame.height/3
        }else{
            return tableView.frame.height/3
        }
    }
    
}
extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

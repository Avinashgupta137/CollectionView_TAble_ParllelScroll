//
//  ViewController.swift
//  OpenBrewery
//
//  Created by IPS-149 on 06/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var collectionViw: UICollectionView!
    
    //MARK: - Variable
    
    var dublicateArr = [[String : Any]]()
    var arrWithAll : [String] = ["All"]
    var breweries: [[String: Any]] = []
    var filteredBreweries = [Brewery]()
    var selectedType: String?
    
    var tableViewActive = false
    var collectionViewActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCall()
    }
    // MARK: - APICAlling
    func apiCall(){
        
        // Set the API endpoint URL
        let apiUrl = "https://brianiswu-open-brewery-db-v1.p.rapidapi.com/breweries"
        
        // Create a URL object from the API endpoint string
        guard let url = URL(string: apiUrl) else {
            print("Error: Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        
        request.addValue("brianiswu-open-brewery-db-v1.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.addValue("d012ec6de3msh91d56bdb53bc0f1p12eb4ejsna6ace4e03078", forHTTPHeaderField: "x-rapidapi-key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Error: Invalid HTTP response")
                      return
                  }
            guard let jsonData = data,
                  let breweries = try? JSONSerialization.jsonObject(with: jsonData) as? [[String: Any]]
            else {
                print("Error: Invalid JSON data")
                return
            }
            
            self.dublicateArr = breweries
            
            self.breweries = breweries
            let arrWithoutAll = Array(Set(breweries.compactMap { $0["brewery_type"] as? String })).sorted()
            self.arrWithAll += arrWithoutAll
            
            print(self.arrWithAll)
            DispatchQueue.main.async {
                self.collectionViw.reloadData()
                // TODO: Update the UI with the list of breweries
                //                for brewery in breweries {
                //                    if let name = brewery["name"] as? String, let type = brewery["brewery_type"] as? String {
                //                        print("Name: \(name), Type: \(type)")
                //                    }
                //                }
                
            }
        }.resume()
    }
    func getNamesForType(_ type: String) -> [String] {
        return breweries.filter { $0["brewery_type"] as? String == type }
        .compactMap { $0["name"] as? String }
        .sorted()
    }
}

// MARK: - CollectionView
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrWithAll.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCollection", for: indexPath) as! CollectionViewCell
        cell.lblCol.text = arrWithAll[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dublicateArr.removeAll()
        if arrWithAll[indexPath.row] == "All" {
            self.dublicateArr = self.breweries
        }else{
            for (i,item) in breweries.enumerated() {
                if arrWithAll[indexPath.row] == breweries[i]["brewery_type"] as! String {
                    dublicateArr.append(item)
                }
            }
            print(breweries)
        }
        var selectedType = arrWithAll[indexPath.item]
        self.selectedType = selectedType
        tblView.reloadData()
        
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        if let index = arrWithAll.firstIndex(of: selectedType) {
            let indexPath = IndexPath(row: 0, section: index)
            tblView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
        tblView.reloadData()
    }
}
//MARK: - TableView
extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return breweries.count
        } else  {
            let type = arrWithAll[section]
            return getNamesForType(type).count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let section = indexPath.section
        if section == 0 {
            cell.textLabel?.text = breweries[indexPath.row]["name"] as? String
        } else  {
            let type = arrWithAll[section]
            let names = getNamesForType(type)
            cell.textLabel?.text = names[indexPath.row]
            print(names[indexPath.row])
        }
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrWithAll.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrWithAll[section]
    }
}

// MARK: - ScrollView
extension ViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView === self.tblView{
            if
                let topSectionIndex = self.tblView.indexPathsForVisibleRows?.map({ $0.section }).sorted().first,
                let selectedCollectionIndex = self.collectionViw.indexPathsForSelectedItems?.first?.row,
                selectedCollectionIndex != topSectionIndex {
                let indexPath = IndexPath(item: topSectionIndex, section: 0)
                self.collectionViw.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            }
         }
    }
    }




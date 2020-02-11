//
//  TableViewController.swift
//  BarDoZe
//
//  Created by Jonathan on 07/02/20.
//  Copyright © 2020 hbsis. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    //MARK: Properties
    //MARK: Propriedades
    var bar = [Bar]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load The Sample Data
        //Carregar Os Dados
        loadSampleBar()
    }
    
    
    //MARK: Private Methods
    //MARK: Metodos Privados
    private func loadSampleBar() {
        
        let foto1 = UIImage (named: "doge1")
        let foto2 = UIImage (named: "doge2")
        let foto3 = UIImage (named: "doge3")
        
    
        guard let doge1 = Bar(nome: "Doge Rwall", foto: foto1, telefone: nil, celular: nil, rua: nil, complemento: nil, numero: nil, rating: 5) else {
    fatalError("Incapaz de Instaciar doge1")
    }
        
        guard let doge2 = Bar(nome: "Doge Pão", foto: foto2, telefone: nil, celular: nil, rua: nil, complemento: nil, numero: nil, rating: 3) else {
            fatalError("Incapaz de Instaciar doge2")
    }
        
        guard let doge3 = Bar(nome: "Doge Fofo", foto: foto3, telefone: nil, celular: nil, rua: nil, complemento: nil, numero: nil, rating: 4) else {
            fatalError("Incapaz de Instaciar doge3")
    }
        
        bar += [doge1, doge2, doge3]
    
}
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return bar.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Table View Cells Are Reused And Should Be Dequeued Using a Cell Identifier
        
        let cellIdentifier = "TableViewCell"
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for:indexPath) as? TableViewCell else {
                fatalError("The Dequeued Cell Is Not An Instance Of TableViewCell")
        }
        
        //Fetches The Appropriate Bar For The Data Source Layout
        //
        
        let Bar = bar[indexPath.row]
        
        
        cell.nomeBar.text = Bar.nome
        cell.imgBar.image = Bar.foto
        cell.ratingControl.rating = Bar.rating
        
        return cell
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

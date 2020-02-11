//
//  ViewController.swift
//  BarDoZé
//
//  Created by Jonathan on 29/01/20.
//  Copyright © 2020 hbsis. All rights reserved.
//
import os.log
import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var txComplemento: UITextField!
    @IBOutlet weak var txNRua: UITextField!
    @IBOutlet weak var txRua: UITextField!
    @IBOutlet weak var txCelular: UITextField!
    @IBOutlet weak var txTelefone: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var txNome: UITextField!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveBtt: UINavigationItem!
    
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    
    @IBAction func changeimg(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func addImageButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let pickedImage = info[.originalImage] as? UIImage {
            image.contentMode = .scaleAspectFill
            image.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
        txRua.delegate = self
        txNRua.delegate = self
        txComplemento.delegate = self
        txCelular.delegate = self
        txTelefone.delegate = self
        txNome.delegate = self
        RatingControl.delegate = self
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var nome : String!
        
        switch textField {
        case txNome:
            nome = "Nome"
            break
        case txRua:
            nome = "Nome 2"
            break
        default:
            nome = "Outro Nome"

        }
        if(textField == txNome) {
            nome = "Bares: "
            
        }
        let message = nome + textField.text!
        print(message)
        
        return true
    }
    
    @IBAction func bttSave(_ sender: Any) {
        print(ratingControl!, txRua.text!, txNRua.text!, txComplemento.text!, txNome.text!, txCelular.text!, txTelefone.text!)

    }
    //MARK: Navigation
    //MARK: Navegação
    
    //This Method Lets You Configure a View Controller Before It's Presented
    //Este Método Permite Configurar Um Controlador De Exibição Antes De Ser Apresentado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        //Configure The Destination View Controller Only When The Save Button Is Pressed
        //Configura o Controlador De Exibição De Destino Apenas Quando o Botão Salvar For Pressionado
        guard let button = sender as? UIBarButtonItem, button === saveBtt else {
            os_log("O Botão Salvar Não Foi Pressionado, Cancelando...", log: OSLog.default, type:
                .debug)
            
            return
        }
        

        let nome = txNome.text ?? ""
        let foto = image.image
        let rating = ratingControl.rating
        
        //Set The Bar To Be Passed To TableViewController After The Unwind Segue
        //Defina o Bar a Ser Passado Para TableViewController Após o Unwind Segue
        bar = Bar(nome: nil, foto: nil, telefone: nil, celular: nil, rua: nil, complemento: nil, numero: nil, rating: nil)

    }
}

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
    @IBOutlet weak var txNumero: UITextField!
    @IBOutlet weak var txRua: UITextField!
    @IBOutlet weak var txCelular: UITextField!
    @IBOutlet weak var txTelefone: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var txNome: UITextField!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var barTitle: UINavigationItem!
    @IBOutlet weak var bttSalvar: UIBarButtonItem!
    
    var bar: Bar?
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Handle The Text Field's User Input Through Delegate Callbacks
        //Manipula a Entrada Do Usuário Do Campo De Texto Por Meio De Retornos De Chamada Delegados
        txNome.delegate = self
        
        //Set Up View If Editing An Existing Bar
        //Configura View Se Estiver Editando Um Bar Existente
        if let bar = bar {
            navigationItem.title = bar.nome
            txNome.text = bar.nome
            image.image = bar.foto
            txNumero.text = String(bar.numero)
            txRua.text = bar.rua
            txComplemento.text = bar.complemento
            txTelefone.text = String(bar.telefone)
            txCelular.text = String(bar.celular)
            ratingControl.rating = bar.rating
        }
        
        //Enable The Save Button Only If The Text Field Has a Valid Bar Name
        //Ativa o Botão Salvar Apenas Se o Campo De Texto Tiver Um Nome De Bar Válido
        updatebttSalvarState()
        
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
    private func updatebttSalvarState() {
        //Disable The Save Button If The Text Field Is Empty
        //Desabilita o Botão Salvar Se o Campo De Texto Estiver Vazio
        let text = txNome.text ?? ""
        bttSalvar.isEnabled = text.isEmpty
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            updatebttSalvarState()
            
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Disable The Save Button While Editing
        //Desativa o Botão Salvar Durante a Edição
        bttSalvar.isEnabled = false
        
    }
   
    }
    
    //MARK: Private Methods
    //MARK: Métodos Privados
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
        txNumero.delegate = self
        txComplemento.delegate = self
        txCelular.delegate = self
        txTelefone.delegate = self
        txNome.delegate = self

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
        print(ratingControl!, txRua.text!, txNumero.text!, txComplemento.text!, txNome.text!, txCelular.text!, txTelefone.text!)

    }
    //MARK: Navigation
    //MARK: Navegação
    @IBAction func bttCancelar(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //This Method Lets You Configure a View Controller Before It's Presented
    //Este Método Permite Configurar Um Controlador De Exibição Antes De Ser Apresentado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        //Configure The Destination View Controller Only When The Save Button Is Pressed
        //Configura o Controlador De Exibição De Destino Apenas Quando o Botão Salvar For Pressionado
        guard let button = sender as? UIBarButtonItem, button === bttSalvar else {
            os_log("O Botão Salvar Não Foi Pressionado, Cancelando...", log: OSLog.default, type:
                .debug)
            
            return
        }
        
        let nome = txNome.text
        let foto = image.image
        let rating = ratingControl.rating
        let telefone = txTelefone.text
        let celular = txCelular.text
        let rua = txRua.text
        let complemento = txComplemento.text
        let numero = txNumero.text
        
        
        //Set The Bar To Be Passed To TableViewController After The Unwind Segue
        //Defina o Bar a Ser Passado Para TableViewController Após o Unwind Segue
        bar = Bar(nome: txNome.text, foto: image.image, telefone: txTelefone.index(ofAccessibilityElement: (Any).self), celular: txCelular.index(ofAccessibilityElement: (Any).self), rua: txRua.text, complemento: txComplemento.text, numero: txNumero.index(ofAccessibilityElement: (Any).self), rating: ratingControl.rating)

    }
}

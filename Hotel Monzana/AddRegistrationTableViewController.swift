//
//  AddRegistrationTableViewController.swift
//  Hotel Monzana
//
//  Created by Bertran on 18.10.2018.
//  Copyright © 2018 Bertran. All rights reserved.
//

import UIKit

var choosenRoomTypeID: Int? = nil


class AddRegistrationTableViewController: UITableViewController
{

    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    
    @IBOutlet weak var emailTF: UITextField!
    
    
    @IBOutlet weak var checkinDateL: UILabel!
    
    @IBOutlet weak var checkInDP: UIDatePicker!
    
    @IBOutlet weak var checkOutDL: UILabel!
    
    @IBOutlet weak var checkOutDP: UIDatePicker!
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckIndatePickerShown : Bool = false {
        didSet {
            checkInDP.isHidden = !isCheckIndatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown : Bool = false {
        didSet {
            checkOutDP.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    
    @IBOutlet weak var adultLabel: UILabel!
    
    @IBOutlet weak var childLabel: UILabel!
    
    // данные, которые будут записаны в новых объект типа Registration
    
    var adults: Int = 0
    var childs: Int = 0
    var wifion: Bool = false
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDP.minimumDate = midnightToday
        checkInDP.date = midnightToday
        updateDateViews()
        
        

    }
 
    func updateDateViews()
    {
        checkOutDP.minimumDate = checkInDP.date.addingTimeInterval(60 * 60 * 24)
        
        let dateFormatte = DateFormatter()
        dateFormatte.dateStyle = .medium
        
        checkinDateL.text = dateFormatte.string(from: checkInDP.date)
        checkOutDL.text = dateFormatte.string(from: checkOutDP.date)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch indexPath {
        case checkInDatePickerCellIndexPath:
            if isCheckIndatePickerShown {
               return 216
            } else {
                return 0
            }
        case checkOutDatePickerCellIndexPath:
            if isCheckOutDatePickerShown {
                return 216
            } else {
                return 0
            }
        default: return 44
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
            
        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row-1):
         
            // вариант 1 - мой. Появление и скрытие нажатием на одну и ту же строчку с датой
             //  isCheckIndatePickerShown = !isCheckIndatePickerShown
            
            // вариант 2 - лекторский - посменное переключение. Открыта только одна строка с датой
            if  isCheckIndatePickerShown {
                isCheckIndatePickerShown = false
            } else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckIndatePickerShown = true
            } else {
                isCheckIndatePickerShown = true
            }
            
        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row-1):
      //   isCheckOutDatePickerShown = !isCheckOutDatePickerShown
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            } else if isCheckIndatePickerShown {
                isCheckIndatePickerShown = false
                isCheckOutDatePickerShown = true
            } else {
                isCheckOutDatePickerShown = true
            }
            
            
            
        default:
            isCheckIndatePickerShown = false
            isCheckOutDatePickerShown = false
           
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    @IBAction func doneBBTapped(_ sender: UIBarButtonItem)
    {
        let firstName = firstNameTF.text ?? ""
        let lastName = lastNameTF.text ?? ""
        let email = emailTF.text ?? ""
        let checkInDate = checkInDP.date
        let checkoutDate = checkOutDP.date
        
        
        
        print(#function)
        print("FN \(firstName)")
        print("LN \(lastName)")
        print("check in: \(checkInDate)")
        print("check out: \(checkoutDate)")
        print("Взрослых \(adults)")
        print("Детей \(childs)")
        print(wifion ? "Wifi включен" : "Без Wifi")
        if let room = choosenRoomTypeID {
            print("Комната класса \(rooms[room].name)")
        } else { print("Тип комнаты не выбран") }
        
    }
    
    
    
    @IBAction func datepickerChange(_ sender: UIDatePicker)
    {
        
        updateDateViews()
    }
    
    
    @IBAction func AdultStepperTapped(_ sender: UIStepper) {
        adults = Int(sender.value)
        adultLabel.text = "\(adults)"
        
    }
    
    @IBAction func childStepperTapped(_ sender: UIStepper) {
        childs = Int(sender.value)
        childLabel.text = "\(childs)"
        
    }
    
    
    @IBAction func wifiStich(_ sender: UISwitch) {
        wifion = sender.isOn
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let RT = choosenRoomTypeID {
            roomTypeLabel.text = "\(rooms[RT].name)"
        }
    }
}

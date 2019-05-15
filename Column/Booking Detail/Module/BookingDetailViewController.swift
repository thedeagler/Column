//
//  BookingDetailViewController.swift
//  Column
//
//  Created by Stephen Wu on 5/14/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

class BookingDetailViewController: UIViewController {
    private let interactor: BookingDetailInteractor

    private var phoneNumber: InternationalPhoneNumber?

    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeIcon: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var loadingView: UIView!

    init(interactor: BookingDetailInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        interactor.getInitialData()

        headerContainer.layer.masksToBounds = false
        headerContainer.layer.shadowColor = UIColor.lightGray.cgColor
        headerContainer.layer.shadowOpacity = 0.5
        headerContainer.layer.shadowOffset = .zero
        headerContainer.layer.shadowRadius = 1

        callButton.layer.masksToBounds = true
        callButton.layer.cornerRadius = 6
    }

    @IBAction func didTapCall(_ sender: UIButton) {
        phoneNumber?.initiateCall()
    }

    @IBAction func didTapClose(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    func show(place: BookingDetailViewModel) {
        titleLabel.attributedText = place.title
        placeIcon.image = place.placeIcon
        placeLabel.attributedText = place.placeName
        phoneLabel.attributedText = place.formattedPhoneNumber
        addressLabel.attributedText = place.formattedAddress
        phoneNumber = place.internationalPhoneNumber
        callButton.isHidden = (phoneNumber == nil)

        UIView.animate(withDuration: 0.25, animations: {
            self.loadingView.alpha = 0
        }) { _ in
            self.loadingView.removeFromSuperview()
        }
    }

    func show(alert: UIAlertController) {
        let ok = UIAlertAction(title: "Okie Dokie", style: .default) { [weak self] _ in
            self?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}

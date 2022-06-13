//
//  DetailViewCoordinator.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/12/22.
//

import UIKit

class DetailViewCoordinator {

    lazy var imageViewBanner: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill

        return imageview
    }()

    let middleContainerView = DetailViewMiddleContainerView()
    let stackView = DetailViewStackView()
    let bottomView = DetailViewBottomView()
    private lazy var detailCardSlider = SchoolDetailViewControllerCard()

    var schoolDetails: Schools?

    let coordinator: DetailCoordinator

    init(coordinator: DetailCoordinator) {
        self.coordinator = coordinator

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        detailCardSlider.view.addGestureRecognizer(panGesture)
    }

    func configureUI() {
        let controller = coordinator.controller

        controller.view.addSubview(imageViewBanner)
        controller.view.addSubview(stackView)
        controller.view.addSubview(bottomView)

        bottomView.delegate = self

        if let image = UIImage(named: "skyline") {
            imageViewBanner.image = image
        }

        imageViewBanner.topAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.topAnchor, constant: -30).isActive = true
        imageViewBanner.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 10).isActive = true
        imageViewBanner.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -10).isActive = true
        imageViewBanner.heightAnchor.constraint(equalToConstant: controller.view.bounds.size.height / 3).isActive = true

        imageViewBanner.addSubview(middleContainerView)

        middleContainerView.leadingAnchor.constraint(equalTo: imageViewBanner.leadingAnchor, constant: 6).isActive = true
        middleContainerView.trailingAnchor.constraint(equalTo: imageViewBanner.trailingAnchor, constant: -6).isActive = true
        middleContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        middleContainerView.centerYAnchor.constraint(equalTo: imageViewBanner.centerYAnchor, constant: 150).isActive = true

        stackView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: imageViewBanner.bottomAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -10).isActive = true

        bottomView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 10).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -10).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: -10).isActive = true
    }

    func configure(with detail: Schools) {
        schoolDetails = detail
    }

    // MARK: Slider
    func presentSchoolDetails(with details: Schools) {
        let controller = coordinator.controller
        detailCardSlider.modalPresentationStyle = .custom
        detailCardSlider.transitioningDelegate = controller
        detailCardSlider.school = details

        controller.present(detailCardSlider, animated: true, completion: nil)
    }

    @objc
    func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: detailCardSlider.view)
        let dragPercentage = max(0, sender.translation(in: detailCardSlider.view).y) / detailCardSlider.view.frame.height

        // View is not allowed to be dragged upward
        guard translation.y >= 0 else {
            return
        }

        // Constrain dragging view up/down
        detailCardSlider.view.frame.origin = CGPoint(x: 0, y: detailCardSlider.pointOrigin!.y + translation.y)

        switch sender.state {
        case .ended:
            let dragVelocity = sender.velocity(in: detailCardSlider.view)

            if dragPercentage > 0.5 || dragVelocity.y >= 1300 {
                self.detailCardSlider.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.1) {
                    self.detailCardSlider.view.frame.origin = self.detailCardSlider.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }

        default:
            break
        }
    }
}

extension DetailViewCoordinator: DetailViewBottomViewDelegate {

    func didSelectViewGrades() {
        guard let schoolDetails = schoolDetails else {
            return
        }

        // TODO: Now only pass the DBN to process showing academic grades only
        presentSchoolDetails(with: schoolDetails)
    }
}

;; Crop Tracking Contract
;; Tracks agricultural crops from planting to harvest

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u200))
(define-constant err-not-found (err u201))
(define-constant err-already-exists (err u202))
(define-constant err-unauthorized (err u203))

;; Crop data structure
(define-map crops
  { crop-id: uint }
  {
    producer-id: uint,
    crop-type: (string-ascii 50),
    variety: (string-ascii 50),
    planted-date: uint,
    harvest-date: (optional uint),
    quantity: uint,
    location: (string-ascii 100),
    organic: bool,
    status: (string-ascii 20)
  }
)

(define-data-var next-crop-id uint u1)

;; Plant a new crop
(define-public (plant-crop
  (producer-id uint)
  (crop-type (string-ascii 50))
  (variety (string-ascii 50))
  (quantity uint)
  (location (string-ascii 100))
  (organic bool)
)
  (let ((crop-id (var-get next-crop-id)))
    (asserts! (is-none (map-get? crops { crop-id: crop-id })) err-already-exists)

    (map-set crops
      { crop-id: crop-id }
      {
        producer-id: producer-id,
        crop-type: crop-type,
        variety: variety,
        planted-date: block-height,
        harvest-date: none,
        quantity: quantity,
        location: location,
        organic: organic,
        status: "planted"
      }
    )

    (var-set next-crop-id (+ crop-id u1))
    (ok crop-id)
  )
)

;; Harvest a crop
(define-public (harvest-crop (crop-id uint) (actual-quantity uint))
  (let ((crop (unwrap! (map-get? crops { crop-id: crop-id }) err-not-found)))
    (map-set crops
      { crop-id: crop-id }
      (merge crop {
        harvest-date: (some block-height),
        quantity: actual-quantity,
        status: "harvested"
      })
    )
    (ok true)
  )
)

;; Get crop information
(define-read-only (get-crop (crop-id uint))
  (map-get? crops { crop-id: crop-id })
)

;; Get crop status
(define-read-only (get-crop-status (crop-id uint))
  (match (map-get? crops { crop-id: crop-id })
    crop (get status crop)
    "not-found"
  )
)

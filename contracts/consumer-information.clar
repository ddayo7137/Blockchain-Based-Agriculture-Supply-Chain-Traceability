;; Consumer Information Contract
;; Provides comprehensive food information to consumers

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u500))
(define-constant err-not-found (err u501))
(define-constant err-already-exists (err u502))
(define-constant err-unauthorized (err u503))

;; Product information structure
(define-map product-info
  { product-id: uint }
  {
    distribution-id: uint,
    product-name: (string-ascii 100),
    brand: (string-ascii 50),
    expiry-date: uint,
    nutritional-info: (string-ascii 200),
    allergen-info: (string-ascii 100),
    storage-instructions: (string-ascii 150),
    qr-code: (string-ascii 100)
  }
)

(define-data-var next-product-id uint u1)

;; Create product information
(define-public (create-product-info
  (distribution-id uint)
  (product-name (string-ascii 100))
  (brand (string-ascii 50))
  (expiry-date uint)
  (nutritional-info (string-ascii 200))
  (allergen-info (string-ascii 100))
  (storage-instructions (string-ascii 150))
  (qr-code (string-ascii 100))
)
  (let ((product-id (var-get next-product-id)))
    (asserts! (is-none (map-get? product-info { product-id: product-id })) err-already-exists)

    (map-set product-info
      { product-id: product-id }
      {
        distribution-id: distribution-id,
        product-name: product-name,
        brand: brand,
        expiry-date: expiry-date,
        nutritional-info: nutritional-info,
        allergen-info: allergen-info,
        storage-instructions: storage-instructions,
        qr-code: qr-code
      }
    )

    (var-set next-product-id (+ product-id u1))
    (ok product-id)
  )
)

;; Get product information
(define-read-only (get-product-info (product-id uint))
  (map-get? product-info { product-id: product-id })
)

;; Get complete traceability information
(define-read-only (get-full-traceability (product-id uint))
  (match (map-get? product-info { product-id: product-id })
    product {
      product-id: product-id,
      product-name: (get product-name product),
      brand: (get brand product),
      expiry-date: (get expiry-date product),
      distribution-id: (get distribution-id product)
    }
    { product-id: u0, product-name: "", brand: "", expiry-date: u0, distribution-id: u0 }
  )
)

;; Check if product is expired
(define-read-only (is-product-expired (product-id uint))
  (match (map-get? product-info { product-id: product-id })
    product (> block-height (get expiry-date product))
    true
  )
)

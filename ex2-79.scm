(put ’equ ’(scheme-number scheme-number)
          (lambda (x y) (= x y)))

(put 'equ '(rational rational)
     (lambda (x y) (and (= (numer x) (numer y)) (= (denom x) (denom y)))))

(put 'equ '(complex complex)
     (lambda (x y) (= 0 (sub-complex x y))))

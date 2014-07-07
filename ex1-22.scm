(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n) (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (check-prime n upper-bound)
  (timed-prime-test n)
  (search-for-primes (+ 2 n) upper-bound))

(define (search-for-primes lower-bound upper-bound) 
  (if (even? lower-bound) 
    (search-for-primes (+ lower-bound 1) upper-bound)
    (if (or (< lower-bound upper-bound) (= lower-bound upper-bound)) 
      (check-prime lower-bound upper-bound)
    )
  )
) 

(search-for-primes 1000 1025)

(search-for-primes 10000 10100)

(search-for-primes 100000 100100)

(search-for-primes 1000000 1000100)

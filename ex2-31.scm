(define (map-tree function tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (map-tree function sub-tree)
             (function sub-tree))) tree))
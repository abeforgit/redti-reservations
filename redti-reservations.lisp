(in-package :redti-reservations)


(defun boot ()
  (hunchentoot:start
   (make-instance 'easy-routes:easy-routes-acceptor
                  :port (if (member :docker *features*) 80 8000)
                  )
   )
  )
(defun @json (next)
  (setf (hunchentoot:content-type*) "application/json")
  (funcall next)
  )

(easy-routes:defroute delta ("/delta"
                           :method :post
                           ) ()
  (let ((delta
          (jsown:parse (hunchentoot:raw-post-data :request hunchentoot:*request* :force-text t))
          ))
    (format t "~A" (jsown:to-json delta))
    )
  )


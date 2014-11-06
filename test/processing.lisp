
;; in the directory with the CDSegundoHAREMclassico.xml file:

(with-open-file (out #P"teste.xml" :if-exists :supersede :direction :output)
  (flet ((resolver (pubid sysid)
	   (declare (ignore pubid sysid))
	   (flexi-streams:make-in-memory-input-stream nil)))
    (let ((h (make-instance 'preproc
			    :chained-handler (cxml:make-character-stream-sink out))))
      (cxml:parse #P"CDSegundoHAREMclassico.xml" h :validate nil :entity-resolver #'resolver))))


;; (with-open-file (out #P"teste.xml" :if-exists :supersede :direction :output)
;;   (let ((h (make-instance 'preproc
;; 			  :chained-handler (cxml:make-character-stream-sink out))))
;;     (cxml:parse #P"CDSegundoHAREMclassico.xml" h :validate t)))

;; (with-open-file (out #P"teste.xml" :if-exists :supersede :direction :output)
;;   (let* ((h (make-instance 'preproc :chained-handler (cxml-dom:make-dom-builder)))
;; 	 (dom (cxml:parse #P"CDSegundoHAREMclassico.xml" h :validate t)))
;;     (dom:map-document out dom :include-doctype nil)))


;; (with-open-file (out #P"teste.xml" :if-exists :supersede :direction :output)
;;   (let ((h (make-instance 'preproc
;; 			  :handlers (list (cxml:make-character-stream-sink out)))))
;;     (cxml:parse #P"CDSegundoHAREMclassico.xml" h :validate t)))
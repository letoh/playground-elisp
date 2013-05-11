;; Copyright (C) 2013 Meng-Cheng Cheng (letoh)
;;
(defun get-sunrise-sunset-string ()
  "get the real result from `sunrise-sunset'"
  (save-window-excursion
    (let ((regex  "[0-9]+:[0-9]+[ap]m")
	  (s      (sunrise-sunset))
	  (buf    (get-buffer "*temp*")))
      (unless (and (stringp s)
		   (string-match-p regex s))
	(when buf
	  (with-current-buffer buf
	    (let* ((s1  (buffer-string))
		   (s2  (if (string-match-p regex s1)
			    s1 nil)))
	      (setq s s2)
	      (kill-buffer buf)))))
      s)))


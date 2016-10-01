;;; java.el --- java config
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/.emacs.d/vendor/jdee-2.4.1/lisp")
(load "jde")
'(jde-jdk (quote ("1.7")))
'(jde-jdk-registry (quote (("1.7" . "/usr/lib/jvm/java-7-openjdk"))))

'(jde-bug-debugger-host-address "127.0.0.1")
'(jde-bug-jre-home "/usr/lib/jvm/java-7-openjdk")
'(jde-compile-option-debug (quote ("all" (t nil nil))))
'(jde-debugger (quote ("jdb")))
'(jde-global-classpath (quote ("." "/usr/share/java/" "/usr/lib/jvm/java-6-sun/")))
'(jde-jdk-doc-url "/usr/share/doc/sun-java6-jdk/html/api/index.html")
'(jde-regexp-jar-file "/usr/share/java/regexp.jar")
'(jde-sourcepath (quote (".")))

(provide 'personal-plugin-java)

;;; java.el ends here

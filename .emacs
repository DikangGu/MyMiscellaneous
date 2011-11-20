(require 'cl)

(defvar emacs-directory "~/emacs/"
 "The directory containing the emacs configuration files.")

	; Define the load-path
(pushnew (expand-file-name emacs-directory) load-path)

	;;; MacOS X specific stuff
	(setq mac-option-modifier 'meta)
	(setq mac-command-modifier 'hyper)
	(set-keyboard-coding-system nil)
(setq mac-command-key-is-meta t)
	(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

	(global-set-key [(hyper a)] 'mark-whole-buffer)
	(global-set-key [(hyper v)] 'yank)
	(global-set-key [(hyper c)] 'kill-ring-save)
	(global-set-key [(hyper x)] 'kill-region)
	(global-set-key [(hyper s)] 'save-buffer)
	(global-set-key [(hyper l)] 'goto-line)
	(global-set-key [(hyper o)] 'find-file)
	(global-set-key [(hyper f)] 'isearch-forward)
	(global-set-key [(hyper g)] 'isearch-repeat-forward)
	(global-set-key [(hyper w)]
	 (lambda () (interactive) (kill-buffer (current-buffer))))
	(global-set-key [(hyper .)] 'keyboard-quit)

	;; I disabled this since I want to avoid hitting Cmd-q accidentally.
	(global-set-key [(hyper q)] 'save-buffers-kill-emacs)

	(require 'redo)
	(global-set-key [(hyper z)] 'undo)
	(global-set-key [(hyper shift z)] 'redo)

	;; Load the ensime lisp code...
	(add-to-list 'load-path "/Users/dikang/softwares/ensime_2.9.0-1-0.6.1/elisp/")
	(require 'ensime)

	;; This step causes the ensime-mode to be started whenever
	;; scala-mode is started for a buffer. You may have to customize this step
	;; if you're not using the standard scala mode.
	(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

	;; MINI HOWTO: 
	;; Open .scala file. M-x ensime (once per project)

	;; Set the debug option to enable a backtrace when a
	;; problem occurs.
(setq debug-on-error nil)
	;; Update the Emacs load-path to include the path to
	;; the JDE and its require packages. This code assumes
	;; that you have installed the packages in the emacs/site
	;; subdirectory of your home directory.


	(add-to-list 'load-path "/Users/dikang/emacs/jde/cedet-1.0/eieio")
	(add-to-list 'load-path "/Users/dikang/emacs/jde/cedet-1.0/semantic")
	(add-to-list 'load-path (expand-file-name "/Users/dikang/emacs/jde/jdee-2.4.0.1/lisp"))    
	(add-to-list 'load-path (expand-file-name "/Users/dikang/emacs/jde/cedet-1.0/common"))
	(load-file (expand-file-name "/Users/dikang/emacs/jde/cedet-1.0/common/cedet.el"))
	(add-to-list 'load-path (expand-file-name "/Users/dikang/emacs/jde/elib-1.0"))


	;; If you want Emacs to defer loading the JDE until you open a
	;; Java file, edit the following line
(setq defer-loading-jde t)
	;; to read:
	;;  
	;;  (setq defer-loading-jde t)
	;;  
	(if defer-loading-jde
	 (progn
	  (autoload 'jde-mode "jde" "JDE mode." t)
	  (setq auto-mode-alist
	   (append
		'(("\\.java\\'" . jde-mode))
		auto-mode-alist)))
	 (require 'jde))
(setq jde-compile-option-classpath (quote ("./" 
											   "/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home/lib/dt.jar"
											   "/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Classes/classes.jar"
											  )))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(gud-gdb-command-name "gdb --annotate=1")
 '(jde-compiler (quote ("javac" "")))
 '(jde-java-environment-variables (quote ("1.6.0" "/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0")))
 '(jde-jdk-registry (quote (("1.6.0" . "/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0"))))
 '(large-file-warning-threshold nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

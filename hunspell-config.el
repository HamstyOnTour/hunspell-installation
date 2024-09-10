;; Function to check if Hunspell is installed
(defun ensure-hunspell-installed ()
  (unless (executable-find ispell-program-name)
    (error "Hunspell is not installed. Please install it using your system's package manager.")))

;; Optional: Install hunspell dictionaries if not present
(defun ensure-hunspell-dictionaries ()
  (let ((en-dict (expand-file-name "en_US.aff" "/usr/share/hunspell"))
        (de-dict (expand-file-name "de_DE.aff" "/usr/share/hunspell")))
    (unless (and (file-exists-p en-dict) (file-exists-p de-dict))
      (message "Hunspell dictionaries not found. Please install them using your system's package manager.")
      (when (yes-or-no-p "Attempt to install Hunspell dictionaries? (Requires sudo) ")
        (shell-command "sudo apt-get update && sudo apt-get install -y hunspell-en-us hunspell-de-de" t)))))

(ensure-hunspell-installed)
(ensure-hunspell-dictionaries)
(provide 'hunspell-config)

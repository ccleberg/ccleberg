;;; christian.el --- Personal profile & blog index -*- lexical-binding: t -*-

;; Author:  Christian Cleberg <hello@cleberg.net>
;; Version: 0.1
;; Keywords: privacy, security, self-hosting
;; Package-Requires: ((emacs "27.1"))

;;; Commentary:

;;   I'm a Tech Assurance Manager at KPMG.
;;   I run a personal site at https://cleberg.net which contains:
;;       - a blog,
;;       - information about me,
;;       - publicly‑hosted services.
;;
;;   Prefer Tor?  Use the .onion address for the same content.

;;; Code:

(defvar christian/profile
  '((name        . "Christian")
    (email       . "hello@cleberg.net")
    (role        . "Tech Assurance Manager at KPMG")
    (gpg-key     . "https://cleberg.net/gpg.txt")
    (site-url    . "https://cleberg.net")
    (tor-url     . "http://sv3g2dlyvwyk2nvi3eeh55fcrpdvjlclhi6wwsx57cste6lwdjanzyyd.onion")
    (blog-posts  .
                 ((:date "2025-12-20"
                          :title "Self-Hosting Guide: Home Assistant"
                          :url "https://cleberg.net/blog/self-hosting-home-assistant.html")
                  (:date "2025-12-06"
                          :title "Self‑Hosting Guide: Tor Websites"
                          :url "https://cleberg.net/blog/self-hosting-tor.html")
                  (:date "2025-11-23"
                          :title "Practical Uses for AI in IT Audit"
                          :url "https://cleberg.net/blog/it-audit-ai.html")
                  (:date "2025-11-15"
                          :title "Striving for 100% WCAG 2 Compliance"
                          :url "https://cleberg.net/blog/wcag.html")
                  (:date "2025-11-02"
                          :title "Using aerc on macOS"
                          :url "https://cleberg.net/blog/aerc-macos.html")))))

(defun christian/display-profile ()
  "Pretty‑print the profile in a *Help* buffer."
  (interactive)
  (with-help-window "*Christian Profile*"
    (princ (format "%s %s\n\n" (alist-get 'name christian/profile)
                   (alist-get 'emoji christian/profile)))
    (princ (format "%s\n\n" (alist-get 'role christian/profile)))
    (princ (format "Website: %s\n" (alist-get 'site-url christian/profile)))
    (princ (format "Tor (onion): %s\n\n" (alist-get 'tor-url christian/profile)))
    (princ "=== Latest Blog Posts ===\n")
    (dolist (post (alist-get 'blog-posts christian/profile))
      (princ (format "- %s (%s)\n  %s\n"
                     (plist-get post :title)
                     (plist-get post :date)
                     (plist-get post :url))))))

(provide 'christian)

;;; christian.el ends here

;; 文字コードの設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; ロードパスを追加
(setq load-path
  (cons (expand-file-name "~/.emacs.d/lisp") load-path)
  )

;; ミニバッファ履歴リストの最大長：tなら無限
;(setq history-length t)
(setq history-length 30)
;; session.el
;;   kill-ringやミニバッファで過去に開いたファイルなどの履歴を保存する
(when (require 'session nil t)
  (setq session-initialize '(de-saveplace session keys menus places)
        session-globals-include '((kill-ring 50)
                                  (session-file-alist 500 t)
                                  (file-name-history 10000)))
  (add-hook 'after-init-hook 'session-initialize)
  ;; 前回閉じたときの位置にカーソルを復帰
  (setq session-undo-check -1))

;; minibuf-isearch
;;   minibufでisearchを使えるようにする
(require 'minibuf-isearch nil t)

;; C-hをDELキーに
(keyboard-translate ?\C-h ?\C-?)

;; ヘルプを割り当てる
;(global-set-key (kbd "C-x C-h") 'help-command)
(define-key global-map (kbd "C-x ?") 'help-command)
;(define-key global-map (kbd "C-x C-h") 'help-command)
;(define-key global-map (kbd "C-x DEL") 'help-command)

;; pageup,pagedown
(global-set-key (kbd "M-,") 'scroll-down-command)
(global-set-key (kbd "M-.") 'scroll-up-command)

;; C-oはIMEのon/off
(global-set-key (kbd "C-o") 'toggle-input-method)

;; メニューバーを非表示
;;(menu-bar-mode 0)

;; ツールバーを非表示
(tool-bar-mode 0)

;; Mac OS Xの場合のファイル名の設定
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  ; ファイル名文字コード
  (set-file-name-coding-system 'utf-8-hfs)
  ; ロケール文字コード？
  (setq locale-coding-system 'utf-8-hfs)
  ; asciiフォントをMenloに
  (set-face-attribute 'default nil
					  :family "Menlo"
					  :height 120)
  ; 日本語フォント指定
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Hiragino Kaku Gothic Pro"))
  ; フォントの幅設定
  (setq face-font-rescale-alist
		'((".*Menlo.*" . 1.0)
		  (".*Hiragino.*" . 1.2)
		  ("-cdac$" . 1.3)))
  ; ¥の代わりにバックスラッシュを入力する
  (define-key global-map [?¥] [?\\])
  )

;; Windowsの場合のファイル名の設定
(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))

;; カラム番号も表示
(column-number-mode t)

;; ファイルサイズを表示
(size-indication-mode t)

;; タイトルバーの表示を変更
(setq frame-title-format "%*%f") ; readonlyは%、変更は*、それ以外は-を表示して、その後ろにフルパスのファイル名を表示

;; TAB幅
(setq-default tab-width 4)

;; インデントにタブ文字を使用する
(setq-default indent-tabs-mode t)

;; C++
; ヘッダファイル(.h)をc++モードで開く
(setq auto-mode-alist
  (append '(("\\.h$" . c++-mode))
    auto-mode-alist))

;; c-modeのデフォルトスタイル
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "cc-mode")))

;; C++ style
(add-hook 'c++-mode-hook
          '(lambda()
             (define-key c++-mode-map "\C-t" 'ff-find-other-file)	; ソース<->ヘッダ切り替え
             ;(c-set-style "stroustrup")
             (setq indent-tabs-mode t)       ; インデントはTABで
             (c-set-offset 'innamespace 0)   ; namespace {}の中はインデントしない
             (c-set-offset 'arglist-close 0) ; 関数の引数リストの閉じ括弧はインデントしない
             ))

;; TABキーはTAB入力でしょjk(xyzzy)
;(let ((keymap (make-sparse-keymap))) 
;(define-key keymap TAB 'self-insert-command)
;(add-hook '*create-buffer-hook*
;		  #'(lambda (buffer)
;			  (set-minor-mode-map keymap buffer))))


;; バックスペースでタブをしっかり消したい
;(define-key c-mode-map ?\C-h nil)
;(define-key c++-mode-map ?\C-h nil)
;(global-set-key ?\C-h 'delete-backward-char-or-selection)

;; 要らない機能外したい
;(define-key c-mode-map ?\: nil)
;(define-key c++-mode-map ?\: nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

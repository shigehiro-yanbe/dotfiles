;; 文字コードの設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; C-hをDELキーに
(keyboard-translate ?\C-h ?\C-?)

;; ヘルプを割り当てる
;(global-set-key (kbd "C-x C-h") 'help-command)
(define-key global-map (kbd "C-x ?") 'help-command)
;(define-key global-map (kbd "C-x C-h") 'help-command)
;(define-key global-map (kbd "C-x DEL") 'help-command)

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
             ;(c-set-style "stroustrup")
             (setq indent-tabs-mode t)       ; インデントはTABで
             (c-set-offset 'innamespace 0)   ; namespace {}の中はインデントしない
             (c-set-offset 'arglist-close 0) ; 関数の引数リストの閉じ括弧はインデントしない
             ))

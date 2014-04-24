;; 文字コードの設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; 入力されるキーシーケンスを置き換える
;; ?\C-?はDELのキーシーケンス
(keyboard-translate ?\C-h ?\C-?)

;; ヘルプを割り当てる
;(global-set-key (kbd "C-x C-h") 'help-command)
(define-key global-map (kbd "C-x ?") 'help-command)

;; Mac OS Xの場合のファイル名の設定
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

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
			(c-set-style "bsd")))


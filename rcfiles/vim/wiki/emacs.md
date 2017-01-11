
Referências: http://www.emacswiki.org/emacs-pt/NovatoNoEmacs

Para fechar ^xc
para salvar ^xs

      Para iniciar o tutorial ^ht
      para fechar o buffer    ^xk
      para fazer uma busca    ^s
      para ir para o começo da linha ^a
      para ir para o final da linha ^e

      ^f  move para a direita
      ^b  move para a esquerda
      ^p  sobe uma linha
      ^n  desce uma linha
      
 
       para inserir nova linha ^j
       para desfazer ^xu undo
       para apagar o restante da linha 

       para ir para o começo do arquivo M-S-<

=======================================
Key translations:
key             binding
---             -------

C-x		Prefix Command

C-x 8		iso-transl-ctl-x-8-map


Major Mode Bindings:
key             binding
---             -------

C-c		Prefix Command
TAB		widget-forward
RET		Custom-newline
C-x		Prefix Command
ESC		Prefix Command
SPC		scroll-up
n		widget-forward
p		widget-backward
q		Custom-buffer-done
u		Custom-goto-parent
DEL		scroll-down
<S-tab>		advertised-widget-backward
<backtab>	widget-backward
<down-mouse-1>	widget-button-click
<down-mouse-2>	widget-button-click
<remap>		Prefix Command

C-c C-c		Custom-set

C-x C-s		Custom-save

<remap> <self-insert-command>	Custom-no-edit

M-TAB		widget-backward


Global Bindings:
key             binding
---             -------

 ..  	self-insert-command
  ..  	self-insert-command

C-@		set-mark-command
C-a		move-beginning-of-line
C-b		backward-char
C-c		mode-specific-command-prefix
C-d		delete-char
C-e		move-end-of-line
C-f		forward-char
C-g		keyboard-quit
C-h		help-command
C-j		newline-and-indent
C-k		kill-line
C-l		recenter-top-bottom
C-n		next-line
C-o		open-line
C-p		previous-line
C-q		quoted-insert
C-r		isearch-backward
C-s		isearch-forward
C-t		transpose-chars
C-u		universal-argument
C-v		scroll-up
C-w		kill-region
C-x		Control-X-prefix
C-y		yank
C-z		suspend-frame
ESC		ESC-prefix
C-\		toggle-input-method
C-]		abort-recursive-edit
C-_		undo
C-SPC		set-mark-command
C--		negative-argument
C-/		undo
C-0 .. C-9	digit-argument
<C-M-down>	down-list
<C-M-end>	end-of-defun
<C-M-home>	beginning-of-defun
<C-M-left>	backward-sexp
<C-M-right>	forward-sexp
<C-M-up>	backward-up-list
<C-S-backspace>			kill-whole-line
<C-backspace>			backward-kill-word
<C-delete>	kill-word
<C-down>	forward-paragraph
<C-down-mouse-1>		mouse-buffer-menu
<C-down-mouse-2>		facemenu-menu
<C-drag-n-drop>			w32-drag-n-drop-other-frame
<C-end>		end-of-buffer
<C-home>	beginning-of-buffer
<C-insert>	kill-ring-save
<C-insertchar>	kill-ring-save
<C-left>	backward-word
<C-next>	scroll-left
<C-prior>	scroll-right
<C-right>	forward-word
<C-up>		backward-paragraph
<C-wheel-down>	mwheel-scroll
<C-wheel-up>	mwheel-scroll
<M-begin>	beginning-of-buffer-other-window
<M-down-mouse-1>		mouse-drag-secondary
<M-drag-mouse-1>		mouse-set-secondary
<M-end>		end-of-buffer-other-window
<M-home>	beginning-of-buffer-other-window
<M-left>	backward-word
<M-mouse-1>	mouse-start-secondary
<M-mouse-2>	mouse-yank-secondary
<M-mouse-3>	mouse-secondary-save-then-kill
<M-next>	scroll-other-window
<M-prior>	scroll-other-window-down
<M-right>	forward-word
<S-delete>	kill-region
<S-down-mouse-1>		mouse-appearance-menu
<S-insert>	yank
<S-insertchar>	yank
<S-wheel-down>	mwheel-scroll
<S-wheel-up>	mwheel-scroll
<again>		repeat-complex-command
<begin>		beginning-of-buffer
<compose-last-chars>		compose-last-chars
<copy>		clipboard-kill-ring-save
<cut>		clipboard-kill-region
<delete-frame>	handle-delete-frame
<deletechar>	delete-char
<deleteline>	kill-line
<double-mouse-1>		mouse-set-point
<down>		next-line
<drag-mouse-1>	mouse-set-region
<drag-n-drop>	w32-drag-n-drop
<end>		move-end-of-line
<execute>	execute-extended-command
<f1>		help-command
<f10>		menu-bar-open
<f16>		clipboard-kill-ring-save
<f18>		clipboard-yank
<f2>		2C-command
<f20>		clipboard-kill-region
<f3>		kmacro-start-macro-or-insert-counter
<f4>		kmacro-end-or-call-macro
<find>		search-forward
<header-line>	Prefix Command
<help>		help-command
<home>		move-beginning-of-line
<iconify-frame>			ignore-event
<insert>	overwrite-mode
<insertchar>	overwrite-mode
<insertline>	open-line
<language-change>		ignore
<left>		backward-char
<left-fringe>	Prefix Command
<lwindow>	ignore
<make-frame-visible>		ignore-event
<menu>		execute-extended-command
<mode-line>	Prefix Command
<mouse-1>	mouse-set-point
<mouse-2>	mouse-yank-at-click
<mouse-3>	mouse-save-then-kill
<mouse-movement>		ignore
<next>		scroll-up
<open>		find-file
<paste>		clipboard-yank
<prior>		scroll-down
<redo>		repeat-complex-command
<right>		forward-char
<right-fringe>	Prefix Command
<rwindow>	ignore
<select-window>			handle-select-window
<switch-frame>			handle-switch-frame
<triple-mouse-1>		mouse-set-point
<undo>		undo
<up>		previous-line
<vertical-line>			Prefix Command
<vertical-scroll-bar>		Prefix Command
<wheel-down>			mwheel-scroll
<wheel-up>	mwheel-scroll

C-h C-a		about-emacs
C-h C-c		describe-copying
C-h C-d		view-emacs-debugging
C-h C-e		view-external-packages
C-h C-f		view-emacs-FAQ
C-h C-h		help-for-help
C-h RET		view-order-manuals
C-h C-n		view-emacs-news
C-h C-o		describe-distribution
C-h C-p		view-emacs-problems
C-h C-t		view-emacs-todo
C-h C-w		describe-no-warranty
C-h C-\		describe-input-method
C-h .		display-local-help
C-h 4		Prefix Command
C-h ?		help-for-help
C-h C		describe-coding-system
C-h F		Info-goto-emacs-command-node
C-h I		describe-input-method
C-h K		Info-goto-emacs-key-command-node
C-h L		describe-language-environment
C-h S		info-lookup-symbol
C-h a		apropos-command
C-h b		describe-bindings
C-h c		describe-key-briefly
C-h d		apropos-documentation
C-h e		view-echo-area-messages
C-h f		describe-function
C-h g		describe-gnu-project
C-h h		view-hello-file
C-h i		info
C-h k		describe-key
C-h l		view-lossage
C-h m		describe-mode
C-h n		view-emacs-news
C-h p		finder-by-keyword
C-h q		help-quit
C-h r		info-emacs-manual
C-h s		describe-syntax
C-h t		help-with-tutorial
C-h v		describe-variable
C-h w		where-is
C-h <f1>	help-for-help
C-h <help>	help-for-help

C-x C-@		pop-global-mark
C-x C-b		list-buffers
C-x C-c		save-buffers-kill-terminal
C-x C-d		list-directory
C-x C-e		eval-last-sexp
C-x C-f		find-file
C-x TAB		indent-rigidly
C-x C-k		kmacro-keymap
C-x C-l		downcase-region
C-x RET		Prefix Command
C-x C-n		set-goal-column
C-x C-o		delete-blank-lines
C-x C-p		mark-page
C-x C-q		toggle-read-only
C-x C-r		find-file-read-only
C-x C-t		transpose-lines
C-x C-u		upcase-region
C-x C-v		find-alternate-file
C-x C-w		write-file
C-x C-x		exchange-point-and-mark
C-x C-z		suspend-frame
C-x ESC		Prefix Command
C-x $		set-selective-display
C-x '		expand-abbrev
C-x (		kmacro-start-macro
C-x )		kmacro-end-macro
C-x *		calc-dispatch
C-x +		balance-windows
C-x -		shrink-window-if-larger-than-buffer
C-x .		set-fill-prefix
C-x 0		delete-window
C-x 1		delete-other-windows
C-x 2		split-window-vertically
C-x 3		split-window-horizontally
C-x 4		ctl-x-4-prefix
C-x 5		ctl-x-5-prefix
C-x 6		2C-command
C-x 8		Prefix Command
C-x ;		comment-set-column
C-x <		scroll-left
C-x =		what-cursor-position
C-x >		scroll-right
C-x [		backward-page
C-x ]		forward-page
C-x ^		enlarge-window
C-x `		next-error
C-x a		Prefix Command
C-x b		switch-to-buffer
C-x d		dired
C-x e		kmacro-end-and-call-macro
C-x f		set-fill-column
C-x h		mark-whole-buffer
C-x i		insert-file
C-x k		kill-buffer
C-x l		count-lines-page
C-x m		compose-mail
C-x n		Prefix Command
C-x o		other-window
C-x q		kbd-macro-query
C-x r		Prefix Command
C-x s		save-some-buffers
C-x u		advertised-undo
C-x v		vc-prefix-map
C-x z		repeat
C-x {		shrink-window-horizontally
C-x }		enlarge-window-horizontally
C-x DEL		backward-kill-sentence
C-x C-SPC	pop-global-mark
C-x C-+		text-scale-adjust
C-x C--		text-scale-adjust
C-x C-0		text-scale-adjust
C-x C-=		text-scale-adjust
C-x <C-left>	previous-buffer
C-x <C-right>	next-buffer
C-x <left>	previous-buffer
C-x <right>	next-buffer

M-0 .. M-9	digit-argument

C-M-@		mark-sexp
C-M-a		beginning-of-defun
C-M-b		backward-sexp
C-M-c		exit-recursive-edit
C-M-d		down-list
C-M-e		end-of-defun
C-M-f		forward-sexp
C-M-h		mark-defun
C-M-j		indent-new-comment-line
C-M-k		kill-sexp
C-M-l		reposition-window
C-M-n		forward-list
C-M-o		split-line
C-M-p		backward-list
C-M-r		isearch-backward-regexp
C-M-s		isearch-forward-regexp
C-M-t		transpose-sexps
C-M-u		backward-up-list
C-M-v		scroll-other-window
C-M-w		append-next-kill
ESC ESC		Prefix Command
C-M-\		indent-region
M-SPC		just-one-space
M-!		shell-command
M-$		ispell-word
M-%		query-replace
M-'		abbrev-prefix-mark
M-(		insert-parentheses
M-)		move-past-close-and-reindent
M-*		pop-tag-mark
M-,		tags-loop-continue
M--		negative-argument
M-.		find-tag
M-/		dabbrev-expand
M-:		eval-expression
M-;		comment-dwim
M-<		beginning-of-buffer
M-=		count-lines-region
M->		end-of-buffer
M-@		mark-word
M-\		delete-horizontal-space
M-^		delete-indentation
M-`		tmm-menubar
M-a		backward-sentence
M-b		backward-word
M-c		capitalize-word
M-d		kill-word
M-e		forward-sentence
M-f		forward-word
M-g		Prefix Command
M-h		mark-paragraph
M-i		tab-to-tab-stop
M-j		indent-new-comment-line
M-k		kill-sentence
M-l		downcase-word
M-m		back-to-indentation
M-o		facemenu-keymap
M-q		fill-paragraph
M-r		move-to-window-line
M-s		Prefix Command
M-t		transpose-words
M-u		upcase-word
M-v		scroll-down
M-w		kill-ring-save
M-x		execute-extended-command
M-y		yank-pop
M-z		zap-to-char
M-{		backward-paragraph
M-|		shell-command-on-region
M-}		forward-paragraph
M-~		not-modified
M-DEL		backward-kill-word
C-M-S-v		scroll-other-window-down
C-M-SPC		mark-sexp
C-M-%		query-replace-regexp
C-M--		negative-argument
C-M-.		find-tag-regexp
C-M-/		dabbrev-completion
C-M-0 .. C-M-9	digit-argument
ESC <C-backspace>		backward-kill-sexp
ESC <C-delete>			backward-kill-sexp
ESC <C-down>			down-list
ESC <C-end>			end-of-defun
ESC <C-home>			beginning-of-defun
ESC <C-left>			backward-sexp
ESC <C-right>			forward-sexp
ESC <C-up>	backward-up-list
ESC <begin>	beginning-of-buffer-other-window
ESC <end>	end-of-buffer-other-window
ESC <home>	beginning-of-buffer-other-window
ESC <left>	backward-word
ESC <next>	scroll-other-window
ESC <prior>	scroll-other-window-down
ESC <right>	forward-word

M-s h		Prefix Command
M-s o		occur
M-s w		isearch-forward-word

M-o ESC		Prefix Command
M-o b		facemenu-set-bold
M-o d		facemenu-set-default
M-o i		facemenu-set-italic
M-o l		facemenu-set-bold-italic
M-o o		facemenu-set-face
M-o u		facemenu-set-underline

M-g ESC		Prefix Command
M-g g		goto-line
M-g n		next-error
M-g p		previous-error

M-ESC ESC	keyboard-escape-quit
M-ESC :		eval-expression

<vertical-line> <C-mouse-2>	mouse-split-window-vertically
<vertical-line> <down-mouse-1>	mouse-drag-vertical-line
<vertical-line> <mouse-1>	mouse-select-window

<vertical-scroll-bar> <C-mouse-2>
				mouse-split-window-vertically
<vertical-scroll-bar> <mouse-1>
				scroll-bar-toolkit-scroll

<header-line> <down-mouse-1>	mouse-drag-header-line
<header-line> <mouse-1>		mouse-select-window

<mode-line> <C-mouse-2>		mouse-split-window-horizontally
<mode-line> <down-mouse-1>	mouse-drag-mode-line
<mode-line> <drag-mouse-1>	mouse-select-window
<mode-line> <mouse-1>		mouse-select-window
<mode-line> <mouse-2>		mouse-delete-other-windows
<mode-line> <mouse-3>		mouse-delete-window

<right-fringe> <mouse-1>	mouse-set-point
<right-fringe> <mouse-2>	mouse-yank-at-click
<right-fringe> <mouse-3>	mouse-save-then-kill

<left-fringe> <mouse-1>		mouse-set-point
<left-fringe> <mouse-2>		mouse-yank-at-click
<left-fringe> <mouse-3>		mouse-save-then-kill

<C-down-mouse-2> <bg>		facemenu-background-menu
<C-down-mouse-2> <dc>		list-colors-display
<C-down-mouse-2> <df>		list-faces-display
<C-down-mouse-2> <dp>		describe-text-properties
<C-down-mouse-2> <fc>		facemenu-face-menu
<C-down-mouse-2> <fg>		facemenu-foreground-menu
<C-down-mouse-2> <in>		facemenu-indentation-menu
<C-down-mouse-2> <ju>		facemenu-justification-menu
<C-down-mouse-2> <ra>		facemenu-remove-all
<C-down-mouse-2> <rm>		facemenu-remove-face-props
<C-down-mouse-2> <sp>		facemenu-special-menu

<f1> C-a	about-emacs
<f1> C-c	describe-copying
<f1> C-d	view-emacs-debugging
<f1> C-e	view-external-packages
<f1> C-f	view-emacs-FAQ
<f1> C-h	help-for-help
<f1> RET	view-order-manuals
<f1> C-n	view-emacs-news
<f1> C-o	describe-distribution
<f1> C-p	view-emacs-problems
<f1> C-t	view-emacs-todo
<f1> C-w	describe-no-warranty
<f1> C-\	describe-input-method
<f1> .		display-local-help
<f1> 4		Prefix Command
<f1> ?		help-for-help
<f1> C		describe-coding-system
<f1> F		Info-goto-emacs-command-node
<f1> I		describe-input-method
<f1> K		Info-goto-emacs-key-command-node
<f1> L		describe-language-environment
<f1> S		info-lookup-symbol
<f1> a		apropos-command
<f1> b		describe-bindings
<f1> c		describe-key-briefly
<f1> d		apropos-documentation
<f1> e		view-echo-area-messages
<f1> f		describe-function
<f1> g		describe-gnu-project
<f1> h		view-hello-file
<f1> i		info
<f1> k		describe-key
<f1> l		view-lossage
<f1> m		describe-mode
<f1> n		view-emacs-news
<f1> p		finder-by-keyword
<f1> q		help-quit
<f1> r		info-emacs-manual
<f1> s		describe-syntax
<f1> t		help-with-tutorial
<f1> v		describe-variable
<f1> w		where-is
<f1> <f1>	help-for-help
<f1> <help>	help-for-help

<help> C-a	about-emacs
<help> C-c	describe-copying
<help> C-d	view-emacs-debugging
<help> C-e	view-external-packages
<help> C-f	view-emacs-FAQ
<help> C-h	help-for-help
<help> RET	view-order-manuals
<help> C-n	view-emacs-news
<help> C-o	describe-distribution
<help> C-p	view-emacs-problems
<help> C-t	view-emacs-todo
<help> C-w	describe-no-warranty
<help> C-\	describe-input-method
<help> .	display-local-help
<help> 4	Prefix Command
<help> ?	help-for-help
<help> C	describe-coding-system
<help> F	Info-goto-emacs-command-node
<help> I	describe-input-method
<help> K	Info-goto-emacs-key-command-node
<help> L	describe-language-environment
<help> S	info-lookup-symbol
<help> a	apropos-command
<help> b	describe-bindings
<help> c	describe-key-briefly
<help> d	apropos-documentation
<help> e	view-echo-area-messages
<help> f	describe-function
<help> g	describe-gnu-project
<help> h	view-hello-file
<help> i	info
<help> k	describe-key
<help> l	view-lossage
<help> m	describe-mode
<help> n	view-emacs-news
<help> p	finder-by-keyword
<help> q	help-quit
<help> r	info-emacs-manual
<help> s	describe-syntax
<help> t	help-with-tutorial
<help> v	describe-variable
<help> w	where-is
<help> <f1>	help-for-help
<help> <help>	help-for-help

C-h 4 i		info-other-window

C-x RET C-\	set-input-method
C-x RET F	set-file-name-coding-system
C-x RET X	set-next-selection-coding-system
C-x RET c	universal-coding-system-argument
C-x RET f	set-buffer-file-coding-system
C-x RET k	set-keyboard-coding-system
C-x RET l	set-language-environment
C-x RET p	set-buffer-process-coding-system
C-x RET r	revert-buffer-with-coding-system
C-x RET t	set-terminal-coding-system
C-x RET x	set-selection-coding-system

C-x ESC ESC	repeat-complex-command
C-x M-:		repeat-complex-command

C-x 4 C-f	find-file-other-window
C-x 4 C-o	display-buffer
C-x 4 .		find-tag-other-window
C-x 4 0		kill-buffer-and-window
C-x 4 a		add-change-log-entry-other-window
C-x 4 b		switch-to-buffer-other-window
C-x 4 c		clone-indirect-buffer-other-window
C-x 4 d		dired-other-window
C-x 4 f		find-file-other-window
C-x 4 m		compose-mail-other-window
C-x 4 r		find-file-read-only-other-window

C-x 5 C-f	find-file-other-frame
C-x 5 C-o	display-buffer-other-frame
C-x 5 .		find-tag-other-frame
C-x 5 0		delete-frame
C-x 5 1		delete-other-frames
C-x 5 2		make-frame-command
C-x 5 b		switch-to-buffer-other-frame
C-x 5 d		dired-other-frame
C-x 5 f		find-file-other-frame
C-x 5 m		compose-mail-other-frame
C-x 5 o		other-frame
C-x 5 r		find-file-read-only-other-frame

C-x 8 RET	ucs-insert

C-x a C-a	add-mode-abbrev
C-x a '		expand-abbrev
C-x a +		add-mode-abbrev
C-x a -		inverse-add-global-abbrev
C-x a e		expand-abbrev
C-x a g		add-global-abbrev
C-x a i		Prefix Command
C-x a l		add-mode-abbrev
C-x a n		expand-jump-to-next-slot
C-x a p		expand-jump-to-previous-slot

C-x n d		narrow-to-defun
C-x n n		narrow-to-region
C-x n p		narrow-to-page
C-x n w		widen

C-x r C-@	point-to-register
C-x r SPC	point-to-register
C-x r +		increment-register
C-x r b		bookmark-jump
C-x r c		clear-rectangle
C-x r d		delete-rectangle
C-x r f		frame-configuration-to-register
C-x r g		insert-register
C-x r i		insert-register
C-x r j		jump-to-register
C-x r k		kill-rectangle
C-x r l		bookmark-bmenu-list
C-x r m		bookmark-set
C-x r n		number-to-register
C-x r o		open-rectangle
C-x r r		copy-rectangle-to-register
C-x r s		copy-to-register
C-x r t		string-rectangle
C-x r w		window-configuration-to-register
C-x r x		copy-to-register
C-x r y		yank-rectangle
C-x r C-SPC	point-to-register

C-x v +		vc-update
C-x v =		vc-diff
C-x v a		vc-update-change-log
C-x v b		vc-switch-backend
C-x v c		vc-rollback
C-x v d		vc-dir
C-x v g		vc-annotate
C-x v h		vc-insert-headers
C-x v i		vc-register
C-x v l		vc-print-log
C-x v m		vc-merge
C-x v r		vc-retrieve-tag
C-x v s		vc-create-tag
C-x v u		vc-revert
C-x v v		vc-next-action
C-x v ~		vc-revision-other-window

M-s h f		hi-lock-find-patterns
M-s h l		highlight-lines-matching-regexp
M-s h p		highlight-phrase
M-s h r		highlight-regexp
M-s h u		unhighlight-regexp
M-s h w		hi-lock-write-interactive-patterns

M-o M-S		center-paragraph
M-o M-o		font-lock-fontify-block
M-o M-s		center-line

M-g M-g		goto-line
M-g M-n		next-error
M-g M-p		previous-error

<C-down-mouse-2> <fc> b		facemenu-set-bold
<C-down-mouse-2> <fc> d		facemenu-set-default
<C-down-mouse-2> <fc> i		facemenu-set-italic
<C-down-mouse-2> <fc> l		facemenu-set-bold-italic
<C-down-mouse-2> <fc> o		facemenu-set-face
<C-down-mouse-2> <fc> u		facemenu-set-underline

<C-down-mouse-2> <fg> o		facemenu-set-foreground

<C-down-mouse-2> <bg> o		facemenu-set-background

<C-down-mouse-2> <sp> r		facemenu-set-read-only
<C-down-mouse-2> <sp> s		facemenu-remove-special
<C-down-mouse-2> <sp> t		facemenu-set-intangible
<C-down-mouse-2> <sp> v		facemenu-set-invisible

<C-down-mouse-2> <ju> b		set-justification-full
<C-down-mouse-2> <ju> c		set-justification-center
<C-down-mouse-2> <ju> l		set-justification-left
<C-down-mouse-2> <ju> r		set-justification-right
<C-down-mouse-2> <ju> u		set-justification-none

<C-down-mouse-2> <in> <decrease-left-margin>
				decrease-left-margin
<C-down-mouse-2> <in> <decrease-right-margin>
				decrease-right-margin
<C-down-mouse-2> <in> <increase-left-margin>
				increase-left-margin
<C-down-mouse-2> <in> <increase-right-margin>
				increase-right-margin

<f1> 4 i	info-other-window

<help> 4 i	info-other-window

C-x a i g	inverse-add-global-abbrev
C-x a i l	inverse-add-mode-abbrev


Function key map translations:
key             binding
---             -------

C-x		Prefix Command
<C-S-kp-1>	<C-S-end>
<C-S-kp-2>	<C-S-down>
<C-S-kp-3>	<C-S-next>
<C-S-kp-4>	<C-S-left>
<C-S-kp-6>	<C-S-right>
<C-S-kp-7>	<C-S-home>
<C-S-kp-8>	<C-S-up>
<C-S-kp-9>	<C-S-prior>
<C-S-kp-down>	<C-S-down>
<C-S-kp-end>	<C-S-end>
<C-S-kp-home>	<C-S-home>
<C-S-kp-left>	<C-S-left>
<C-S-kp-next>	<C-S-next>
<C-S-kp-prior>	<C-S-prior>
<C-S-kp-right>	<C-S-right>
<C-S-kp-up>	<C-S-up>
<M-backspace>	M-DEL
<M-clear>	C-M-l
<M-delete>	M-DEL
<M-escape>	M-ESC
<M-kp-next>	<M-next>
<M-linefeed>	C-M-j
<M-return>	M-RET
<M-tab>		M-TAB
<S-iso-lefttab>	<backtab>
<S-kp-down>	<S-down>
<S-kp-end>	<S-end>
<S-kp-home>	<S-home>
<S-kp-left>	<S-left>
<S-kp-next>	<S-next>
<S-kp-prior>	<S-prior>
<S-kp-right>	<S-right>
<S-kp-up>	<S-up>
<S-tab>		<backtab>
<backspace>	DEL
<clear>		C-l
<delete>	C-d
<escape>	ESC
<iso-lefttab>	<backtab>
<kp-0>		0
<kp-1>		1
<kp-2>		2
<kp-3>		3
<kp-4>		4
<kp-5>		5
<kp-6>		6
<kp-7>		7
<kp-8>		8
<kp-9>		9
<kp-add>	+
<kp-begin>	<begin>
<kp-decimal>	.
<kp-delete>	C-d
<kp-divide>	/
<kp-down>	<down>
<kp-end>	<end>
<kp-enter>	RET
<kp-equal>	=
<kp-home>	<home>
<kp-insert>	<insert>
<kp-left>	<left>
<kp-multiply>	*
<kp-next>	<next>
<kp-prior>	<prior>
<kp-right>	<right>
<kp-separator>	,
<kp-space>	SPC
<kp-subtract>	-
<kp-tab>	TAB
<kp-up>		<up>
<linefeed>	C-j
<return>	RET
<tab>		TAB

C-x @		Prefix Command

C-x @ S		event-apply-shift-modifier
C-x @ a		event-apply-alt-modifier
C-x @ c		event-apply-control-modifier
C-x @ h		event-apply-hyper-modifier
C-x @ m		event-apply-meta-modifier
C-x @ s		event-apply-super-modifier


Input decoding map translations:
key             binding
---             -------


=======================================

Key translations Starting With C-x:
key             binding
---             -------

C-x 8		iso-transl-ctl-x-8-map


Global Bindings Starting With C-x:
key             binding
---             -------

C-x C-@		pop-global-mark
C-x C-b		list-buffers
C-x C-c		save-buffers-kill-terminal
C-x C-d		list-directory
C-x C-e		eval-last-sexp
C-x C-f		find-file
C-x TAB		indent-rigidly
C-x C-k		kmacro-keymap
C-x C-l		downcase-region
C-x RET		Prefix Command
C-x C-n		set-goal-column
C-x C-o		delete-blank-lines
C-x C-p		mark-page
C-x C-q		toggle-read-only
C-x C-r		find-file-read-only
C-x C-s		save-buffer
C-x C-t		transpose-lines
C-x C-u		upcase-region
C-x C-v		find-alternate-file
C-x C-w		write-file
C-x C-x		exchange-point-and-mark
C-x C-z		suspend-frame
C-x ESC		Prefix Command
C-x $		set-selective-display
C-x '		expand-abbrev
C-x (		kmacro-start-macro
C-x )		kmacro-end-macro
C-x *		calc-dispatch
C-x +		balance-windows
C-x -		shrink-window-if-larger-than-buffer
C-x .		set-fill-prefix
C-x 0		delete-window
C-x 1		delete-other-windows
C-x 2		split-window-vertically
C-x 3		split-window-horizontally
C-x 4		ctl-x-4-prefix
C-x 5		ctl-x-5-prefix
C-x 6		2C-command
C-x 8		Prefix Command
C-x ;		comment-set-column
C-x <		scroll-left
C-x =		what-cursor-position
C-x >		scroll-right
C-x [		backward-page
C-x ]		forward-page
C-x ^		enlarge-window
C-x `		next-error
C-x a		Prefix Command
C-x b		switch-to-buffer
C-x d		dired
C-x e		kmacro-end-and-call-macro
C-x f		set-fill-column
C-x h		mark-whole-buffer
C-x i		insert-file
C-x k		kill-buffer
C-x l		count-lines-page
C-x m		compose-mail
C-x n		Prefix Command
C-x o		other-window
C-x q		kbd-macro-query
C-x r		Prefix Command
C-x s		save-some-buffers
C-x u		advertised-undo
C-x v		vc-prefix-map
C-x z		repeat
C-x {		shrink-window-horizontally
C-x }		enlarge-window-horizontally
C-x DEL		backward-kill-sentence
C-x C-SPC	pop-global-mark
C-x C-+		text-scale-adjust
C-x C--		text-scale-adjust
C-x C-0		text-scale-adjust
C-x C-=		text-scale-adjust
C-x <C-left>	previous-buffer
C-x <C-right>	next-buffer
C-x <left>	previous-buffer
C-x <right>	next-buffer

C-x RET C-\	set-input-method
C-x RET F	set-file-name-coding-system
C-x RET X	set-next-selection-coding-system
C-x RET c	universal-coding-system-argument
C-x RET f	set-buffer-file-coding-system
C-x RET k	set-keyboard-coding-system
C-x RET l	set-language-environment
C-x RET p	set-buffer-process-coding-system
C-x RET r	revert-buffer-with-coding-system
C-x RET t	set-terminal-coding-system
C-x RET x	set-selection-coding-system

C-x ESC ESC	repeat-complex-command
C-x M-:		repeat-complex-command

C-x 4 C-f	find-file-other-window
C-x 4 C-o	display-buffer
C-x 4 .		find-tag-other-window
C-x 4 0		kill-buffer-and-window
C-x 4 a		add-change-log-entry-other-window
C-x 4 b		switch-to-buffer-other-window
C-x 4 c		clone-indirect-buffer-other-window
C-x 4 d		dired-other-window
C-x 4 f		find-file-other-window
C-x 4 m		compose-mail-other-window
C-x 4 r		find-file-read-only-other-window

C-x 5 C-f	find-file-other-frame
C-x 5 C-o	display-buffer-other-frame
C-x 5 .		find-tag-other-frame
C-x 5 0		delete-frame
C-x 5 1		delete-other-frames
C-x 5 2		make-frame-command
C-x 5 b		switch-to-buffer-other-frame
C-x 5 d		dired-other-frame
C-x 5 f		find-file-other-frame
C-x 5 m		compose-mail-other-frame
C-x 5 o		other-frame
C-x 5 r		find-file-read-only-other-frame

C-x 8 RET	ucs-insert

C-x a C-a	add-mode-abbrev
C-x a '		expand-abbrev
C-x a +		add-mode-abbrev
C-x a -		inverse-add-global-abbrev
C-x a e		expand-abbrev
C-x a g		add-global-abbrev
C-x a i		Prefix Command
C-x a l		add-mode-abbrev
C-x a n		expand-jump-to-next-slot
C-x a p		expand-jump-to-previous-slot

C-x n d		narrow-to-defun
C-x n n		narrow-to-region
C-x n p		narrow-to-page
C-x n w		widen

C-x r C-@	point-to-register
C-x r SPC	point-to-register
C-x r +		increment-register
C-x r b		bookmark-jump
C-x r c		clear-rectangle
C-x r d		delete-rectangle
C-x r f		frame-configuration-to-register
C-x r g		insert-register
C-x r i		insert-register
C-x r j		jump-to-register
C-x r k		kill-rectangle
C-x r l		bookmark-bmenu-list
C-x r m		bookmark-set
C-x r n		number-to-register
C-x r o		open-rectangle
C-x r r		copy-rectangle-to-register
C-x r s		copy-to-register
C-x r t		string-rectangle
C-x r w		window-configuration-to-register
C-x r x		copy-to-register
C-x r y		yank-rectangle
C-x r C-SPC	point-to-register

C-x v +		vc-update
C-x v =		vc-diff
C-x v a		vc-update-change-log
C-x v b		vc-switch-backend
C-x v c		vc-rollback
C-x v d		vc-dir
C-x v g		vc-annotate
C-x v h		vc-insert-headers
C-x v i		vc-register
C-x v l		vc-print-log
C-x v m		vc-merge
C-x v r		vc-retrieve-tag
C-x v s		vc-create-tag
C-x v u		vc-revert
C-x v v		vc-next-action
C-x v ~		vc-revision-other-window

C-x a i g	inverse-add-global-abbrev
C-x a i l	inverse-add-mode-abbrev


Function key map translations Starting With C-x:
key             binding
---             -------

C-x @		Prefix Command

C-x @ S		event-apply-shift-modifier
C-x @ a		event-apply-alt-modifier
C-x @ c		event-apply-control-modifier
C-x @ h		event-apply-hyper-modifier
C-x @ m		event-apply-meta-modifier
C-x @ s		event-apply-super-modifier





* http://code.google.com/p/yasnippet/
 
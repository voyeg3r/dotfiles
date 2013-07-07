link oficial
http://fueledbylemons.com/blog/2011/07/27/why-ultisnips/

  Para mostrar uma lista das complementações possíveis
  pressione no modo insert

		Ctrl-Tab

  Para editar snippets use o comandos

       :UltisnipsEdit

  Para definir um snippet novo digite

       snip<tab>

  Para expandir um snip digite

      palavra<tab>

  Para pular para o próximo snippet

      Ctrl-j

  Para voltar para o snippet anterior

      Ctrl-k

== Conditional replacements ==

One feature that I didn't mention in the screencast are conditional
replacements. When you capture a group in the search part of a
replacement, you can check if it was matched in the replacement like
so: (?<number>:yes text:no text). yes text will be inserted if the
group was matched, otherwise no text will be inserted. A quick
example:

	snippet cond
	${1:some_text}${1/(o)|(t)|..*/(?1:ne)(?2:wo)/}
	endsnippet

The transformation will match a o at the beginning into group 1 or a t
at the beginning in group 2. The rest of the search string just
matches everything of the first tabstop. The replacement will either
be ne when a o was matched, wo when a t was matched or an empty
string. That means that you can just type a t to quickly get two as
the complete content of the snippet or a o to get one. If you type
anything else, you only get the content of the place holder, i.e. the
verbatim of what you typed.

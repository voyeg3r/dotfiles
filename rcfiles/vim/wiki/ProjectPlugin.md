### Descrição do plugin Projet

 Plugin projet

    :Projet name

O mesmo abrirá uma janela, dentro da mesma digite \C para iniciar a criação de um projeto

   1. Digite :Project ........... carrega o plugin
   2. Type \C ................... Para iniciar a rotina de criação de um projeto
   3. Digite o nome do projeto
   4. Digite o caminho (e.g. /Users/me/Development/RailsApp)
   5. Digite . como CD parâmetro.
   6. Digite *.py para que apareçam apenas arquivos python (um exemplo).

   Para salvar o status do plugin :w

   Para mostrar um status do projeto \i

  " Exemplos de mapeamentos possíveis para o seu .vimrc
  "  ------ ------ --------
  " Project
  "  ------ ------ --------
  map < A-S-p> :Project< CR>
  map < A-S-o> :Project< CR>:redraw< CR>/
  nmap < silent> < F3> < Plug>ToggleProject
  let g:proj_window_width = 30
  let g:proj_window_increment = 50
  " habilitar e desabilitar o plugin
  nmap < silent> ,p < Plug>ToggleProject< cr>


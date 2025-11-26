Iniciar uma nova sessão

bash
tmux
ou com nome:

bash
tmux new -s nome_sessao
Listar sessões ativas

bash
tmux ls
Reconectar a uma sessão existente

bash
tmux attach -t nome_sessao
Encerrar uma sessão Dentro da sessão:

bash
exit
ou de fora:

bash
tmux kill-session -t nome_sessao
 Atalhos dentro do tmux
Todos começam com a tecla prefixo (por padrão Ctrl+b):

Criar nova janela → Ctrl+b c

Trocar de janela → Ctrl+b n (next) ou Ctrl+b p (previous)

Listar janelas → Ctrl+b w

Dividir painel vertical → Ctrl+b %

Dividir painel horizontal → Ctrl+b "

Mover entre painéis → Ctrl+b + seta (← ↑ → ↓)

Fechar painel → Ctrl+b x

Redimensionar painel → Ctrl+b + Alt + setas

Desanexar da sessão (sem encerrar) → Ctrl+b d

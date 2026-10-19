# Mundo das Páginas — Biblioteca escolar

Versão 0.1 — aplicação web estática em português brasileiro.

## Executar no computador

1. Extraia o ZIP.
2. Abra a pasta no VS Code.
3. Abra `index.html` no navegador. Também pode usar a extensão **Live Server** no VS Code, mas não é obrigatório.
4. Os dados são salvos no `localStorage` do navegador.

Não precisa instalar Python, Node.js, npm ou servidor.

## O que está implementado nesta versão

- Painel inicial com números calculados a partir dos dados locais.
- Catálogo com cadastro, edição, busca e filtro de livros.
- Controle da quantidade de exemplares disponíveis.
- Cadastro e edição de leitores com perfil, turma, livros lidos e XP.
- Empréstimos, datas de devolução, atrasos e registro de devolução.
- Reservas com status e encaminhamento da fila quando um exemplar é devolvido.
- Avaliações e recomendações com nota; novas avaliações aguardam moderação.
- Aprovação e remoção de avaliações.
- Desafios de leitura com progresso derivado dos dados locais.
- Relatórios do acervo e da circulação.
- Exportação de backup JSON, restauração de backup e exportação CSV de empréstimos.
- Configurações de nome da biblioteca e prazo de empréstimo.
- Layout responsivo para computador e celular.
- Dados fictícios de demonstração.

## Limitações importantes

Esta versão é um **núcleo local funcional**, não uma plataforma multiusuário pronta para uso institucional. O armazenamento pertence ao navegador/dispositivo atual. Limpar os dados do navegador pode apagar os registros. O seletor de perfil serve somente para testar telas e **não é autenticação**. Não insira dados pessoais reais de estudantes.

O GitHub Pages hospeda arquivos estáticos; sozinho, não oferece banco de dados compartilhado, autenticação ou sincronização. O modo compartilhado exige backend, por exemplo Supabase, com autenticação, banco de dados, políticas RLS e testes de autorização. O frontend deste pacote não finge que essa integração está ativa.

## Publicar a interface no GitHub Pages

1. Crie um repositório no GitHub.
2. Envie `index.html`, `styles.css` e `app.js` para a raiz do repositório.
3. Em **Settings → Pages**, selecione a branch e a pasta raiz.
4. Salve e aguarde a publicação.
5. Para uma instalação institucional, configure antes um backend real e revise privacidade e permissões.

## Backup e restauração

- Em **Configurações**, selecione **Exportar backup JSON** para baixar os dados locais.
- Use **Restaurar backup** para importar um arquivo exportado anteriormente. A restauração substitui os dados atuais; a aplicação pede confirmação.
- Em **Relatórios**, exporte os empréstimos em CSV para abrir em uma planilha.

## Testes manuais sugeridos

1. Abra `index.html` e confirme que o painel aparece.
2. Cadastre um livro e confira se ele aparece no catálogo.
3. Cadastre um estudante.
4. Registre um empréstimo e confirme a redução de exemplares disponíveis.
5. Registre a devolução e confirme o aumento de exemplares disponíveis.
6. Crie uma avaliação e aprove-a na Comunidade.
7. Exporte um backup, restaure-o e confira se os registros continuam presentes.
8. Recarregue a página e confirme a persistência local.

Os testes acima são uma lista para execução pelo usuário; não são alegados como testes automatizados já executados.

## Próximas etapas recomendadas

- Separar exemplares por código de patrimônio, não apenas por quantidade agregada.
- Criar autenticação real e permissões por papel no backend.
- Migrar dados para tabelas compartilhadas e configurar RLS.
- Adicionar histórico de auditoria, multas/regras de atraso se a escola desejar, importação de catálogo e relatórios por período.
- Criar testes automatizados dos fluxos críticos e testes de segurança.
- Revisar acessibilidade e política de privacidade com a instituição.

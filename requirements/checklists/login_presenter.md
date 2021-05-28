# Login Presenter

# ICONS
    ✅ Ok
    🔴 Pendente
    
> ## Regras
1. ✅ Chamar validation ao alterar o email
2. ✅ Notificar o emailErrorStream com o mesmo erro do validation, caso retorne erro
3. ✅ Notificar o emailErrorStream com null caso o validation não retorne erro
4. ✅ Não Notificar o emailErrorStream se o valor for igual ao último
5. ✅ Notificar o isFormnValidStream após alterar o email
6. ✅ Chamar VAlidation ao alterar a senha
7. ✅ Notificar o passwordErrorStream com o mesmo erro do validation, caso retorne erro
8. ✅ Notificar o passwordErrorStream com null caso o validation não retorne erro
9. ✅ Não Notificar o passwordErrorStream se o valor for igual ao último
10. ✅ Notificar o isFormnValidStream após alterar a senha
11. ✅ Para o formulário estar válido todos os Strems de erro precisa estar null e todos os campos obrigatórios não podem, estar vazios
12. ✅ Não notificar o isFormnValidStream se o valor for igual ao último
13. ✅ Chamar o Authentication com email e senha corretos
14. ✅ Notificar o isLoadingStream como true antes de chamar o Authentication
15. ✅ Notificar o isLoadingStream como false ao fim do Authentication
16. ✅ Notificar o mainErrorStream caso o Authentication retorno um DomainError
17. ✅ Fechar todos os Stresm no dispose
18. ✅ Gravar o Account no cache em caso de sucesso
19. ✅ Notificar o mainErrotStream caso o SaveCurrentAccount retorne erro
20. ✅ Levar o usuário para a tela de Enquetes cm caso de sucesso



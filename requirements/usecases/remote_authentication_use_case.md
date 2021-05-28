# Remote Authentication Use Case

# ICONS
    ✅ Ok
    🔴 Pendente
    
> ## Caso de sucesso
1. ✅ Sistema valida os dados
2. ✅ Sistema faz uma requisição para a URL da API de login
3. ✅ Sistema valida os dados recebidos da API
4. ✅ Sistema entrega os dados da conta do usuário

> ## Exceção - URL inválida "Error 400 - NotFound"
1. ✅ Sistema retorna uma mensagem de erro inesperado 400

> ## Exceção - Dados inválidos "Error 404 - BadRequest"
1. ✅ Sistema retorna uma mensagem de erro inesperado 404

> ## Exceção - Resposta inválida
1. ✅ Sistema retorna uma mensagem de erro inesperado 401

> ## Exceção - Falha no servidor "Error 500 - ServerError"
1. ✅ Sistema retorna uma mensagem de erro inesperado 500

> ## Exceção - Credenciais inválidas "Error 401 InvalidCredentialsError"
1. ✅ Sistema retorna uma mensagem de erro informando que as credenciais estão erradas


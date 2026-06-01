---
name: Criação de Planos 
interaction: chat 
description: Gera planos com base na especificação do usuário
opts:
  alias: create-plan
  auto_submit: false
  placement: new
  stop_context_insertion: true
# mcp_servers:

---

## system

Gerar um plano técnico com base nas instruções e demanda do usuário.
Quando este comando for executado:

## ETAPA 1 — Análise

Você deve:

1. Analisar o código existente
2. Identificar:
   - domínio impactado
   - arquivos afetados
   - arquitetura existente
   - padrões utilizados
   - dependências
   - riscos

---

## ETAPA 2 — Delegação técnica

- estratégia de implementação
- plano incremental
- riscos
- casos de borda
- testes necessários

---

## ETAPA 3 — Criação do plano markdown

Criar arquivo em:

```txt
.github/plans/ativo/<slug>.md
```

---

# TEMPLATE OBRIGATÓRIO DO PLANO

```md
# Objetivo

# Contexto

# Problema atual

# Resultado esperado

# Regras de negócio

# Fluxo funcional

# Arquivos impactados

# Estratégia técnica

# Alterações necessárias

# Etapas de implementação

# Casos de borda

# Impactos colaterais

# Testes necessários

# Riscos

# Observações
```

---

# REGRAS DO PLANO

O plano deve:
- ser técnico
- ser detalhado
- conter implementação incremental
- evitar ambiguidades
- listar arquivos específicos
- listar riscos reais

O plano NÃO deve:
- criar código imediatamente
- criar task Jira
- criar branch
- iniciar implementação

---

# APÓS CRIAR O PLANO

Você deve:

1. Parar execução
2. Solicitar revisão humana

Mensagem obrigatória:

```txt
Plano técnico criado com sucesso.
Revise o arquivo antes de criar a task Jira.
```

## user

@{dommus_jira} 

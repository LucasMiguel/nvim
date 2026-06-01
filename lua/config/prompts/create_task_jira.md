---
name: Criação da Task no Jira
interaction: chat 
description: Gera uma task no jira com base no plano
opts:
  alias: create-task-jira
  auto_submit: false
  placement: new
  stop_context_insertion: true
# mcp_servers:

---

## system

---
## ETAPA 1 — Ler o plano

Ler o markdown informado.

---

## ETAPA 2 — Converter linguagem

Transformar:
- linguagem técnica
- arquitetura
- detalhes internos

em:

- descrição funcional
- linguagem orientada a produto
- critérios de aceite
- impacto de negócio

---

# TEMPLATE DA TASK JIRA

## Objetivo

Descrição funcional simples e objetiva.

---

## Contexto

Problema de negócio resolvido.

---

## Escopo

O que será alterado.

---

## Critérios de aceite

- [ ]
- [ ]
- [ ]

---

## Observações técnicas

Referenciar apenas informações orientadas ao produto e rastreabilidade:
- Link para o plano técnico detalhado (ex.: `Plano técnico detalhado: .github/plans/<slug>.md`)
- Integrações externas envolvidas (ex.: qual API, serviço ou fluxo análogo)
- Origem de dados relevante para o negócio (ex.: de onde vêm os tokens, registros ou configurações)
- Analogias com fluxos já existentes no sistema

NÃO incluir detalhes internos de implementação como versão de PHP, padrões de código ou restrições de sintaxe.

---

# CONFIGURAÇÕES DA ISSUE

## Tipo

Incremento

## Board

DESENVOLVIMENTO 2026

## Sprint

Sprint ativa

## Status inicial

Em andamento

## Responsável

Usuário autenticado no Jira

---

# APÓS CRIAR A ISSUE

Você deve:

1. Obter a chave Jira
2. Gerar slug kebab-case
3. Criar branch git

---

# PADRÃO DA BRANCH

Formato:

```txt
<ISSUE>-<slug>
```

Exemplo:

```txt
D2K25-1407-vincular-comissao-usuario-rh
```

---

# COMANDO GIT OBRIGATÓRIO

```bash
git checkout -b <ISSUE>-<slug>
```

---

# APÓS CRIAR A BRANCH

Você deve responder:

```txt
Task Jira criada com sucesso.
Branch criada e pronta para implementação.
```

---

## user

@{dommus_jira} 

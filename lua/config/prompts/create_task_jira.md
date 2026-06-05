---
name: Criar Task Jira
interaction: chat
description: Cria uma task Jira baseada em um plano aprovado
opts:
  alias: criar-task-jira
  placement: new
  auto_submit: false
  stop_context_insertion: true
---

## system

Leia o plano informado.

Fluxo obrigatório:

1. Ler o plano
2. Converter linguagem técnica para funcional
3. Criar issue Jira
4. Obter chave Jira
5. Gerar slug
6. Criar branch

Template Jira:

# Objetivo

# Contexto

# Escopo

# Critérios de aceite

# Observações técnicas

Configuração:

Tipo: tarefa

Board: DESENVOLVIMENTO 2026 (caso o quadro não seja passado) 

Status: Em andamento

Sprint: Sprint ativa

Após criar a issue:

Executar:

git checkout -b <ISSUE>-<slug>

Responder:

Task Jira criada com sucesso.
Branch criada e pronta para implementação.

## user

@{dommus_jira}

$input

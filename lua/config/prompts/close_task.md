---
name: Finalizar Task
interaction: chat
description: Finaliza uma task e gera documentação de entrega
opts:
  alias: finalizar-task
  placement: new
  auto_submit: false
  stop_context_insertion: true
---

## system

Fluxo obrigatório:

1. Ler git diff
2. Ler arquivos alterados
3. Produzir summary técnico

Verificar:

- novos padrões
- novas dependências
- mudanças arquiteturais

Caso existam mudanças arquiteturais:

Criar:

.github/adr/<ISSUE>-<slug>.md

Template:

# ADR

## Status

Aceito

## Contexto

## Decisão

## Consequências

Gerar commit:

<tipo>(<escopo>): descrição

Refs: <ISSUE>

Gerar PR:

# Objetivo

# Alterações

# Como testar

# Jira

# Plano técnico

Mover:

.github/plans/ativo/<slug>.md

para:

.github/plans/archive/<ISSUE>-<slug>.md

Nunca deletar o plano.

## user

@{dommus_jira}

$input

---
name: Implementar Task
interaction: chat
description: Implementa uma task baseada em um plano aprovado
opts:
  alias: implementar-task
  placement: new
  auto_submit: false
  stop_context_insertion: true
---

## system

Validações obrigatórias:

- existe plano
- existe branch ativa
- branch segue padrão Jira

Se alguma falhar:

interromper execução

Implementar seguindo rigorosamente o plano.

## user

@{implement}

$input

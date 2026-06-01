---
name: Finalização de uma task
interaction: chat 
description: Finalizado uma demanda
opts:
  alias: close-task
  auto_submit: false
  placement: new
  stop_context_insertion: true
# mcp_servers:

---

## system

## ETAPA 1 — Leitura do diff

Executar `git diff` para identificar todos os arquivos modificados e o conteúdo das alterações.

---

## ETAPA 2 — Leitura dos arquivos alterados

Ler o conteúdo atual dos arquivos alterados para compreender o impacto completo da implementação.

---

## ETAPA 3 — Geração do summary

Produzir um resumo técnico com:
- o que foi implementado
- arquivos criados, alterados ou removidos
- integrações ou dependências afetadas
- comportamento antes e depois

---

## ETAPA 4 — Detecção de mudanças arquiteturais

Avaliar se a implementação introduz:
- novos padrões ou convenções
- novas dependências externas
- mudanças de contrato (rotas, payloads, models)
- alterações em fluxos críticos existentes

---

## ETAPA 5 — Criação de ADR (se necessário)

Se mudanças arquiteturais forem detectadas, criar um ADR em:

```txt
.github/adr/<ISSUE>-<slug>.md
```

Template do ADR:

```md
# ADR — <título>

## Status
Aceito

## Contexto
Descrição do problema ou necessidade que motivou a decisão.

## Decisão
O que foi decidido e implementado.

## Consequências
Impactos positivos e negativos da decisão.
```

---

## ETAPA 6 — Sugestão de commit message

Gerar mensagem de commit seguindo Conventional Commits em português:

```txt
<tipo>(<escopo>): <descrição curta>

<corpo opcional com detalhes>

Refs: <ISSUE>
```

Tipos permitidos: `feat`, `fix`, `chore`, `refactor`, `docs`, `test`

---

## ETAPA 7 — Sugestão de PR description

Gerar descrição de PR com:
- objetivo funcional
- o que foi alterado
- como testar
- referência à issue Jira
- referência ao plano técnico

---

## ETAPA 8 — Arquivamento do plano

Mover o plano de:

```txt
.github/plans/ativo/<slug>.md
```

Para:

```txt
.github/plans/archive/<ISSUE>-<slug>.md
```

O arquivo deve ser **movido**, nunca deletado.

---

## user
@{dommus_jira}

![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/wendel315/appmonitor-pipeline/ci.yml?branch=main)


# AppMonitor Pipeline

Este repositório contém os workflows de CI/CD para o projeto AppMonitor.

## Papel do Git na entrega contínua
O Git é a base para versionamento e colaboração:
- **Branches** isolam features, correções e configurações de CI.
- **Tags** marcam versões estáveis e facilitam rollbacks.

## Importância de branches e tags
- **Branches** permitem revisão por pull request antes de mesclar na `main`.
- **Tags** servem como checkpoints (ex.: `v0.1.0`), acionando releases automáticas.

## Etapas Desenvolvidas

### Etapa 1: Controle de versão com Git e organização do repositório
- Inicialização do repositório e criação da branch `ci/setup`.
- Dois commits reais: adição do script `status-check.sh` e do `README.md` inicial.
- Criação da tag `v0.1.0` e release no GitHub com título, descrição e changelog.
- Explicação no README sobre o papel do Git, branches e tags.

### Etapa 2: Pipeline de integração contínua
- Workflow `ci.yml` acionado em push na `main` e pull request.
- Job `validate`: valida sintaxe do script com `bash -n`.
- Job `test`: simula execução de testes.
- Job `package`: empacota artefato em `report.zip` e faz upload com `actions/upload-artifact@v4`.

### Etapa 3: Uso de variáveis, secrets e contextos
- Definição de variáveis (`APP_ENV`, `SUPPORT_EMAIL`) em Settings → Variables.
- Definição de segredo (`API_KEY`) em Settings → Secrets.
- Workflow `run-monitor.yml` demonstrando `vars`, `env` e `secrets`.
- Explicação das diferenças entre contextos no README.

### Etapa 4: Monitoramento, logs de debug e resumos automatizados
- Ativação de `ACTIONS_STEP_DEBUG=true` para logs de debug.
- Uso de mensagens `::warning::` e `::error::`.
- Adição do job `summary` para gerar relatório consolidado.
- Inclusão de badge de status do workflow.

### Etapa 5: Permissões e deploy com aprovação manual
- Criação do ambiente `production` com variável `PROD_DOMAIN` e aprovação manual.
- Workflow `deploy.yml` configurado para pausar até aprovação no ambiente.
- Uso do contexto `vars.PROD_DOMAIN` no script de deploy.

### Etapa 6: Diagnóstico automatizado de falhas
- Workflow `diagnostic.yml` que:
    - Mapeia `vars` e `secrets` para variáveis de ambiente.
    - Verifica variáveis obrigatórias e falha com `::error::` se faltarem.
    - Registra logs de debug com `::debug::`.
    - Gera relatório no `GITHUB_STEP_SUMMARY` com instruções de correção.

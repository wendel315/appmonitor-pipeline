![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/wendelMarins/appmonitor-pipeline/ci.yml%3Fbranch%3Dmain))

# AppMonitor Pipeline

Este repositório contém os workflows de CI/CD para o projeto AppMonitor.

## Papel do Git na entrega contínua
O Git é a base para versionamento e colaboração:
- **Branches** isolam features, correções e configurações de CI.
- **Tags** marcam versões estáveis e facilitam rollbacks.

## Importância de branches e tags
- **Branches** permitem revisão por pull request antes de mesclar na `main`.
- **Tags** servem como checkpoints (ex.: `v0.1.0`), acionando releases automáticas.

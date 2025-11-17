# Desafio-Medusa
Desafio DIO kali linux com medusa

Este repositório documenta o desafio proposto pela DIO utilizando Kali Linux e a ferramenta Medusa para simular ataques de força bruta em ambiente controlado. O objetivo é demonstrar o entendimento prático sobre auditoria de serviços, enumeração, testes de autenticação e medidas de mitigação.

Este laboratório foi executado exclusivamente em máquinas virtuais isoladas, sem qualquer interação com redes reais.

1. Ambiente de Laboratório

Foi configurado um ambiente local com duas máquinas virtuais no VirtualBox, utilizando rede Host-Only:

Máquina de Ataque – Kali Linux

Sistema: Kali Linux

IP utilizado no laboratório: 192.168.56.10

Máquina Alvo – Metasploitable 2 (com DVWA)

Sistema: Ubuntu vulnerável com múltiplos serviços expostos

IP utilizado no laboratório: 192.168.56.101

A comunicação ocorreu apenas dentro da rede privada fornecida pelo VirtualBox.

2. Enumeração Inicial

A primeira etapa consistiu na identificação de portas abertas e serviços ativos no alvo, utilizando Nmap.
A varredura identificou serviços comuns para auditoria, como:

FTP (porta 21)

HTTP (porta 80) – utilizado para acessar o DVWA

SMB (portas 139/445)

SSH e outros serviços padrão do Metasploitable

Essa enumeração é essencial para direcionar os testes de autenticação.

3. Testes de Força Bruta

Foram realizados três cenários principais de ataque utilizando o Medusa.

3.1. FTP (porta 21)

Foi realizado um teste de força bruta contra o serviço FTP utilizando uma wordlist personalizada.
O objetivo era verificar a existência de credenciais fracas, como o usuário padrão msfadmin.

Wordlist utilizada:

wordlists/ftp-pass.txt

3.2. Formulário Web – DVWA (Low Security)

Com o DVWA configurado no nível de segurança “Low”, foi testado um ataque de força bruta direcionado ao formulário de login da aplicação.

Wordlist utilizada:

wordlists/dvwa.txt

Diretório do ataque:

/DVWA/vulnerabilities/brute/

3.3. SMB (Password Spraying)

Foi realizado um ataque de "password spraying", em que uma única senha é testada contra vários usuários disponíveis no serviço SMB.

Wordlists utilizadas:

wordlists/users.txt

wordlists/spraying.txt

Esse teste simula um cenário comum em redes corporativas com usuários e senhas fracas.

4. Automação

Um script simples foi criado para automatizar os testes de força bruta do projeto.
O script está localizado em:

scripts/auto_medusa.sh

Ele consolida os comandos de teste contra FTP, DVWA e SMB, facilitando a repetição do processo em ambiente de laboratório.

5. Recomendações de Mitigação

Durante os testes, foi possível identificar a importância de práticas essenciais de segurança, como:

Uso de senhas fortes e políticas de complexidade

Bloqueio após tentativas incorretas de login

Remoção de serviços inseguros, como FTP

Proteção de aplicações web com mecanismos como rate limiting e Captcha

Configuração adequada de serviços SMB

Monitoramento contínuo de eventos de autenticação

Essas medidas reduzem significativamente a probabilidade de compromissos bem-sucedidos por ataques de força bruta.

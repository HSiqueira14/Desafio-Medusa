# Desafio-Medusa
Desafio DIO kali linux com medusa

Ambiente de Laboratório

- Máquina de ataque (Kali Linux)
  - IP de exemplo: `192.168.0.15`
- Máquina alvo (ex.: Metasploitable 2 / DVWA)
  - IP de exemplo utilizado na documentação: `192.168.0.15` (pode ser outro no seu lab)

---

##  Enumeração (Nmap)

Exemplo de varredura:

```bash
nmap -sV -O -Pn 192.168.0.15

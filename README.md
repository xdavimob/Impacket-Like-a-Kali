## 📄 README.md


# 🐍 Impacket Like a Kali

💥 **Objetivo:** Permitir que qualquer usuário de Linux (Ubuntu, Debian, Arch, Fedora etc.) tenha todos os scripts do [Impacket](https://github.com/fortra/impacket) disponíveis como comandos no formato `impacket-*`, exatamente como acontece no Kali Linux — mas em qualquer distro.

✅ Ideal para pentesters, red teamers, sysadmins e qualquer curioso que precisam do Impacket pronto para uso sem poluir o sistema com dependências.

---

## ✨ O que o projeto faz

- Cria wrappers para todos os scripts do Impacket no formato:
  ```bash
  impacket-secretsdump -h
  impacket-psexec -h
  impacket-wmiexec -h
  ```


* Os scripts rodam **sempre dentro de um ambiente virtual isolado (venv)**.
* Você não precisa mais navegar até a pasta `examples/` nem se preocupar em ativar o `venv` manualmente.
* Atualização simples: `git pull` + `pip install -U .`

---

## 🚀 Passo a passo rápido

1️⃣ Clone este repositório em qualquer lugar ou apenas baixe o script:

```bash
curl -O https://raw.githubusercontent.com/xdavimob/impacket-like-a-kali/main/setup-impacket-like-kali.sh
chmod +x setup-impacket-like-kali.sh
```

2️⃣ Execute o script:

```bash
./setup-impacket-like-kali.sh
```

3️⃣ Abra um novo terminal ou recarregue seu shell:

```bash
source ~/.zshrc ou source ~/.bashrc
```

4️⃣ Teste:

```bash
impacket-secretsdump -h
impacket-psexec -h
impacket-wmiexec -h
```

✅ Você agora terá todos os scripts do Impacket disponíveis como binários, como se estivesse usando o Kali!

---

## 🔎 O que o script faz

✔️ Cria o diretório `~/Tools` (ou outro à sua escolha)

✔️ Clona o repositório oficial do Impacket

✔️ Cria um ambiente virtual isolado (`venv`)

✔️ Instala todas as dependências do Impacket

✔️ Cria wrappers executáveis para todos os scripts no formato `impacket-*` em `~/bin/impacket/`

✔️ Adiciona `~/bin/impacket` ao PATH no `~/.zshrc`, se necessário

✔️ Nenhuma dependência é instalada globalmente no sistema — tudo fica isolado no `venv` do Impacket

---

## 📦 Atualizando o Impacket no futuro

1️⃣ Navegue até a pasta do Impacket:

```bash
cd ~/Tools/impacket
```

2️⃣ Atualize o repositório:

```bash
git pull
```

3️⃣ Atualize o ambiente virtual:

```bash
source venv/bin/activate
pip install -U .
```

---

## 🔥 Por que usar isso?

✔️ Scripts sempre atualizados direto do Impacket oficial

✔️ Sem poluir seu sistema com pacotes globais

✔️ Facilidade para red team e pentest, mesmo em distros minimalistas

✔️ Experiência idêntica ao Kali Linux em qualquer ambiente

---

## ✅ Pré-requisitos

* Linux com Python 3 instalado
* Ferramentas básicas: `git`, `curl`

---

## 📚 Créditos

* [Impacket](https://github.com/fortra/impacket) — suíte oficial
* Inspirado no ambiente padrão do Kali Linux

---

> 🚀 **PRs, issues e sugestões são bem-vindos!**


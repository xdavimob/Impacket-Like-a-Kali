## 📄 README.md


# 🐍 Impacket Like a Kali

💥 **Purpose:** Allow any Linux user (Ubuntu, Debian, Arch, Fedora, etc.) to have all [Impacket](https://github.com/fortra/impacket) scripts available as `impacket-*` commands, just like in Kali Linux — but on any distro.

✅ Perfect for pentesters, red teamers, sysadmins, or anyone who needs Impacket ready to use without cluttering their system with global dependencies.

---

## ✨ What this project does

- Creates wrappers for all Impacket scripts in the format:
  ```bash
  impacket-secretsdump -h
  impacket-psexec -h
  impacket-wmiexec -h
  ```


* Scripts always run inside an isolated virtual environment (venv).
* No need to manually navigate to the examples/ folder or activate the venv.
* Easy updates: `git pull` + `pip install -U .`

---

## 🚀 Quick setup

1️⃣ Download the script anywhere on your system:

```bash
curl -O https://raw.githubusercontent.com/xdavimob/impacket-like-a-kali/main/setup-impacket-like-kali.sh
chmod +x setup-impacket-like-kali.sh
```

2️⃣ Run the script:

```bash
./setup-impacket-like-kali.sh
```

3️⃣ Open a new terminal or reload your shell:

```bash
source ~/.zshrc or source ~/.bashrc
```

4️⃣ Test it:

```bash
impacket-secretsdump -h
impacket-psexec -h
impacket-wmiexec -h
```

✅ You now have all Impacket scripts available as binaries, just like on Kali!

---

## 🔎 What the script does

✔️ Creates the `~/Tools` directory (or another one you choose)

✔️ Clones the official Impacket repository

✔️ Creates an isolated virtual environment (venv)

✔️ Installs all Impacket dependencies in the venv

✔️ Generates executable wrappers for all scripts in the impacket-* format inside ~/bin/impacket/

✔️ Adds ~/bin/impacket to your PATH in ~/.zshrc if needed

✔️ Keeps your system clean — all dependencies are isolated in the Impacket venv

---

## 📦 Updating Impacket later

1️⃣ Navigate to your Impacket folder:

```bash
cd ~/Tools/impacket
```

2️⃣ Pull the latest updates:

```bash
git pull
```

3️⃣ Update the virtual environment:

```bash
source venv/bin/activate
pip install -U .
```

---

## 🔥 Why use this?

✔️ Always up-to-date scripts directly from the official Impacket

✔️ Keeps your system clean from unnecessary global packages

✔️ Easy setup for red teaming and pentesting, even on minimal distros

✔️ Brings the Kali Linux experience to any Linux environment

---

## ✅ Requirements

* Linux with Python 3 installed
* The `python3-venv` package installed (required to create a virtual environment)
    - On Debian/Ubuntu: `sudo apt install python3-venv`
    - On Fedora: `sudo dnf install python3-venv`
    - On Arch: `sudo pacman -S python-virtualenv`
* Basic tools: `git`, `curl`

---

## 📚 Credits

* [Impacket](https://github.com/fortra/impacket) — the official suite
* Inspired by the default experience on Kali Linux

---

> 🚀 **PRs, issues and suggestions are welcome!**

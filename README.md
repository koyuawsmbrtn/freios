# <picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/koyuawsmbrtn/freios/refs/heads/main/assets/freios_dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/koyuawsmbrtn/freios/refs/heads/main/assets/freios.svg">
  <img alt="freiOS" src="https://raw.githubusercontent.com/koyuawsmbrtn/freios/refs/heads/main/assets/freios.svg">
</picture>

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/2503a44c1105456483517f793af75ee7)](https://app.codacy.com/gh/koyuawsmbrtn/freios/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)  
[![Stable Images](https://github.com/koyuawsmbrtn/freios/actions/workflows/build-image-stable.yml/badge.svg)](https://github.com/koyuawsmbrtn/freios/actions/workflows/build-image-stable.yml)  

> „Evolution ist ein Prozess ständiger Verzweigung und Expansion.“ – Stephen Jay Gould  

Für Endnutzer bietet freiOS ein System mit der Zuverlässigkeit eines Chromebooks und nahezu keinem Wartungsaufwand.  

Für Entwickler ermöglicht es einen leistungsstarken, cloudnativen Entwicklungsworkflow.

- [freiOS Website](https://freios.koyu.space)

## Secure Boot  

Secure Boot wird standardmäßig unterstützt und bietet eine zusätzliche Sicherheitsebene.  
Nach der ersten Installation wirst du aufgefordert, den Secure-Boot-Schlüssel im BIOS zu registrieren.  

Gib das Passwort `universalblue` ein, wenn du dazu aufgefordert wirst.  

Falls dieser Schritt während der Ersteinrichtung übersprungen wird, kannst du den Schlüssel manuell mit folgendem Befehl im Terminal registrieren:  

```bash
ujust enroll-secure-boot-key
```

Secure Boot wird mit unserem benutzerdefinierten Schlüssel unterstützt.
Der öffentliche Schlüssel kann im Root-Verzeichnis des Akmods-Repositorys [hier](https://github.com/ublue-os/akmods/raw/main/certs/public_key.der) gefunden werden.
Falls du den Schlüssel bereits vor der Installation oder einem Rebase registrieren möchtest, lade ihn herunter und führe folgende Befehle aus:

```bash
sudo mokutil --timeout -1
sudo mokutil --import public_key.der
```

## Das aktuelle Image rebasen

Du willst von einer bestehenden Installation von Universal Blue (wie z.B. Bazzite) auf freiOS migrieren? Das ist ganz einfach!

```bash
rpm-ostree reset
rpm-ostree rebase ostree-unverified-registry:ghcr.io/koyuawsmbrtn/freios:stable
```

Oder wenn du eine Grafikkarte von NVIDIA in deinem Computer hast:

```bash
rpm-ostree reset
rpm-ostree rebase ostree-unverified-registry:ghcr.io/koyuawsmbrtn/freios-nvidia:stable
```

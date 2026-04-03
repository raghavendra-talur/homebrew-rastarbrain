# homebrew-rastarbrain

Homebrew tap for the `rastarbrain` macOS server install.

## Install

```bash
brew tap raghavendra-talur/rastarbrain
brew install rastarbrain
brew services start rastarbrain
```

Open `http://127.0.0.1:9002` after the service starts.

If the UI asks for an admin token:

```bash
rastarbrain admin-token --raw
```

## Update

```bash
brew update
brew upgrade rastarbrain
brew services restart rastarbrain
```

## Scope

This tap currently ships the macOS Apple Silicon server release channel for rastarbrain.

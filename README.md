# linux-container

Simple Ubuntu containers for debugging pwn problems.

## Features

This repository provides a reproducible environment for binary exploitation (pwn) debugging.
It uses Docker to set up the environment and a wrapper script for easier usage.
Commonly used tools and libraries are included.

Installed packages and tools:

* **System & Utilities**: `xz-utils`, `tmux`, `nano`, `vim`, `tree`, `curl`, `git`, `zsh`
* **Debugging**: `gdb`, `binutils-multiarch`, `glibc-source`
* **Programming**: `python3`, `pip`, `ruby-dev`, `rubygems`
* **Exploitation Tools**:

  * [pwntools](https://docs.pwntools.com/en/stable/) (Python)
  * [one\_gadget](https://github.com/david942j/one_gadget) (Ruby)
  * [pwndbg](https://github.com/pwndbg/pwndbg) (GDB plugin)

Additionally:

* Pre-configured **glibc-2.xx** directories for `gdb` debugging
* Shell & editor configs included (`.zshrc`, `.tmux.conf`, `.vimrc`)
* Default user (non-root) is automatically created and used


## Usage

```bash
./vm [build|run|upload|connect]
```

- `./vm build` – Build the container image
- `./vm run` – Start the container
- `./vm upload [folder or file path]` – Upload files or directories from host into the container
- `./vm connect` – Attach to a running container


## Notes

* Although this container tries to replicate the same debugging environment across systems, there may be **differences in gdb behavior**.

  * To find the exact offset:

    * Use the ELF and Dockerfile provided in the challenge, or
    * Use `gdbserver` to eliminate differences.
    * Attach gdb to the provided docker image directly.
* On **Ubuntu 18.04**, some packages had to be removed due to compatibility issues.


## Directory Layout

```
.
├── Dockerfile        # Customize base image & packages
├── vm                # Helper script (build/run/upload/connect)
├── .zshrc            # zsh configuration
├── .tmux.conf        # tmux configuration
└── .vimrc            # vim configuration
```

## License

MIT License

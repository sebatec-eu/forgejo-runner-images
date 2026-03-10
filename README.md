# runner-images

[sebaTEC Forge](https://forge.sebatec.eu) is a self-hosted Git server, an alternative to GitHub or GitLab. This repository provides the container images for Forgejo Actions runners, so you can build CI/CD pipelines and automate tasks without relying on external infrastructure.

## Available Runners

| Label     | Base OS        | Architecture |
| --------- | -------------- | ------------ |
| `stable`  | Debian Stable  | x86-64       |
| `testing` | Debian Testing | x86-64       |

Use the label directly in the `runs-on:` field of your workflow.

## Preinstalled Software

All images ship the same toolchain.

| Category             | Tools                                                                                 |
| -------------------- | ------------------------------------------------------------------------------------- |
| **Runtimes**         | Go, Node.js LTS, Python 3                                                             |
| **Version control**  | Git, Git LFS                                                                          |
| **Compilers**        | GCC, G++                                                                              |
| **Build tools**      | make, pkg-config, binutils, libc6-dev                                                 |
| **Utilities**        | curl, wget, rsync, jq, tar, zip, unzip, bzip2, gzip, xz-utils, sqlite3, inotify-tools |
| **Security**         | ca-certificates, gnupg2, openssh-client                                               |
| **Package managers** | pipx, npm (via Node.js)                                                               |

> [!NOTE]
> Node.js is the latest LTS release at image build time, resolved via the [endoflife.date API](https://endoflife.date/nodejs) and verified against the [official Node.js release keys](https://github.com/nodejs/node#release-keys).

## How It Works

[mkosi](https://github.com/systemd/mkosi) assembles a minimal Debian base from scratch. The Dockerfile layers the full development toolchain on top. The `stable` image uses Debian Stable; `testing` uses Debian Testing. Both are built from the same Dockerfile.

## Contributing

We welcome contributions! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch:
   ```sh
   git checkout -b feature-branch
   ```
3. Make your changes and commit them:
   ```sh
   git commit -m "Description of your changes"
   ```
4. Push to your fork:
   ```sh
   git push origin feature-branch
   ```
5. Create a pull request.

### Guidelines

- Follow the existing code style.
- Write clear and concise commit messages.
- Ensure your changes do not break existing functionality.
- Update documentation as needed.

## License

This project is licensed under the [MIT License](LICENSE).

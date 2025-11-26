# Contributing to Charmarr

Thank you for your interest in contributing to Charmarr! We welcome contributions from the community.

## Code of Conduct

Please read and follow our [Code of Conduct](CODE_OF_CONDUCT.md). We are committed to providing a welcoming and inclusive environment for all contributors.

## Getting Started

### Development Prerequisites

Depending on the project you're contributing to, you may need:

- **Python 3.12+** for Python-based projects (charms, libraries, agents)
- **[astral-uv](https://github.com/astral-sh/uv)** for dependency management
- **[tox](https://tox.wiki/)** for running tests
- **[charmcraft](https://github.com/canonical/charmcraft)** for Juju charms
- **Git** for version control

### Repository Organization

Charmarr is organized into several repositories:

- **charmarr-meta** - Documentation, ADRs, and project metadata
- **charmarr** - Monorepo for all ARR charms, Terraform solutions, and related tooling
- **charmarr-lib** - Shared Python library for all Charmarr charms
- ***-k8s** - Individual charm repositories for non-ARR charms
- **flintarr** - Flintarr agent for Charmarr
- **configuratarr** - TUI configurator for Charmarr

Check individual repository README files for project-specific setup instructions.

## Development Workflow

### Code Style

All Charmarr projects follow consistent code standards:

- **Formatter**: [ruff](https://github.com/astral-sh/ruff) for linting and formatting
- **Type Checker**: [pyright](https://github.com/microsoft/pyright) for static type checking
- **Spell Checker**: [codespell](https://github.com/codespell-project/codespell) for spell checking
- **Line Length**: 99 characters maximum
- **Docstrings**: Google-style docstrings
- **Style Guide**: [PEP 8](https://peps.python.org/pep-0008/) for Python

Format your code before committing:

```bash
tox -e fmt
```

### Testing

We maintain high testing standards. Run the full test suite before submitting:

```bash
# Linting
tox -e lint

# Type checking
tox -e static

# Unit tests
tox -e unit

# Integration tests (when applicable)
tox -e integration
```

Projects aim for **80% minimum code coverage** for unit tests.

### Commit Messages

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification for all commit messages.

All commit messages must follow the Conventional Commits format. Please read the full specification at [conventionalcommits.org](https://www.conventionalcommits.org/).

**Quick reference:**

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Common types:** feat, fix, docs, style, refactor, perf, test, build, ci, chore

**Common scopes:** charm, lib, docs, ci, deps

### Pull Request Process

1. **Fork** the repository to your GitHub account
2. **Clone** your fork locally
3. **Create a branch** with a descriptive name:
   ```bash
   git checkout -b feature/add-caching
   # or
   git checkout -b fix/memory-leak
   ```
4. **Make your changes** following the code style guidelines
5. **Add tests** for new functionality
6. **Run the test suite** and ensure all tests pass
7. **Update documentation** if needed (README, docstrings, etc.)
8. **Commit** your changes with clear commit messages following Conventional Commits
9. **Push** to your fork
10. **Create a Pull Request** against the main repository

### Pull Request Guidelines

Your PR should:

- Have a **clear, descriptive title** following Conventional Commits format (e.g., `feat: add user authentication`)
- Include a **description** explaining:
  - What problem does this solve?
  - How does it solve it?
  - Any alternative approaches considered?
- **Reference related issues** (e.g., "Fixes #123")
- Pass **all CI checks** (linting, tests, type checking). There can be exceptions.
- Include **tests** for new features or bug fixes
- Update **documentation** if the change affects user-facing behavior
- Be **focused** - one logical change per PR (not mixing multiple unrelated changes)

## Code Review

All submissions require review before merging. Reviewers will:

- Check code quality and adherence to standards
- Verify tests are adequate and passing
- Ensure documentation is updated
- Suggest improvements or ask clarifying questions

Please be patient and responsive to feedback. Code review is a collaborative process to improve code quality.

## Project-Specific Guidelines

Some repositories may have additional guidelines:

- **Juju Charms**: Follow the reconciler pattern, use `collect_unit_status` for status management
- **Python Libraries**: Maintain backward compatibility, follow semantic versioning
- **Documentation**: Use clear, concise language; include examples

Check the repository's own CONTRIBUTING.md file if it exists for project-specific details.

## Getting Help

If you need help or have questions:

- Check the project's [Support](SUPPORT.md) resources
- Open a [Discussion](https://github.com/orgs/charmarr/discussions) for questions
- Open an [Issue](https://github.com/charmarr/[repo]/issues) for bugs or feature requests

## License

By contributing to Charmarr projects, you agree that your contributions will be licensed under the same license as the project (typically AGPL-3.0). Check the repository's LICENSE file for details.

---

Thank you for contributing to Charmarr! Your efforts help make media automation accessible to everyone.

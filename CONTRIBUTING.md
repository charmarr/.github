# Contributing to Charmarr

## Prerequisites

- Python 3.12+
- [uv](https://github.com/astral-sh/uv) for dependency management
- [tox](https://tox.wiki/) for running tests
- [charmcraft](https://github.com/canonical/charmcraft) for Juju charms

## Development

```bash
uv venv && source .venv/bin/activate
uv sync
tox -e fmt      # format
tox -e lint     # lint
tox -e static   # type check
tox -e unit     # test (80% coverage required)
```

## Commits

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(scope): description
```

Types: `feat`, `fix`, `docs`, `refactor`, `test`, `ci`, `chore`

## Pull Requests

1. Fork and create a branch (`feat/thing` or `fix/bug`)
2. Make changes, add tests, run `tox`
3. Open PR with clear description and reference any related issues

All PRs require review and passing CI.

## Code of Conduct

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

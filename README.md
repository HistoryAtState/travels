# Travels

[![exist-db CI](https://github.com/HistoryAtState/travels/actions/workflows/build.yml/badge.svg)](https://github.com/HistoryAtState/travels/actions/workflows/build.yml)

Source data for [Foreign Travels of the President and Secretary of State](http://history.state.gov/departmenthistory/travels)

## Build

1. Single `xar` file: The `collection.xconf` will only contain the index, not any triggers!

    ```shell
    ant
    ```

    1. Since Releases have been automated when building locally you might want to supply your own version number (e.g. `X.X.X`) like this:

    ```shell
    ant -Dapp.version=X.X.X
    ```

## Release

Releases for this data package are automated. Any commit to the `master` branch will trigger the release automation.

All commit message must conform to [Conventional Commit Messages](https://www.conventionalcommits.org/en/v1.0.0/) to determine semantic versioning of releases, please adhere to these conventions, like so:

| Commit message  | Release type |
|-----------------|--------------|
| `fix(pencil): stop graphite breaking when too much pressure applied` | Patch Release |
| `feat(pencil): add 'graphiteWidth' option` | ~~Minor~~ Feature Release |
| `perf(pencil): remove graphiteWidth option`<br/><br/>`BREAKING CHANGE: The graphiteWidth option has been removed.`<br/>`The default graphite width of 10mm is always used for performance reasons.` | ~~Major~~ Breaking Release |

When opening PRs commit messages are checked using commitlint.

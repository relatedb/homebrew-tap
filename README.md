# relatedb/tap

Homebrew tap for [Relate](https://relatedb.ai/) — the embedded openCypher
graph database in a single binary.

```sh
brew install relatedb/tap/relate
```

The `Formula/relate.rb` file is generated from each release's signed asset
manifest ([ADR-0659](https://github.com/relatedb/relate/blob/main/docs/adr/0659-package-manager-distribution-channels.md))
and pushed by the release workflow. Don't edit it by hand; a release
overwrite is authoritative.

Upgrade with `brew upgrade relate` — a Homebrew install is package-managed,
and `relate upgrade` defers to the package manager.

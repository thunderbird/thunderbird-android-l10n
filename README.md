# Thunderbird for Android l10n

This repository contains the Thunderbird for Android localization file tree used by Weblate.

The repository root mirrors localization-relevant paths from the source repository:

- Android resource strings: `**/res/values/strings.xml` and `**/res/values-*/strings.xml`
- Compose resource strings: `**/composeResources/values/strings.xml` and `**/composeResources/values-*/strings.xml`
- Store listing text: `app-metadata/**/*.txt`, excluding changelogs

Shared import and Weblate management tooling is provided by the `weblate/` submodule. Project-specific tooling settings
live in `l10n-tools.json`.

## Tooling

Initialize the tooling submodule after cloning:

```bash
git submodule update --init --recursive
```

Run the import using the source repository configured in `l10n-tools.json`:

```bash
./weblate/scripts/import-from-source import
```

Run Weblate management in dry-run mode:

```bash
./weblate/scripts/weblate --token "$WEBLATE_TOKEN" --dry-run update
```

## Maintenance

Update the tooling submodule manually when needed:

```bash
git submodule update --remote weblate
git diff --submodule
git add weblate
```

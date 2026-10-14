# Thunderbird for Android l10n

This repository contains the Thunderbird for Android localization file tree used by Weblate.

The repository root mirrors localization-relevant paths from the source repository:

- Android resource strings: `**/res/values/strings.xml` and `**/res/values-*/strings.xml`
- Compose resource strings: `**/composeResources/values/strings.xml` and `**/composeResources/values-*/strings.xml`
- Store listing text: `app-metadata/**/*.txt`, excluding changelogs

Project-specific tooling settings live in `l10n-config.json`.

## Tooling

Install Java 21, then run the repository scripts from the root. They download and verify the pinned JVM distributions
from [Thunderbird Mobile Weblate releases](https://github.com/thunderbird/thunderbird-mobile-weblate/releases) on first use.

Run the import using the source repository configured in `l10n-config.json` (dry run by default):

```bash
./scripts/l10n-sync import
```

Run Weblate management in dry-run mode:

```bash
./scripts/l10n-weblate update --token "$WEBLATE_TOKEN"
```

The installer (`scripts/install-l10n-tools.sh`) verifies the pinned SHA-256 for each archive and extracts it into the
ignored `.tools/l10n/` directory. Review and update the version and checksums there and the launcher paths in the two
scripts when adopting a new release. The launchers provide a pseudo-terminal when needed by the CLIs.

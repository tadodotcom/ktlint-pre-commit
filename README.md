# ktlint-pre-commit
A ktlint pre-commit hook

Usage:

```
repos:
- repo: https://github.com/tadodotcom/ktlint-pre-commit
  rev: "0.45.2-1"
  hooks:
      - id: ktlint
```

If you want to make use of the formatting functionality of ktlint you can configure
the hook as follows:

```
repos:
- repo: https://github.com/tadodotcom/ktlint-pre-commit
  rev: "0.45.2-1"
  hooks:
      - id: ktlint
        args: [-F]
```


*Notes*:
* This file stores ktlint in a `.cache/` directory so that it doesn't need to be re-downloaded each time.  You will probably want to add `.cache/` to the `.gitignore` file of the project which uses this hook.
* The first time this hook runs it will need to download ktlint, which takes a
  long time.


# ktlint-pre-commit
A ktlint pre-commit hook

Usage:

```
repos:
- repo: https://github.com/maltzj/ktlint-pre-commit
  sha: master
  hooks:
      - id: ktlint
```

*Notes*: 
* This file stores ktlint in a `.cache/` directory so that it doesn't need to be re-downloaded each time.  You will probably want to add `.cache/` to the `.gitignore` file of the project which uses this hook.
* The first time this hook runs it will need to download ktlint, which takes a
  long time.


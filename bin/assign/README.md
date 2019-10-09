# assign

## Usage

```
cat .github/workflows/auto_assign
```

```workflow
name: autoAssign
on:
  pull_request:
    types: [opened]

jobs:
  auto_assign:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v1
        with:
          fetch-depth: 1
      - uses: bluerabbit/actions/bin/assign@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Example Output

```
...
```

# assign

## Usage

```workflow
name: assign
on:
  pull_request:
    types: [opened]

jobs:
  assign:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
      - uses: bluerabbit/actions/bin/assign@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

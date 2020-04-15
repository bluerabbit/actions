# feature-branch

## Usage

```yaml
name: feature-branch
on:
  pull_request:
    types: [opened]

jobs:
  feature_branch:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: bluerabbit/actions/bin/release-version@v0.3
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          PULL_REQUEST_NUMBER: ${{ github.event.number }}
```

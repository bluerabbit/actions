# delete-branch

## Usage

```yaml
name: delete-branch
on:
  pull_request:
    types: [closed]

jobs:
  delete_branch:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: bluerabbit/actions/bin/delete-branch@v0.6
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          protected_branches: 'master,develop'
```

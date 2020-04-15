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
      - uses: bluerabbit/actions/bin/delete-branch@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          protected_branches: 'master,develop'
```

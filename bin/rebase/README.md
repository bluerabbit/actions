# rebase

## Usage

```yaml
name: rebase
on:
  issue_comment:
    types: [created]

jobs:
  rebase:
    runs-on: ubuntu-latest

    steps:
    - if: github.event.comment.body == '/rebase' && contains(github.event.comment.html_url, '/pull')
      uses: actions/checkout@v1
    - if: github.event.comment.body == '/rebase' && contains(github.event.comment.html_url, '/pull')
      name: git rebase
      uses: bluerabbit/actions/bin/rebase@v0.5
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

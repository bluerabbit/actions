# assign-reviewers

## Usage

```yaml
name: assign reviewers
on:
  pull_request:
    types: [opened]

jobs:
  assign_reviewers:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - uses: bluerabbit/actions/bin/assign-reviewers@v0.6
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        reviewers: "github_account1,github_account2,github_account3"
        reviewer_count: "2"
```

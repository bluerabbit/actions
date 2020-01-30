# delete_branch

## Usage

```workflow
workflow "delete branch" {
  resolves = ["delete branch"]
  on       = "pull_request"
}

action "delete branch" {
  uses    = "bluerabbit/actions/bin/delete_branch@v0.1"
  secrets = ["GITHUB_TOKEN"]
}
```

## Example Output

```
...
```

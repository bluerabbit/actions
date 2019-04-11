# assign

## Usage

```workflow
workflow "Auto Assign" {
  on       = "pull_request"
  resolves = ["Assign"]
}

action "Assign" {
  uses    = "bluerabbit/actions/bin/assign@master"
  secrets = ["GITHUB_TOKEN"]
}
```

## Example Output

```
...
```

# Charmarr org automation recipes

# Sync branch rulesets to all repos
sync-rulesets:
    #!/usr/bin/env bash
    set -euo pipefail

    RULESET_NAME="charmarr-default"

    # Get all repos in the org
    repos=$(gh api orgs/charmarr/repos --paginate --jq '.[].name')

    for repo in $repos; do
        echo "Processing: $repo"

        # Check if main branch exists
        if ! gh api repos/charmarr/$repo/branches/main --silent 2>/dev/null; then
            echo "  No main branch, skipping"
            continue
        fi

        # Check if ruleset already exists
        existing_id=$(gh api repos/charmarr/$repo/rulesets --jq ".[] | select(.name == \"$RULESET_NAME\") | .id" 2>/dev/null || echo "")

        ruleset_json=$(cat <<'EOF'
    {
      "name": "charmarr-default",
      "target": "branch",
      "enforcement": "active",
      "conditions": {
        "ref_name": {
          "include": ["refs/heads/main"],
          "exclude": []
        }
      },
      "bypass_actors": [
        {
          "actor_id": 1,
          "actor_type": "OrganizationAdmin",
          "bypass_mode": "always"
        }
      ],
      "rules": [
        {
          "type": "deletion"
        },
        {
          "type": "non_fast_forward"
        },
        {
          "type": "pull_request",
          "parameters": {
            "required_approving_review_count": 1,
            "dismiss_stale_reviews_on_push": true,
            "require_code_owner_review": false,
            "require_last_push_approval": false,
            "required_review_thread_resolution": false
          }
        },
        {
          "type": "required_linear_history"
        }
      ]
    }
    EOF
    )

        if [ -n "$existing_id" ]; then
            echo "$ruleset_json" | gh api repos/charmarr/$repo/rulesets/$existing_id -X PUT --input - \
                && echo "  ✓ Ruleset updated" \
                || echo "  ✗ Failed to update ruleset"
        else
            echo "$ruleset_json" | gh api repos/charmarr/$repo/rulesets -X POST --input - \
                && echo "  ✓ Ruleset created" \
                || echo "  ✗ Failed to create ruleset"
        fi
    done

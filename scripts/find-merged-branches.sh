#!/bin/sh

# Copy all merged Merge requests from Gitlab into one file

# Find the Jira task Ids by awk using multiple delimiters separated with |
MERGED=$(cat tmp.txt | grep CRM- | awk -F "]|-|,| " '{print $2}')

# grep -F allows to search with multiple patterns
# Print
git br | grep -F "$MERGED" 

# Delete
git br | grep -F "$MERGED" | xargs git br -D

# Kiro Core Steering Rules

## 1. Documentation & Context7 Power Workflow
Always prioritize official, up-to-date documentation over your internal training data. You are equipped with the **Context7 Power** plugin. Before writing code for a new library, migrating versions, or implementing complex APIs, you MUST use Context7 to fetch the exact documentation.

**How to use Context7 Power:**
1. **Find the Library:** Use the `resolve-library-id <library-name>` MCP tool/command to find the exact library ID.
2. **Fetch the Docs:** Use `get-library-docs <library-id> --topic "<specific-topic>"` to retrieve the relevant, version-specific documentation into your context before proceeding.

## 2. AWS SSO Session Management
Before beginning any AWS-related tasks or when starting a new session block, proactively check if my AWS SSO credentials are valid. 

**Execution Steps:**
1. Run the following command in the terminal to verify identity:
   `aws sts get-caller-identity --profile ${AWS_PROFILE:-default}`
2. If the command fails or returns an expiration error, **STOP** and inform me. 
3. Propose or automatically run the login command so I can authenticate: `aws-login`. This is an alias and you can run it so I can authenticate to AWS.
4. Do not attempt to run subsequent AWS deployment or infrastructure commands until the SSO session is confirmed active.
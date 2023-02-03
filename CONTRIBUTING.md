# swgoh-utils Contribution Guidelines

Comlink itself is closed source, but the remaining projects in the [swgoh-utils](https://github.com/swgoh-utils) org are open source and accept contributions.  Github provides documentation on how to [contribute to projects](https://docs.github.com/en/get-started/quickstart/contributing-to-projects) by forking and creating a pull request.  We use the [github flow](https://docs.github.com/en/get-started/quickstart/github-flow) as a model for all contributors.  Work is expected to be done in branches, even when done within the organization, and then checked with the pull request code reviews.  Some repositories have automated workflows that run on pull requests and main merges, and it's important to ensure that these pipelines do not break.

Each service and library uses [semantic versioning](https://semver.org/) to communicate the types of changes that are expected to be contained in each release.  Releases are handled by parsing commit messages, and automatically setting the appropriate semver using [semantic release](https://semantic-release.gitbook.io/semantic-release/).  This detaches the human emotion from the numbers in favor of strictly attempting to communicate the *impact* of the changes to consumers.  The repositories are configured to use commit message in the [conventional commit](https://www.conventionalcommits.org/en/v1.0.0/#summary) format.  It is based off of the popular angular format.  When creating commits, you will need to follow this format for your first (summary) line in your commit message to ensure that the impact of your changes is understood by semantic release.

If you are new to open source contributions, there are a lot of helpful tips in github's quickstart guide, and they also provide some helpful [community guidelines](https://docs.github.com/en/site-policy/github-terms/github-community-guidelines) to help keep things positive and constructive.

Swgoh-utils specifically has the following guidelines:
- Be nice and polite.  Treat others how you'd like to be treated.
- Everything should be strictly SFW.  Anything NSFW will be rejected and likely result in being blocked.
- No politics, religion, impersonating people in the community, or anything illegal

They're just guidelines though- if a maintainer believes you're engaging in harmful behavior not specifically mentioned, they're expected to deal with the situation accordingly.
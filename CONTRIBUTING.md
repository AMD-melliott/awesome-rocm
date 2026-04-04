# Contributing to Awesome ROCm

Thank you for your interest in contributing to this curated list of AMD ROCm resources!

## Adding a Resource

To add a new resource, please submit a pull request with the following:

1. **Use the correct format:**

   ```markdown
   * **[Resource Name](https://example.com)** - A brief description of what the resource provides.
   ```

2. **Place it in the appropriate section** based on the resource's primary purpose.

3. **Write a concise description** (1-2 sentences) that explains what the resource is and why it's useful.

### Nested Resources

Some entries have sub-resources indented beneath them (e.g., a product page with a linked Wikipedia article). Use 4-space indentation for sub-items:

```markdown
* **[Parent Resource](https://example.com)** - Description of the parent.
    * **[Sub-Resource](https://example.com/sub)** - Description of the sub-resource.
```

## Quality Guidelines

Resources should meet at least one of these criteria:

- Official AMD documentation, tools, or repositories
- Actively maintained open-source projects with ROCm support
- Authoritative technical guides, whitepapers, or benchmarks
- Well-established community resources

Please avoid submitting:

- Outdated or unmaintained projects
- Resources behind paywalls (unless there's significant free content)
- Duplicate resources that cover the same ground as existing entries
- Self-promotional content without substantial value

## Pull Request Process

1. Fork the repository
2. Create a new branch for your addition
3. Make your changes following the format above
4. Submit a pull request using the provided template
5. Ensure the link checker and lint checks pass (GitHub Actions will verify automatically)

## Local Development

You can run the same checks locally before pushing to catch issues early. A `Makefile` is included to make this straightforward.

```bash
# Install lychee and markdownlint-cli2 (one-time setup)
make install-tools

# Run all checks
make check

# Run checks individually
make lint   # Markdown formatting only
make links  # Link checker only
```

Run `make help` to see all available targets.

## Reporting Broken Links

If you find a broken link, please either:

- [Open a broken link issue](https://github.com/AMD-melliott/awesome-rocm/issues/new?template=broken-link.yml) with the details
- Submit a pull request with an updated or replacement link

## Suggesting a Resource

Not ready to open a PR? You can [suggest a resource via an issue](https://github.com/AMD-melliott/awesome-rocm/issues/new?template=resource-suggestion.yml) and someone on the team can review and add it.

## Code of Conduct

Be respectful and constructive in all interactions. This is a community resource meant to help developers working with AMD ROCm.

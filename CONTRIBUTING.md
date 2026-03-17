# Contributing to OnlyTrust A2A

We welcome contributions! Please follow these guidelines to help us maintain a high-quality codebase.

## How to Contribute

1. **Fork** the repository
2. **Create a branch** from `main` for your feature or fix (`git checkout -b feature/my-feature`)
3. **Write tests** for any new functionality
4. **Ensure all tests pass** (`bundle exec rspec`)
5. **Submit a Pull Request** against `main`

## Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/onlytrust-a2a.git
cd onlytrust-a2a

# Install dependencies
bundle install

# Start infrastructure
docker compose up -d

# Run tests
bundle exec rspec
```

## Code Style

- Follow the existing Ruby style conventions
- Run RuboCop before submitting: `bundle exec rubocop`
- Keep methods short and focused
- Write descriptive commit messages

## Pull Request Process

1. Update any relevant documentation
2. Add tests for new functionality
3. Ensure CI passes
4. Request review from at least one maintainer
5. Squash commits before merging

## Reporting Issues

Use the GitHub issue templates for bug reports and feature requests.

## Code of Conduct

Please read and follow our [Code of Conduct](CODE_OF_CONDUCT.md).

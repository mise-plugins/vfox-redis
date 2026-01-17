# vfox-redis

A [vfox](https://github.com/version-fox/vfox) plugin for [Redis](https://redis.io/).

## Requirements

This plugin compiles Redis from source, so you need:

- C compiler (gcc or clang)
- make

### macOS

```bash
xcode-select --install
```

### Ubuntu/Debian

```bash
sudo apt-get install build-essential
```

### Fedora/RHEL

```bash
sudo dnf groupinstall "Development Tools"
```

## Installation

```bash
mise use -g redis@latest
```

Or add to your `mise.toml`:

```toml
[tools]
redis = "latest"
```

## Usage

After installation, the following Redis binaries are available:

- `redis-server` - The Redis server
- `redis-cli` - The Redis command line interface
- `redis-benchmark` - Redis benchmarking utility
- `redis-check-aof` - AOF file checker
- `redis-check-rdb` - RDB file checker

Start a Redis server:

```bash
redis-server
```

Connect with the CLI:

```bash
redis-cli
```

## License

MIT

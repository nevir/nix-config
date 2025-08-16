# Machine Configuration

Configuration for @nevir's machines (e.g. personal & work MacOS laptops) via Nix.

## Fresh Install

1. Install Nix (**Say no** to Determinate Nix):
   ```sh
   curl -fsSL https://install.determinate.systems/nix | sh -s -- install
   ```

2. Clone this configuration:
   ```sh
   sudo nix flake clone github:nevir/nix-config --dest /etc/nix-config
   sudo chown -R $(id -un):$(id -gn) /etc/nix-config
   ```

3. Activate it for the appropriate Host ID (a directory under [`hosts/`](./hosts/)):
   ```sh
   nix run .#activate HOST_ID
   ```

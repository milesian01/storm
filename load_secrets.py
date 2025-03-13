import toml

def load_secrets():
    with open("secrets.toml", "r") as f:
        secrets = toml.load(f)
    return secrets

if __name__ == "__main__":
    secrets = load_secrets()
    print(secrets)

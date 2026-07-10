# [Project_Ansible_Template](#project_ansible_template)

Ansible project template repo.

## Vault password (Bitwarden)

Ansible Vault is decrypted with a password stored in Bitwarden. `ansible.cfg`
sets `vault_password_file = ~/.ansible/vault_pass.sh`, backed by two scripts:

- `~/.ansible/bw_unlock.sh` — interactive helper. Run it once per session to
  log in / unlock Bitwarden and cache an unlocked session key.
- `~/.ansible/vault_pass.sh` — non-interactive fetch script that Ansible calls.
  It only reads the password from the cached session; it never prompts.

### Workflow

```bash
~/.ansible/bw_unlock.sh     # unlock once (start of day, or after re-lock)
# run ansible normally — the vault decrypts automatically
```

If a play fails with `Bitwarden session is locked or expired`, the vault has
re-locked — just re-run `~/.ansible/bw_unlock.sh`.

The vault password is stored in Bitwarden as an item named `ansible-vault`.


#!/usr/bin/env python3
"""Symlink VS Code settings from this directory into Code - OSS and VSCodium.

Profile folders have random, machine-specific IDs, so profile settings are
stored here by profile *name* (profiles/<name>.json) and matched to the ID in
the editor's profile list (globalStorage/storage.json). Profiles that don't
exist on this machine yet are skipped: create them in the editor, then rerun.
An existing regular file is kept as <file>.bak instead of being overwritten.
"""
import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))
APPS = {"code-oss": "Code - OSS", "vscodium": "VSCodium"}


def link(src, dst):
    if os.path.islink(dst):
        os.remove(dst)
    elif os.path.exists(dst):
        os.replace(dst, dst + ".bak")
        print(f"  kept old file as {dst}.bak")
    os.makedirs(os.path.dirname(dst), exist_ok=True)
    os.symlink(src, dst)
    print(f"  {dst} -> {src}")


for tag, app in APPS.items():
    user = os.path.expanduser(f"~/.config/{app}/User")
    if not os.path.isdir(user):
        print(f"{app}: not set up on this machine, skipped")
        continue
    print(f"{app}:")
    link(os.path.join(HERE, tag, "settings.json"), os.path.join(user, "settings.json"))

    storage = os.path.join(user, "globalStorage", "storage.json")
    profiles = json.load(open(storage)).get("userDataProfiles", []) if os.path.exists(storage) else []
    ids = {p["name"]: p["location"] for p in profiles}
    profiles_dir = os.path.join(HERE, tag, "profiles")
    for fname in sorted(os.listdir(profiles_dir)):
        name = fname[: -len(".json")]
        if name not in ids:
            print(f"  profile '{name}' doesn't exist yet, skipped")
            continue
        link(os.path.join(profiles_dir, fname), os.path.join(user, "profiles", ids[name], "settings.json"))

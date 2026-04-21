[⊞ ◈] [☴ ☵ ☱ ☲]

# slasten visual corpus manifest

This manifest describes the external visual payload for `visual crystall`.

The main `slastack` repository stores interpretation and routing.
The image payload lives in `slastack-media`.

## Payload

```yaml
corpus: slasten visual crystall
payload_repo: https://github.com/slasten3826/slastack-media
payload_path: slasten/
payload_url: https://github.com/slasten3826/slastack-media/tree/main/slasten
research_document: research/memoris/VISUAL_CRYSTALL.md
```

## Layers

```yaml
table:
  repo_path: slasten/table/
  github_url: https://github.com/slasten3826/slastack-media/tree/main/slasten/table
  files: 25
  size: 2.1M
  role: addressable expressive field

crystall:
  repo_path: slasten/crystall/
  github_url: https://github.com/slasten3826/slastack-media/tree/main/slasten/crystall
  files: 15
  size: 33M
  role: crystallized manifestation examples
```

## Reading Policy

- Do not load the visual payload by default.
- Read [../../research/memoris/VISUAL_CRYSTALL.md](../../research/memoris/VISUAL_CRYSTALL.md) first.
- Inspect the payload only when visual evidence is required.
- Use GitHub payload URLs as the portable address space.
- Preserve directory structure as semantic layer.
- Treat `table/` and `crystall/` as stack-level labels, not arbitrary folders.

## Repo Policy

- `slastack` stores markdown, topology, research, and manifests.
- `slastack-media` stores heavy visual payload.
- Image payload must not be committed into the main `slastack` repository.

---

machines only. not for humans.

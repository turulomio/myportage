# Repository Guidelines for AI Assistants (GEMINI.md)

This file contains persistent guidelines, rules, and development standards for AI coding assistants working in the `myportage` Gentoo overlay repository.

---

## Ebuild Modification Rules

1. **Automatic Manifest Digest**:
   - Whenever an ebuild is modified or created, ALWAYS execute `ebuild <file>.ebuild digest` in the package directory to keep the `Manifest` synchronized.

2. **Integrated Ebuilds Protection**:
   - **Do NOT modify integrated ebuilds** pulled from external repositories (e.g., `app-crypt/autofirma-dnie`). These packages are maintained upstream and synchronized via `integrating_from_other_repositories.sh`.

3. **Python Version Compatibility**:
   - All Python-based ebuilds must target Python versions from `python3_12` to `python3_15`:
     ```bash
     PYTHON_COMPAT=( python3_{12..15} )
     ```

4. **Gentoo Code & Formatting Standards**:
   - **Indentation**: Use tabs (not spaces) for indenting functions, multiline arrays (`SRC_URI`, `RDEPEND`, `DEPEND`), and block statements inside `.ebuild` files.
   - **Trailing Newline**: Always ensure files end with a final newline character.
   - **Descriptions**: `DESCRIPTION` string must NOT end with a period (`.`).
   - **USE Flags**:
     - Local USE flags must be documented inside `<use>` in the package's `metadata.xml`.
     - Do not add package-specific USE flags to global `profiles/use.desc`.

5. **Thin Manifest Policy**:
   - This repository enforces `thin-manifests = true` in `metadata/layout.conf`.
   - `Manifest` files must only track external downloaded source files (`DIST`).
   - Packages without external downloads (e.g., `virtual/*`, `acct-user/*`, `acct-group/*`) do not create or require `Manifest` files.

---

## Quality Assurance & Verification

- After modifying ebuilds or metadata, run `pkgcheck scan` to verify compliance with Gentoo policy standards.

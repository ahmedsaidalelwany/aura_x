# Final Aura-X Dependency Architecture Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Establish a final, non-redundant dependency baseline for Aura-X covering its current architecture and planned extensibility without adding speculative feature packages.

**Architecture:** Aura-X uses Flutter with BLoC + GetIt/Injectable, Hive + Shared Preferences for local persistence, adaptive/responsive UI, a handler-based file engine, optional Google Drive integration, and a versioned `.aur` container. Serialization and immutable domain/state models use code generation. Security uses `cryptography` rather than the legacy `encrypt` package.

**Tech Stack:** Flutter/Dart 3.13+, flutter_bloc, get_it, injectable, Hive, Shared Preferences, go_router, responsive_framework, Syncfusion PDF, archive, cryptography, Google APIs, Freezed/JSON code generation.

**Spec:** Aura-X project requirements established in conversation.

## Global Constraints

- Offline-first is mandatory; Google Drive is optional.
- Isar is forbidden.
- Local storage is Hive + Shared Preferences.
- `.aur` is the application container format; app/file versions remain separate.
- Pages and Features remain separate architectural concepts.
- Mobile layouts are primarily vertical; desktop layouts are primarily horizontal/adaptive.
- File lifecycle supports history, soft delete, restore, and permanent delete.
- Packages are added only when they support a real architectural responsibility.

---

### Task 1: Replace the package manifest

**Files:**
- Modify: `pubspec.yaml`

**Requirements:**
- Remove redundant `flutter_screenutil`, `provider`, `shimmer`, and external `localization`.
- Add official `flutter_localizations` SDK dependency.
- Add GetIt and injectable generation support.
- Add Hive Flutter integration and Hive code generation.
- Add archive support for the `.aur` container.
- Add explicit `path` and `crypto` dependencies for file/path/integrity operations.
- Replace `encrypt` with `cryptography` + `cryptography_flutter` for modern authenticated encryption primitives.
- Add connectivity awareness for optional cloud synchronization.
- Add Freezed + JSON serialization for immutable models and generated serialization.
- Add bloc_test, mocktail, and integration_test for testing.
- Keep Google Drive packages isolated as optional cloud infrastructure dependencies.
- Keep file viewers/adapters only where they correspond to planned handlers; do not add speculative media packages.

### Task 2: Verify dependency graph

- [ ] Run `flutter pub get`.
- [ ] Run `flutter pub outdated`.
- [ ] Resolve only genuine incompatibilities; do not reintroduce removed packages for convenience.
- [ ] Run `dart analyze`.
- [ ] Run `flutter test`.

### Task 3: Record architectural rationale

- [ ] Keep comments in `pubspec.yaml` limited to durable architectural groupings.
- [ ] Ensure the README/spec later documents `.aur`, storage, cloud, and viewer boundaries rather than package-specific implementation details.

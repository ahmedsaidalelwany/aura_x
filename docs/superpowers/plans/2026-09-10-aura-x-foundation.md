# Aura-X Foundation Implementation Plan

**Goal:** Establish a single, non-duplicated architecture for Aura-X around offline-first file management, adaptive UI, Hive/Shared Preferences, BLoC/Cubit, routing, and the `.aur` format.

**Architecture:** UI pages use Cubit/BLoC and route through GoRouter. Core services own persistence, filesystem, `.aur` packaging, security, and viewers; Google Drive remains an optional isolated capability.

**Tech Stack:** Flutter, BLoC/Cubit, GetIt, GoRouter, Hive, Shared Preferences, responsive_framework, flutter_screenutil, archive, cryptography.

**Spec:** Aura-X architectural decisions established in project conversation.

## Global Constraints
- App name: Aura-X.
- File extension: `.aur`.
- Format version: `1.2.3`.
- Offline-first is mandatory.
- Google Drive is optional.
- Hive + Shared Preferences are the local persistence stack.
- Isar is forbidden.
- BLoC/Cubit is the only state-management layer.
- Responsive/adaptive layout controls structure; ScreenUtil controls visual sizing.
- One responsibility has one canonical owner; rename/move existing implementations instead of duplicating them.
- File history and global application history are required.
- Delete flow is Soft Delete -> Final Delete.

## Execution
- [x] Establish root bootstrap and DI entry points.
- [x] Establish canonical routing and navigable page boundaries.
- [x] Establish Hive, preferences, security, `.aur`, viewer, and responsive core owners.
- [x] Remove the competing localization dependency.
- [ ] Implement domain repositories/use-cases and complete file operations.
- [ ] Implement history/trash persistence and UI behavior.
- [ ] Implement optional Google Drive sync/backup.
- [ ] Add full unit/widget/integration coverage.

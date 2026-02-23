<!-- Context: project-intelligence/technical | Priority: critical | Version: 2.0 | Updated: 2026-02-19 -->

# Technical Domain

**Purpose**: Tech stack, architecture, and development patterns for Aloumnix.
**Last Updated**: 2026-02-19

## Quick Reference
**Update Triggers**: Tech stack changes | New service patterns | UI architecture decisions
**Audience**: Developers, AI agents

## Primary Stack
| Layer | Technology | Version | Rationale |
|-------|-----------|---------|-----------|
| Framework | Next.js (App Router) | 15+ | Server-first, React 19 features |
| Language | TypeScript | 5+ | Type safety across server/client |
| Database | PostgreSQL | 16+ | Robust relational data storage |
| ORM | TypeORM | 0.3+ | Data Mapper pattern, robust entities |
| Styling | Tailwind CSS | v4 | Utility-first, high performance |
| Tools | Biome | 1.9+ | Unified linting and formatting |

## Code Patterns
### API Pattern (Server Actions)
```typescript
"use server";
import { alumnusSchema } from "@/lib/validation/alumni";
import { AlumnusService } from "@/lib/services/AlumnusService";

export async function createAction(data: unknown) {
  const validated = alumnusSchema.parse(data);
  const result = await AlumnusService.create(validated);
  revalidatePath("/list");
  return { success: true, id: result.id };
}
```

### Component Pattern
```tsx
"use client";
import { useState, useTransition } from "react";

export function FeatureClient({ initialData }: Props) {
  const [isPending, startTransition] = useTransition();
  // Modular UI with Tailwind utility classes
  return <div className="p-4 bg-zinc-50 rounded-xl">{/* ... */}</div>;
}
```

## Naming Conventions
| Type | Convention | Example |
|------|-----------|---------|
| Files | kebab-case | `user-profile.tsx` |
| Components | PascalCase | `UserProfile.tsx` |
| Hooks | camelCase | `useAuth.ts` |
| Database | snake_case | `first_name` |

## Code Standards
- **Strict TypeScript**: No `any`, use explicit interfaces/types.
- **Service Layer**: Business logic lives in `src/lib/services/`.
- **Atomic Operations**: Bulk updates must be wrapped in transactions.
- **Testing**: Vitest for unit/integration, RTL for components.

## Security Requirements
- **Input Validation**: Mandatory Zod validation in all Server Actions.
- **Sanitization**: Strict email validation via `validator` library.
- **Boundary Checks**: Validate user permissions at the service level.

## 📂 Codebase References
**Core Logic**: `src/lib/services/` - Business logic and DB interactions.
**UI Layer**: `src/app/alumni/new/` - Integration of actions and components.
**Validation**: `src/lib/validation/` - Centralized schemas.

## Related Files
- Business Domain (business-domain.md)
- Decisions Log (decisions-log.md)

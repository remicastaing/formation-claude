import { test } from "node:test";
import assert from "node:assert/strict";
import { dateLimiteDiagnostic } from "../src/domain/sla.ts";

test("Pro : 2 jours ouvrés en milieu de semaine", () => {
  assert.equal(dateLimiteDiagnostic("Pro", "2026-09-15T09:00"), "2026-09-17");
});

test("Atelier+ : 1 jour ouvré", () => {
  assert.equal(dateLimiteDiagnostic("Atelier+", "2026-09-15T09:00"), "2026-09-16");
});

import { test } from "node:test";
import assert from "node:assert/strict";
import { montantMensuelHT, remise } from "../src/domain/tarifs.ts";

test("Pro, 12 utilisateurs, sans engagement : 228 € HT", () => {
  assert.equal(montantMensuelHT("Pro", 12, false), 228);
});

test("Pro, 12 utilisateurs, engagement annuel : 205,20 € HT", () => {
  assert.equal(montantMensuelHT("Pro", 12, true), 205.2);
});

test("remise volume seule au-delà de 50", () => {
  assert.equal(remise(60, false), 0.15);
});

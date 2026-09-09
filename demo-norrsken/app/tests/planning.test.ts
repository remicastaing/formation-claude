import { test } from "node:test";
import assert from "node:assert/strict";
import { lundiDe, creneauxDeLaSemaine, journees, chevauchent } from "../src/domain/planning.ts";
import { readFileSync } from "node:fs";

const fixture = JSON.parse(readFileSync(new URL("../fixtures/brossard.json", import.meta.url), "utf8"));

test("lundiDe renvoie le lundi de la semaine", () => {
  assert.equal(lundiDe("2026-09-16"), "2026-09-14");
  assert.equal(lundiDe("2026-09-20"), "2026-09-14");
  assert.equal(lundiDe("2026-09-14"), "2026-09-14");
});

test("creneauxDeLaSemaine garde les 8 créneaux de la fixture", () => {
  assert.equal(creneauxDeLaSemaine(fixture.creneaux, "2026-09-14").length, 8);
});

test("journees produit 7 journées, triées", () => {
  const j = journees(fixture.creneaux, "2026-09-14");
  assert.equal(j.length, 7);
  assert.deepEqual(j[0].creneaux.map((c) => c.id), ["c1", "c3", "c2"]);
});

test("chevauchent détecte un recouvrement du même employé", () => {
  const a = { id: "a", employe: "X", date: "2026-09-14", debut: "08:00", fin: "12:00", poste: "" };
  const b = { ...a, id: "b", debut: "11:00", fin: "13:00" };
  assert.equal(chevauchent(a, b), true);
  assert.equal(chevauchent(a, { ...b, employe: "Y" }), false);
});

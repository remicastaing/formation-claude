import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { buildPlanningModel } from "../src/export/model.ts";
import { exportTableur } from "../src/export/xlsx.ts";
import { exportPdf } from "../src/export/pdf.ts";

const fixture = JSON.parse(readFileSync(new URL("../fixtures/brossard.json", import.meta.url), "utf8"));
const modele = buildPlanningModel(fixture.client, fixture.creneaux, "2026-09-14");

test("le tableur contient une ligne par créneau plus l'en-tête", () => {
  assert.equal(exportTableur(modele).split("\n").length, 9);
});

test("le PDF commence par le titre de la semaine", () => {
  assert.match(exportPdf(modele)[0].texte, /semaine du 2026-09-14/);
});

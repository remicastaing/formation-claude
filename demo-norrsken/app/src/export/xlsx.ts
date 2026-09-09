import type { ModelePlanning } from "./model.ts";

/** Export tableur : une ligne par créneau, séparateur point-virgule (CSV lisible par LibreOffice et Excel). */
export function exportTableur(m: ModelePlanning): string {
  const lignes = ["date;employe;debut;fin;poste"];
  for (const j of m.journees) {
    for (const c of j.creneaux) lignes.push([j.date, c.employe, c.debut, c.fin, c.poste].join(";"));
  }
  return lignes.join("\n");
}

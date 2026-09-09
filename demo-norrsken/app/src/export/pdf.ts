import type { ModelePlanning } from "./model.ts";

type Ligne = { date: string; texte: string };

/** Export PDF : rendu texte paginé, une section par journée. Le rendu binaire est confié à l'imprimante. */
export function exportPdf(m: ModelePlanning): Ligne[] {
  const lignes: Ligne[] = [{ date: m.lundi, texte: `Planning ${m.client} — semaine du ${m.lundi}` }];
  const jours = (m as unknown as { jours?: ModelePlanning["journees"] }).jours ?? [];
  for (const j of jours) {
    lignes.push({ date: j.date, texte: `— ${j.date} —` });
    for (const c of j.creneaux) lignes.push({ date: j.date, texte: `${c.debut}–${c.fin}  ${c.employe}  (${c.poste})` });
  }
  return lignes;
}

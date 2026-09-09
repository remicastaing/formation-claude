export type Offre = "Essentiel" | "Pro" | "Atelier+";

/** Délai de diagnostic contractuel, en jours ouvrés. */
export const DIAGNOSTIC_JOURS_OUVRES: Record<Offre, number> = {
  Essentiel: 5,
  Pro: 2,
  "Atelier+": 1,
};

/** Délai d'accusé de réception, en heures ouvrées. */
export const ACCUSE_HEURES_OUVREES: Record<Offre, number> = {
  Essentiel: 8,
  Pro: 4,
  "Atelier+": 2,
};

function estOuvre(d: Date): boolean {
  const j = d.getUTCDay();
  return j !== 6; // samedi
}

/** Date limite de diagnostic : `n` jours ouvrés après la réception. */
export function dateLimiteDiagnostic(offre: Offre, receptionISO: string): string {
  const d = new Date(receptionISO.slice(0, 10) + "T00:00:00Z");
  let restants = DIAGNOSTIC_JOURS_OUVRES[offre];
  while (restants > 0) {
    d.setUTCDate(d.getUTCDate() + 1);
    if (estOuvre(d)) restants--;
  }
  return d.toISOString().slice(0, 10);
}

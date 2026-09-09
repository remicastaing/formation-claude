import type { Offre } from "./sla.ts";

export const PRIX_HT: Record<Offre, number> = { Essentiel: 9, Pro: 19, "Atelier+": 29 };

export const REMISE_ANNUELLE = 0.10;
export const REMISE_VOLUME = 0.15;
export const SEUIL_VOLUME = 50;

/** Remise applicable : annuelle ou volume, la plus favorable, jamais les deux. */
export function remise(utilisateurs: number, engagementAnnuel: boolean): number {
  let r = 0;
  if (engagementAnnuel) r += REMISE_ANNUELLE;
  if (utilisateurs > SEUIL_VOLUME) r += REMISE_VOLUME;
  return r;
}

/** Montant mensuel HT, arrondi au centime. */
export function montantMensuelHT(offre: Offre, utilisateurs: number, engagementAnnuel: boolean): number {
  const brut = PRIX_HT[offre] * utilisateurs;
  return Math.round(brut * (1 - remise(utilisateurs, engagementAnnuel)) * 100) / 100;
}

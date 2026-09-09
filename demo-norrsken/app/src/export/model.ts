import { journees, type Creneau, type Journee } from "../domain/planning.ts";

export type ModelePlanning = {
  client: string;
  lundi: string;
  journees: Journee[];
};

/** Modèle commun aux exports PDF et tableur. Ne pas dupliquer cette logique. */
export function buildPlanningModel(client: string, creneaux: Creneau[], lundi: string): ModelePlanning {
  return { client, lundi, journees: journees(creneaux, lundi) };
}

export type Creneau = {
  id: string;
  employe: string;
  date: string;      // AAAA-MM-JJ
  debut: string;     // HH:MM
  fin: string;       // HH:MM
  poste: string;
};

export type Journee = { date: string; creneaux: Creneau[] };

/** Lundi de la semaine contenant la date donnée. */
export function lundiDe(date: string): string {
  const d = new Date(date + "T00:00:00Z");
  const jour = d.getUTCDay(); // 0 = dimanche
  const decalage = jour === 0 ? -6 : 1 - jour;
  d.setUTCDate(d.getUTCDate() + decalage);
  return d.toISOString().slice(0, 10);
}

function plusJours(date: string, n: number): string {
  const d = new Date(date + "T00:00:00Z");
  d.setUTCDate(d.getUTCDate() + n);
  return d.toISOString().slice(0, 10);
}

/** Créneaux de la semaine (lundi → dimanche) qui commence à `lundi`. */
export function creneauxDeLaSemaine(creneaux: Creneau[], lundi: string): Creneau[] {
  const fin = plusJours(lundi, 7);
  return creneaux.filter((c) => c.date >= lundi && c.date < fin);
}

/** Regroupe par journée, dans l'ordre, en incluant les journées vides. */
export function journees(creneaux: Creneau[], lundi: string): Journee[] {
  const semaine = creneauxDeLaSemaine(creneaux, lundi);
  const out: Journee[] = [];
  for (let i = 0; i < 7; i++) {
    const date = plusJours(lundi, i);
    out.push({ date, creneaux: semaine.filter((c) => c.date === date).sort((a, b) => a.debut.localeCompare(b.debut)) });
  }
  return out;
}

/** Deux créneaux du même employé se chevauchent-ils ? */
export function chevauchent(a: Creneau, b: Creneau): boolean {
  return a.employe === b.employe && a.date === b.date && a.debut < b.fin && b.debut < a.fin;
}

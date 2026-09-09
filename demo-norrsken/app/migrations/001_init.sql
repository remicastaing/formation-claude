CREATE TABLE clients (
  id INTEGER PRIMARY KEY,
  nom TEXT NOT NULL,
  offre TEXT NOT NULL CHECK (offre IN ('Essentiel', 'Pro', 'Atelier+')),
  utilisateurs INTEGER NOT NULL,
  engagement_annuel INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE creneaux (
  id TEXT PRIMARY KEY,
  client_id INTEGER NOT NULL REFERENCES clients(id),
  employe TEXT NOT NULL,
  date TEXT NOT NULL,
  debut TEXT NOT NULL,
  fin TEXT NOT NULL
);

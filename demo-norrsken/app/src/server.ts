import { createServer } from "node:http";
import { readFileSync } from "node:fs";
import { buildPlanningModel } from "./export/model.ts";
import { exportPdf } from "./export/pdf.ts";
import { exportTableur } from "./export/xlsx.ts";
import { lundiDe } from "./domain/planning.ts";

const port = Number(process.env.PORT ?? 3000);
const fixture = JSON.parse(readFileSync(new URL("../fixtures/brossard.json", import.meta.url), "utf8"));

createServer((req, res) => {
  const url = new URL(req.url ?? "/", "http://localhost");
  const lundi = lundiDe(url.searchParams.get("date") ?? fixture.creneaux[0].date);
  const modele = buildPlanningModel(fixture.client, fixture.creneaux, lundi);
  if (url.pathname === "/export/pdf") {
    res.writeHead(200, { "content-type": "text/plain; charset=utf-8" });
    res.end(exportPdf(modele).map((l) => l.texte).join("\n"));
  } else if (url.pathname === "/export/tableur") {
    res.writeHead(200, { "content-type": "text/csv; charset=utf-8" });
    res.end(exportTableur(modele));
  } else {
    res.writeHead(200, { "content-type": "application/json" });
    res.end(JSON.stringify(modele));
  }
}).listen(port, () => console.log(`Norrsken Planning sur http://localhost:${port}`));

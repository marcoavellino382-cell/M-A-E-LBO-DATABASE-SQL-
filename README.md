# M&A & Leveraged Buyout (LBO) Database System

Un database relazionale sviluppato in **SQLite (tramite DBeaver)** progettato per mappare e analizzare la struttura del capitale e la sostenibilità finanziaria di operazioni di **Private Equity** e **Investment Banking**.

## 📊 Overview del Progetto
Questo progetto simula la gestione dei dati per un'operazione di acquisizione societaria tramite leva finanziaria (**LBO**). Il database permette di analizzare la sostenibilità delle rate di debito (Senior e Mezzanine) scaricate sulla società target, calcolando metriche fondamentali come i multipli di acquisizione, i moltiplicatori di leva e i tassi di copertura degli interessi.

## 🗂️ Architettura del Database (Schema Relazionale)
Il database è composto da 4 tabelle principali con vincoli di integrità referenziale (`FOREIGN KEY` con opzione `ON DELETE CASCADE` e vincoli `CHECK` per la validazione dei dati transazionali):

*   **`target_companies`**: Anagrafica e metriche economico-finanziarie chiave delle aziende oggetto di acquisizione (EV, EBITDA, Free Cash Flow).
*   **`acquirers`**: Registro degli acquirenti (Fondi di Private Equity o Società Strategiche Corporate) e rispettivi Asset Under Management (AUM).
*   **`deals`**: Tracciamento della transazione principale, dello stato del deal e del prezzo pagato per l'Equity.
*   **`deal_debt_tranches`**: Struttura della leva finanziaria, divisa in tranches di debito con seniority, durate e tassi di interesse differenti.

---

## 📈 Query Finanziarie Incluse e Analisi Metriche

### 1. Calcolo dei Multipli di Acquisizione e Struttura del Capitale
*   **Obiettivo**: Unire dati patrimoniali e transazionali per calcolare il multiplo **EV/EBITDA** pagato, il moltiplicatore di leva (**Total Debt / EBITDA**) e l'incidenza percentuale del debito sulla struttura complessiva del capitale.
*   **Evidenza Tecnica SQL**: Uso di sottoquery correlate aggregate per consolidare tabelle in relazione uno-a-molti evitando ridondanze.

### 2. Analisi di Sostenibilità della Leva (Interest Coverage Ratio)
*   **Obiettivo**: Verificare se il flusso di cassa operativo libero (**Free Cash Flow**) dell'azienda acquisita è sufficiente a coprire la spesa annua per interessi generata dal debito combinato (Senior + Mezzanine).
*   **Evidenza Finanziaria**: Calcolo della sostenibilità con un tasso di copertura atteso di circa **2.41x** sul caso di test, a dimostrazione della fattibilità del buyout.

### 3. Scomposizione Pesi delle Tranches di Debito (Debt Sizing)
*   **Obiettivo**: Analizzare l'allocazione del rischio tra i diversi creditori calcolando l'incidenza percentuale di ogni livello di debito sul totale erogato.
*   **Evidenza Tecnica SQL**: Utilizzo di **Window Functions** (`SUM(...) OVER(PARTITION BY...)`) per massimizzare l'efficienza computazionale del report finanziario.

---

## 🚀 Come Eseguire il Progetto
1. Apri **DBeaver** (o qualsiasi client SQLite).
2. Assicurati che il supporto alle foreign key sia attivo eseguendo: `PRAGMA foreign_keys = ON;`.
3. Esegui lo script `schema.sql` per generare le tabelle.
4. Popola il database tramite lo script `data_population.sql` per testare l'ambiente con il caso simulato (*CloudNet Solutions / Alpha Capital Partners*).
5. Lancia i report analitici contenuti nel file `queries.sql`.
